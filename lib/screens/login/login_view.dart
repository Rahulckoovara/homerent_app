import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/widgets/Text_input.dart';
import 'package:tappal_app/widgets/primary_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            color: CustomColors.primaryColor,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/home_icon.png',
                    height: 100,
                    width: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Find",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        " Home",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 2.1,
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
                    TextInput("Email", "enter email", null, false, null),
                    SizedBox(
                      height: CustomDimens.spacerH,
                    ),
                    TextInput("Password", "enter password", null, true, null),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: double.infinity,
                        child: PrimaryButton(() {}, "LOGIN"))
                  ],
                ),
              ),
            ),
          ))
    ]));
  }
}
