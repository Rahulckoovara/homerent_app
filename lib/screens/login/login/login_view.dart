import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';
import 'package:tappal_app/screens/login/login/login_logic.dart';
import 'package:tappal_app/screens/login/userReg/userReg_view.dart';
import 'package:tappal_app/widgets/Text_input.dart';
import 'package:tappal_app/widgets/primary_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginLogic());

    return Scaffold(
        body: Stack(children: [
      Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [
            //       CustomColors.primaryColor,
            //       Colors.green,
            //     ],
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //   ),
            //   borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(30),
            //     bottomRight: Radius.circular(30),
            //   ),
            // ),
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            color: CustomColors.primaryColor,
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Image.asset(
                    'assets/home_icon.png',
                    height: 70,
                    width: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Find",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: CustomFont.fontBold,
                            color: Colors.white),
                      ),
                      Text(
                        " Home",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: CustomFont.fontSemiBold),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 4,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            //  height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(CustomDimens.commonPadding),
              child: SingleChildScrollView(
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: CustomDimens.spacerH,
                    ),
                    Obx(() {
                      return TextInput(
                        "Email",
                        "Enter email",
                        null,
                        false,
                        (value) {
                          logic.setUserId(value);
                        },
                        errorText: logic.userIdError.value,
                      );
                    }),
                    SizedBox(
                      height: CustomDimens.spacerH,
                    ),
                    Obx(
                      () => TextInput(
                        "Password",
                        "Enter password",
                        null,
                        true,
                        (value) {
                          logic.setPassword(value);
                        },
                        maxlines: 1,
                        errorText: logic.passwordError.value,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: double.infinity,
                        child: PrimaryButton(() {
                          logic.login();
                        }, "LOGIN")),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Create new account?"),
                        GestureDetector(
                          onTap: () {
                            Get.to(const UserRegPage());
                          },
                          child: const Text(
                            " Register",
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 130, 233)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),

      // Loading dialog
      // Obx(() {
      //   if (logic.isLoading.value) {
      //     Future.delayed(Duration.zero, () {
      //       // Show the loading dialog
      //       Get.dialog(
      //         const AlertDialog(
      //           content: Row(
      //             children: [
      //               CircularProgressIndicator(),
      //               SizedBox(width: 20),
      //               Text("Logging in..."),
      //             ],
      //           ),
      //         ),
      //         barrierDismissible: false,
      //       );
      //     });
      //   } else {
      //     if (Get.isDialogOpen!) {
      //       Get.back(); // Close the dialog when loading is false
      //     }
      //   }
      //   return SizedBox.shrink();
      // }),
    ]));
  }
}
