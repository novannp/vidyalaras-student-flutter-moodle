import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/constant.dart';
import '../../utils/helper/secure_storage/secure_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      if (await Permission.manageExternalStorage.isDenied ||
          await Permission.mediaLibrary.isDenied) {
        GoRouter.of(context).pushReplacementNamed('permission');
      } else {
        StorageHelper().read('token').then((value) {
          if (value != null) {
            GoRouter.of(context).pushReplacementNamed('main');
          } else {
            GoRouter.of(context).pushReplacementNamed('login');
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/img/app_icon.png',
              height: 80,
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 50,
              ),
              child: Column(
                children: [
                  Text(
                    "Pusat Penelitian Teknologi Informasi dan Komunikasi",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    version,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
