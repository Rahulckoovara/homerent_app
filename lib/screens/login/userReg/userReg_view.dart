import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';
import 'package:tappal_app/screens/login/login/login_view.dart';
import 'package:tappal_app/screens/login/userReg/userReg_logic.dart';
import 'package:tappal_app/widgets/Text_input.dart';
import 'package:tappal_app/widgets/fileuploader.dart';
import 'package:tappal_app/widgets/primary_button.dart';

class UserRegPage extends StatelessWidget {
  const UserRegPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(RegisterLogic());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                color: const Color.fromRGBO(4, 85, 92, 1),
                child: const SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Find",
                            style: TextStyle(
                                fontSize: 35,
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
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height / 9.5,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.all(CustomDimens.commonPadding),
                      child: SingleChildScrollView(
                          child: Column(children: [
                        SizedBox(
                          height: CustomDimens.spacerH,
                        ),
                        Obx(() => Uploader(
                              () {
                                logic.uploadFile();
                              },
                              backgroundImage: logic.base64Images.isNotEmpty
                                  ? MemoryImage(
                                      base64Decode(logic.base64Images.last),
                                    )
                                  : null,
                            )),
                        SizedBox(
                          height: CustomDimens.spacerH,
                        ),
                        Obx(
                          () => TextInput(
                            "Email",
                            "Enter email",
                            null,
                            false,
                            (value) {
                              logic.setUserId(value);
                            },
                            errorText: logic.userIdError.value,
                          ),
                        ),
                        //Switch(value: false, onChanged: (value) {}),

                        SizedBox(
                          height: CustomDimens.spacerH,
                        ),

                        Obx(
                          () => TextInput(
                            "Username",
                            "Enter username",
                            null,
                            false,
                            (value) {
                              logic.setUserName(value);
                            },
                            errorText: logic.nameError.value,
                          ),
                        ),
                        SizedBox(
                          height: CustomDimens.spacerH,
                        ),                       
                        Obx(() => Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 100,
                                    child:
                                    TextInput(
                                      "Age",
                                      "Age",
                                      null,
                                      false,
                                      (val) {},
                                      keyboardType: TextInputType.number,
                                    )),
                                SizedBox(
                                  width: CustomDimens.spacerH,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Is Owner ",
                                      style: TextStyle(
                                          fontFamily: CustomFont.fontSemiBold,
                                          fontSize: CustomDimens.txtHintFont,
                                          color: CustomColors.txtHint),
                                    ),
                                    Switch(
                                      activeTrackColor:
                                          CustomColors.primaryColor,
                                      activeColor: Colors.white,
                                      value: logic.isOwner.value,
                                      onChanged: (value) {
                                        logic.setIsOwner(value);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        const SizedBox(
                          height: 30,
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
                        Obx(
                          () => TextInput(
                              "Confirm Password", "Enter password", null, true,
                              (value) {
                            logic.setConfirmPassword(value);
                          },
                              maxlines: 1,
                              errorText: logic.confirmPasswordError.value),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: double.infinity,
                            child: PrimaryButton(() {
                              logic.login();
                            }, "REGISTER")),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            GestureDetector(
                              onTap: () {
                                Get.to(const LoginPage());
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 3, 130, 233)),
                              ),
                            ),
                          ],
                        )
                        // TextButton(
                        //     onPressed: () {},
                        //     child: Text("Already have an account? Login"))
                      ])))))
        ],
      ),
    );
  }
}
