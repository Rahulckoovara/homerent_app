import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/screens/loginLoader/login_loader_logic.dart';
import 'package:tappal_app/widgets/progressbar.dart';

class LoginLoaderPage extends StatelessWidget {
  const LoginLoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginLoaderLogic());

    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Progressbar(), Text("Please wait", style: TextStyle())],
        ),
      ),
    ));
  }
}
