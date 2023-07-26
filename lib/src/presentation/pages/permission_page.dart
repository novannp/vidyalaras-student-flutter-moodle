import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  Future<void> requestPermission() async {
    await Permission.manageExternalStorage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/img/permission.png'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Izinkan Akses',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Text(
                  'Berikan akses untuk melanjutkan agar aplikasi dapat berjalan dengan baik',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FilledButton(
                      onPressed: () {
                        requestPermission();
                      },
                      child: const Text('Izinkan Akses')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
