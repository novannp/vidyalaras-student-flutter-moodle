import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms_pptik/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/main_index/main_index_cubit.dart';
import 'package:lms_pptik/src/presentation/blocs/upload/upload_file_bloc.dart';

import '../../data/models/user_model/user_model.dart';
import '../../utils/constant.dart';
import '../blocs/user/user_bloc.dart';
import '../components/course_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<GetCurrentUserBloc, UserState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: state.maybeWhen(
                          loading: () {
                            return null;
                          },
                          loaded: (user) {
                            user as UserModel;
                            return NetworkImage(user.profileimageurl!);
                          },
                          orElse: () {
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.maybeWhen(
                              loading: () {
                                return "User";
                              },
                              loaded: (user) {
                                user as UserModel;
                                return user.fullname!;
                              },
                              orElse: () {
                                return "User";
                              },
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            state.maybeWhen(
                              loading: () {
                                return 'Username | Email';
                              },
                              loaded: (user) {
                                user as UserModel;
                                return '${user.email}';
                              },
                              orElse: () {
                                return 'Username | Email';
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            showDragHandle: true,
                            useSafeArea: true,
                            context: context,
                            transitionAnimationController: AnimationController(
                              vsync: Navigator.of(context),
                              duration: const Duration(milliseconds: 300),
                            ),
                            builder: (context) {
                              return const MyProfileScreen();
                            },
                          );
                        },
                        leading: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.indigo,
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: const Text('Profil Saya'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.amber,
                          ),
                          child: const Icon(
                            Icons.file_copy,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: const Text('Manajemen File'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          context.read<MainIndexCubit>().changeIndex(2);
                        },
                        leading: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.lightBlue,
                          ),
                          child: const Icon(
                            Icons.security,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: const Text('Lencana'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: const Text('Nilai'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          GoRouter.of(context).pushNamed('settings');
                        },
                        leading: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.teal,
                          ),
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: const Text('Pengaturan'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),
                      BlocConsumer<AuthLogoutBloc, AuthState>(
                          listener: (context, state) {
                        state.whenOrNull(loading: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const LoadingDialog();
                              });
                        }, success: () {
                          GoRouter.of(context).pop();

                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  GoRouter.of(context).pop();
                                  context.pushReplacement('/login');
                                });
                                return const SuccessDialog();
                              });
                        });
                      }, builder: (context, state) {
                        return ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: const Text('Apakah anda yakin?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context
                                              .read<AuthLogoutBloc>()
                                              .add(const AuthEvent.logout());
                                          context
                                              .read<MainIndexCubit>()
                                              .changeIndex(0);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Ya'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Tidak'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          leading: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.red,
                            ),
                            child: const Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          title: const Text('Keluar'),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.black,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: 'Vidyalaras for Student',
                        applicationVersion: version,
                        children: [
                          const Text(
                            'Vidyalaras for Student adalah platform pembelajaran untuk membantu proses belajar mengajar',
                          )
                        ],
                        applicationIcon: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/img/app_icon-2.png',
                              height: 60,
                            ),
                          ),
                        ),
                      );
                    },
                    leading: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey,
                      ),
                      child: const Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    title: const Text('Tentang'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile;

    try {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } catch (e) {}

    return pickedFile;
  }

  Future<XFile?> captureImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile;

    try {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } catch (e) {}

    return pickedFile;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentUserBloc, UserState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: state.maybeWhen(
                        loading: () {
                          return null;
                        },
                        loaded: (user) {
                          user as UserModel;
                          return NetworkImage(user.profileimageurl!);
                        },
                        orElse: () {
                          return null;
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 20),
                                    MultiBlocListener(
                                      listeners: [
                                        BlocListener<UploadFileBloc,
                                            UploadFileState>(
                                          listener: (context, state) {
                                            state.whenOrNull(
                                              loading: () {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return const AlertDialog(
                                                        content: Text(
                                                            'Sedang mengunggah foto...'),
                                                      );
                                                    });
                                              },
                                              loaded: (data) {
                                                context
                                                    .read<UpdatePictureBloc>()
                                                    .add(
                                                        UserEvent.updatePicture(
                                                            data[0].itemid!));
                                              },
                                            );
                                          },
                                        ),
                                        BlocListener<UpdatePictureBloc,
                                            UserState>(
                                          listener: (context, state) {
                                            state.whenOrNull(
                                              loading: () {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return const AlertDialog(
                                                        content: Text(
                                                            'Menyimpan perubahan....'),
                                                      );
                                                    });
                                              },
                                              loaded: (data) {
                                                Navigator.pop(context);
                                                context
                                                    .read<GetCurrentUserBloc>()
                                                    .add(const UserEvent
                                                        .getCurrenctUser());
                                                Navigator.pop(context);
                                                Navigator.of(context).pop();
                                              },
                                            );
                                          },
                                        )
                                      ],
                                      child: ListTile(
                                        onTap: () async {
                                          pickImage().then((value) {
                                            if (value != null) {
                                              File file = File(value.path);
                                              context
                                                  .read<UploadFileBloc>()
                                                  .add(UploadFileEvent
                                                      .uploadFile([file]));
                                            }
                                          });
                                        },
                                        leading: const Icon(Icons.image),
                                        title: const Text('Pilih dari galeri'),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () async {
                                        captureImage().then((value) {
                                          if (value != null) {
                                            File file = File(value.path);
                                            context.read<UploadFileBloc>().add(
                                                UploadFileEvent.uploadFile(
                                                    [file]));
                                          }
                                        });
                                      },
                                      leading: const Icon(Icons.camera),
                                      title: const Text('Buka kamera'),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const CircleAvatar(
                          radius: 14,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  state.maybeWhen(
                    loading: () {
                      return "User";
                    },
                    loaded: (user) {
                      user as UserModel;
                      return user.fullname!;
                    },
                    orElse: () {
                      return "User";
                    },
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Profil',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 0,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Nama pengguna',
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        state.maybeWhen(
                          loading: () {
                            return "User";
                          },
                          loaded: (user) {
                            user as UserModel;
                            return user.username!;
                          },
                          orElse: () {
                            return "User";
                          },
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Nama lengkap',
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        state.maybeWhen(
                          loading: () {
                            return "User";
                          },
                          loaded: (user) {
                            user as UserModel;
                            return user.fullname!;
                          },
                          orElse: () {
                            return "User";
                          },
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Email',
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        state.maybeWhen(
                          loading: () {
                            return "User";
                          },
                          loaded: (user) {
                            user as UserModel;
                            return user.email!;
                          },
                          orElse: () {
                            return "User";
                          },
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Role',
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        state.maybeWhen(
                          loading: () {
                            return "User";
                          },
                          loaded: (user) {
                            user as UserModel;
                            return user.roles?[0].shortname ?? "-";
                          },
                          orElse: () {
                            return "User";
                          },
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
