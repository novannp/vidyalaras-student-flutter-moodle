import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lms_pptik/src/data/models/chat_model/send_message_model.dart';
import 'package:lms_pptik/src/data/models/conversation_model/conversation.dart';
import 'package:lms_pptik/src/data/models/member_model.dart';
import 'package:lms_pptik/src/extensions/int_extension.dart';
import 'package:lms_pptik/src/presentation/blocs/user/user_bloc.dart';
import 'package:lms_pptik/src/presentation/components/snackbar.dart';

import '../../data/models/chat_model/chat_model.dart';
import '../../data/models/chat_model/message.dart';
import '../../data/models/user_model.dart';
import '../../utils/helper/function_helper/function_helper.dart';
import '../blocs/chat/chat_bloc.dart';
import '../components/bubble_chat.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage(
      {super.key, this.conversationId, required this.memberId});

  final int? conversationId;
  final int memberId;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  late ScrollController _scrollController;
  late TextEditingController _messageController;
  List<Message>? _messages = [];

  late Timer timer;

  jumpToStart() {
    _scrollController.jumpTo(
      _scrollController.position.minScrollExtent,
    );
  }

  @override
  initState() {
    Future.microtask(
      () => context.read<GetConversationBetweenUserBloc>().add(
            ChatEvent.getConversationBetweenUser(widget.memberId),
          ),
    );
    _messageController = TextEditingController();
    _scrollController = ScrollController();
    if (widget.conversationId != null) {
      timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        context
            .read<GetConversationMessageBloc>()
            .add(ChatEvent.getConversationMessage(widget.conversationId!));
      });
    } else {
      context.read<GetConversationMessageBloc>().add(
            const ChatEvent.resetMessage(),
          );
    }
    context
        .read<GetMemberInfoBloc>()
        .add(ChatEvent.getMemberInfo(widget.memberId));

    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    if (widget.conversationId != null) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .read<GetConversationMessageBloc>()
            .add(const ChatEvent.resetMessage());
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<GetConversationBetweenUserBloc, ChatState>(
              builder: (context, state) {
                return state.maybeWhen(loaded: (data) {
                  data as ConversationModel;
                  return IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          constraints: const BoxConstraints(
                              maxHeight: 400, minHeight: 100),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: Wrap(
                                children: [
                                  _favoriteOption(data),
                                  _removeOption(data),
                                  _blockOption(data),
                                  ListTile(
                                    leading: const Icon(Icons.person_add),
                                    title: const Text('Tambahkan ke kontak'),
                                    onTap: () => Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    icon: const Icon(Icons.more_vert),
                  );
                }, orElse: () {
                  return const SizedBox();
                });
              },
            ),
          ],
          leadingWidth: 50,
          leading: IconButton(
            splashRadius: 20,
            onPressed: GoRouter.of(context).pop,
            icon: const Icon(Icons.arrow_back),
          ),
          automaticallyImplyLeading: false,
          title: BlocBuilder<GetMemberInfoBloc, ChatState>(
              builder: (context, state) {
            return ListTile(
              titleTextStyle: const TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.zero,
              leading: state.maybeWhen(loaded: (data) {
                data as MemberModel;
                return CircleAvatar(
                  backgroundImage: NetworkImage(data.profileimageurl),
                );
              }, orElse: () {
                return const CircleAvatar(
                  child: Icon(Icons.person),
                );
              }),
              title: Text(
                state.maybeWhen(loaded: (data) {
                  data as MemberModel;
                  return data.fullname;
                }, orElse: () {
                  return 'User';
                }),
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              subtitle: state.maybeWhen(loaded: (data) {
                data as MemberModel;
                return Text(
                  data.isonline == null
                      ? 'Offline'
                      : data.isonline!
                          ? 'Online'
                          : 'Offline',
                  style: Theme.of(context).textTheme.titleSmall!,
                );
              }, orElse: () {
                return const SizedBox();
              }),
            );
          }),
        ),
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<GetConversationMessageBloc, ChatState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (data) {
                      data as ChatModel;
                      _messages = data.messages as List<Message>;
                      if (data.messages!.isEmpty) {
                        const Center(
                          child: Text('Belum ada pesan'),
                        );
                      }
                      return buildChatScreen(data, context);
                    },
                    initial: () {
                      return SizedBox.expand(
                        child: Container(
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: Text('Belum ada pesan'),
                          ),
                        ),
                      );
                    },
                    error: (message) {
                      return Center(
                        child: Text(message),
                      );
                    },
                    orElse: () {
                      return SizedBox.expand(
                        child: Container(
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            buildMessageTextField(context),
          ],
        ),
      ),
    );
  }

  MultiBlocListener _blockOption(ConversationModel data) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BlockUserBloc, ChatState>(listener: (context, state) {
          state.whenOrNull(loaded: (status) {
            context.pop();
            context.pop();
            showSnackbar(context, "Block pengguna ", isWarning: true);

            context
                .read<GetConversationBetweenUserBloc>()
                .add(ChatEvent.getConversationBetweenUser(widget.memberId));
          });
        }),
        BlocListener<UnblockUserBloc, ChatState>(listener: (context, state) {
          context.pop();
          context.pop();
          showSnackbar(context, "Berhasil Unblock pengguna");
          context
              .read<GetConversationBetweenUserBloc>()
              .add(ChatEvent.getConversationBetweenUser(widget.memberId));
        })
      ],
      child: ListTile(
        leading: data.members![0].isblocked!
            ? const Icon(Icons.check_circle_outline)
            : const Icon(Icons.block),
        title: Text(data.members![0].isblocked! ? "Unblock" : "Block"),
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                        "Yakin ${data.members![0].isblocked! ? "unblock" : "block"} pengguna ini?"),
                    actions: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Kembali")),
                      ElevatedButton(
                          onPressed: () {
                            if (data.members![0].isblocked!) {
                              context
                                  .read<UnblockUserBloc>()
                                  .add(ChatEvent.unblockUser(widget.memberId));
                            } else {
                              context
                                  .read<BlockUserBloc>()
                                  .add(ChatEvent.blockUser(widget.memberId));
                            }
                          },
                          child: Text(data.members![0].isblocked!
                              ? "Unblock"
                              : "Block"))
                    ],
                  ));
        },
      ),
    );
  }

  MultiBlocListener _favoriteOption(ConversationModel data) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SetConversationsFavoriteBloc, ChatState>(
          listener: (context, state) {
            state.whenOrNull(loaded: (status) {
              context.pop();
              showSnackbar(
                context,
                "Berhasil ditambahkan ke favorite",
              );
              context
                  .read<GetConversationBetweenUserBloc>()
                  .add(ChatEvent.getConversationBetweenUser(widget.memberId));
            });
          },
        ),
        BlocListener<UnsetConversationsFavoriteBloc, ChatState>(
          listener: (context, state) {
            state.whenOrNull(loaded: (status) {
              context.pop();
              showSnackbar(
                context,
                "Berhasil dihapus dari favorite",
              );
              context
                  .read<GetConversationBetweenUserBloc>()
                  .add(ChatEvent.getConversationBetweenUser(widget.memberId));
            });
          },
        ),
      ],
      child: ListTile(
        leading: data.isfavourite!
            ? const Icon(
                Icons.favorite,
                color: Colors.pink,
              )
            : const Icon(Icons.favorite),
        title: Text(
            data.isfavourite! ? "Hapus dari favorit" : 'Tambahkan ke favorit'),
        onTap: () {
          if (data.isfavourite!) {
            context
                .read<UnsetConversationsFavoriteBloc>()
                .add(ChatEvent.unsetConversationFavorite(data.id!));
          } else {
            context
                .read<SetConversationsFavoriteBloc>()
                .add(ChatEvent.setConversationFavorite(data.id!));
          }
        },
      ),
    );
  }

  BlocConsumer<DeleteConversationBloc, ChatState> _removeOption(
      ConversationModel data) {
    return BlocConsumer<DeleteConversationBloc, ChatState>(
      listener: (context, state) {
        state.whenOrNull(loaded: (message) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          GoRouter.of(context).pushReplacementNamed('chat');
          showSnackbar(context, "Berhasil dihapus");
          context
              .read<GetConversationsBloc>()
              .add(const ChatEvent.getConversations());
        });
      },
      builder: (context, state) {
        return ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Hapus Percakapan'),
          onTap: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text("Yakin menghapus percakapan ini?"),
                      actions: [
                        OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Kembali")),
                        ElevatedButton(
                            onPressed: () {
                              context.read<DeleteConversationBloc>().add(
                                    ChatEvent.deleteConversation(
                                      data.id!,
                                    ),
                                  );
                            },
                            child: const Text("Hapus"))
                      ],
                    ));
          },
        );
      },
    );
  }

  Container buildChatScreen(ChatModel data, BuildContext context) {
    return Container(
      color: Theme.of(context)
          .canvasColor
          .withBlue(240)
          .withGreen(240)
          .withRed(240),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                reverse: true,
                controller: _scrollController,
                itemCount: data.messages!.length,
                itemBuilder: (context, index) {
                  final message = data.messages![index];
                  final previousMessage = index < data.messages!.length - 1
                      ? data.messages![index + 1]
                      : null;
                  final showDateSection = previousMessage == null ||
                      !FunctionHelper.isSameDay(
                          message.timecreated!.toDateTime(),
                          previousMessage.timecreated!.toDateTime());

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (showDateSection)
                        Align(
                            alignment: Alignment.center,
                            child: buildDateSection(
                                message.timecreated!.toDateTime())),
                      BlocBuilder<GetCurrentUserBloc, UserState>(
                          builder: (context, state) {
                        return BubbleChat(
                          date: message.timecreated!.toHoursString(),
                          isReceiver: message.useridfrom !=
                              state.maybeWhen(loaded: (data) {
                                data as UserModel;
                                return data.id;
                              }, orElse: () {
                                return 0;
                              }),
                          message: message.text!,
                        );
                      }),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget buildMessageTextField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: _messageController,
              maxLines: null,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                // fillColor: Colors.grey.shade200,
                hintText: 'Ketik pesan...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          BlocConsumer<SendInstantMessageBloc, ChatState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (message) {
                  message as SendMessageModel;
                  context.read<GetConversationMessageBloc>().add(
                        ChatEvent.getConversationMessage(
                          message.conversationid,
                        ),
                      );
                },
              );
            },
            builder: (context, state) {
              return IconButton(
                onPressed: _messageController.text.isEmpty
                    ? null
                    : () {
                        BlocProvider.of<SendInstantMessageBloc>(context).add(
                          ChatEvent.sendInstantMessage(
                            widget.memberId,
                            _messageController.text,
                          ),
                        );
                        _messageController.clear();
                      },
                icon: const Icon(Icons.send),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildDateSection(DateTime timestamp) {
    final currentDate = DateTime.now();
    final messageDate = DateTime(
      timestamp.year,
      timestamp.month,
      timestamp.day,
    );

    String dateText;
    if (currentDate.difference(messageDate).inDays == 0) {
      dateText = 'Hari ini';
    } else if (currentDate.difference(messageDate).inDays == 1) {
      dateText = 'Kemarin';
    } else {
      dateText = DateFormat('d MMMM, yyyy').format(timestamp);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        dateText,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
