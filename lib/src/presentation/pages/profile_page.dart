import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_pptik/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:lms_pptik/src/presentation/blocs/main_index/main_index_cubit.dart';

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
                            return NetworkImage(user.avatar!);
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
                                return user.name!;
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
                                return '${user.username} | ${user.email}';
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
                        onTap: () {},
                        leading: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.indigo,
                          ),
                          child: const Icon(
                            Icons.manage_accounts,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: const Text('Edit Profil'),
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
                                  GoRouter.of(context).replaceNamed('login');
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
                        applicationName: 'LMS PPTIK',
                        applicationVersion: version,
                        children: [
                          const Text(
                            'LMS PPTIK adalah platform pembelajaran untuk membantu proses belajar mengajar',
                          )
                        ],
                        applicationIcon: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/img/app_icon.png',
                              height: 30,
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
