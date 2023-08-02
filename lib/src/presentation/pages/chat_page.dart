import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_pptik/src/extensions/int_extension.dart';
import 'package:lms_pptik/src/utils/helper/function_helper/function_helper.dart';

import '../../data/models/conversation_model/conversation.dart';
import '../blocs/chat/chat_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<ConversationModel> _previousConversations = [];
  Timer? timer;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      context
          .read<GetConversationsBloc>()
          .add(const ChatEvent.getConversations());
    });
    super.initState();
  }

  @override
  dispose() {
    timer!.cancel();
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Obrolan'),
          bottom: const TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            tabs: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Text('Pribadi'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people,
                  ),
                  Text('Grup'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star),
                  Text('Favorit'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildPrivateConversation(),
            const Center(
              child: Text('Grup'),
            ),
            buildStarredConversation(),
          ],
        ),
      ),
    );
  }

  BlocBuilder<GetConversationsBloc, ChatState> buildPrivateConversation() {
    return BlocBuilder<GetConversationsBloc, ChatState>(
      builder: (context, state) {
        return state.maybeWhen(initial: () {
          return const SizedBox();
        }, loaded: (conversations) {
          conversations as List<ConversationModel>;
          _previousConversations = conversations;
          return ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                final conversation = conversations[index];
                return ListTile(
                  onTap: () {
                    GoRouter.of(context).pushNamed('chat_detail', extra: {
                      "memberId": conversation.members![0].id,
                      "conversationId": conversation.id,
                    });
                  },
                  leading: const CircleAvatar(),
                  title: Text(conversation.members![0].fullname!),
                  subtitle: Html(
                    style: {
                      'p': Style(
                        textAlign: TextAlign.left,
                        textOverflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                      ),
                    },
                    data: conversation.messages![0].text!,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FunctionHelper.isSameDay(
                                conversation.messages![0].timecreated!
                                    .toDateTime(),
                                DateTime.now())
                            ? conversation.messages![0].timecreated!
                                .toHoursString()
                            : conversation.messages![0].timecreated!.toDate(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Badge(
                        isLabelVisible: !conversation.isread!,
                        label: conversation.unreadcount == null
                            ? const Text('0')
                            : Text(conversation.unreadcount.toString()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                );
              });
        }, error: (message) {
          return Center(
            child: Text(message),
          );
        }, orElse: () {
          return ListView.builder(
              itemCount: _previousConversations.length,
              itemBuilder: (context, index) {
                final conversation = _previousConversations[index];
                return ListTile(
                  onTap: () {
                    GoRouter.of(context).pushNamed('chat_detail', extra: {
                      "memberId": conversation.members![0].id,
                      "conversationId": conversation.id,
                    });
                  },
                  leading: const CircleAvatar(),
                  title: Text(conversation.members![0].fullname!),
                  subtitle: Html(
                    style: {
                      'p': Style(
                        textAlign: TextAlign.left,
                        textOverflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                      ),
                    },
                    data: conversation.messages![0].text!,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FunctionHelper.isSameDay(
                                conversation.messages![0].timecreated!
                                    .toDateTime(),
                                DateTime.now())
                            ? conversation.messages![0].timecreated!
                                .toHoursString()
                            : conversation.messages![0].timecreated!.toDate(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Badge(
                        isLabelVisible: !conversation.isread!,
                        label: conversation.unreadcount == null
                            ? const Text('0')
                            : Text(conversation.unreadcount.toString()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                );
              });
        });
      },
    );
  }

  BlocBuilder<GetConversationsBloc, ChatState> buildStarredConversation() {
    return BlocBuilder<GetConversationsBloc, ChatState>(
      builder: (context, state) {
        return state.maybeWhen(initial: () {
          return const SizedBox();
        }, loaded: (conversations) {
          conversations as List<ConversationModel>;
          final privateConversation = conversations
              .where((element) => element.isfavourite == true)
              .toList();
          return ListView.builder(
              itemCount: privateConversation.length,
              itemBuilder: (context, index) {
                final conversation = privateConversation[index];
                return ListTile(
                  onTap: () {},
                  leading: const CircleAvatar(),
                  title: Text(conversation.members![0].fullname!),
                  subtitle: Html(
                    style: {
                      'p': Style(
                        textAlign: TextAlign.left,
                        textOverflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                      ),
                    },
                    data: conversation.messages![0].text!,
                  ),
                  trailing: Text(
                    FunctionHelper.isSameDay(
                            conversation.messages![0].timecreated!.toDateTime(),
                            DateTime.now())
                        ? conversation.messages![0].timecreated!.toHoursString()
                        : conversation.messages![0].timecreated!.toDate(),
                  ),
                );
              });
        }, orElse: () {
          return const Center(
            child: Text('Gagal memuat data obrolan'),
          );
        });
      },
    );
  }
}
