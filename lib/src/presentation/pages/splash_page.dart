import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      StorageHelper().read('token').then((value) {
        if (value != null) {
          GoRouter.of(context).pushReplacementNamed('main');
        } else {
          GoRouter.of(context).pushReplacementNamed('login');
        }
      });
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
            Icon(
              Icons.school_rounded,
              size: 40,
              color: Colors.blue.shade900,
            ),
            const Text(
              "LMS PPTIK",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
