// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:tappal_app/config/custom_colors.dart';
// import 'package:tappal_app/config/custom_dia.dart';
// import 'package:tappal_app/config/custom_fonts.dart';
// import 'package:tappal_app/screens/login/login_logic.dart';
// import 'package:tappal_app/screens/login/registerpage/register_logic.dart';
// import 'package:tappal_app/widgets/fileuploader.dart';
// import 'package:tappal_app/widgets/primary_button.dart';
// import 'package:tappal_app/widgets/text_input.dart';

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final logic = Get.put(RegisterLogic());

//     return Scaffold(
//         body: Stack(children: [
//       Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.3,
//             width: double.infinity,
//             color: CustomColors.primaryColor,
//             child: SafeArea(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Find",
//                         style: TextStyle(
//                             fontSize: 35,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: CustomFont.fontBold,
//                             color: Colors.white),
//                       ),
//                       Text(
//                         " Home",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             fontFamily: CustomFont.fontSemiBold),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )),
//       Positioned(
//           top: MediaQuery.of(context).size.height * 0.2,
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(50),
//                 topRight: Radius.circular(50),
//               ),
//               color: Color.fromARGB(255, 255, 255, 255),
//             ),
//             width: double.infinity,
//             child: Padding(
//               padding: EdgeInsets.all(CustomDimens.commonPadding),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: CustomDimens.spacerH,
//                     ),
//                     Uploader(() {
//                       logic.uploadFile();
//                     }),
//                     SizedBox(
//                       height: CustomDimens.spacerH,
//                     ),
//                     TextInput("Email", "Enter email", null, false, (value) {
//                       logic.setUserId(value);
//                     },
//                     ),
//                     SizedBox(
//                       height: CustomDimens.spacerH,
//                     ),
//                     TextInput("Password", "Enter password", null, true,
//                         (value) {
//                       logic.setPassword(value);
//                     },
                    
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextInput("Confirm Password", "Enter password", null, true,
//                         (value) {
//                       logic.setConfirmPassword(value);
//                     }),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Container(
//                         width: double.infinity,
//                         child: PrimaryButton(() {}, "REGISTER"))
//                   ],
//                 ),
//               ),
//             ),
//           ))
//     ]));
//   }
// }

// // class ProfilePicturePicker extends StatelessWidget {
// //   const ProfilePicturePicker({super.key});

// //   Future<void> _pickImage(BuildContext context) async {
// //     final picker = ImagePicker();
// //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// //     if (pickedFile != null) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text('Profile picture selected.')));
// //       // Handle the selected file further as needed
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () => _pickImage(context),
// //       child: CircleAvatar(
// //         radius: 50,
// //         backgroundColor: Colors.grey[200],
// //         child: Icon(
// //           Icons.camera_alt,
// //           color: Colors.grey[800],
// //           size: 50,
// //         ),
// //       ),
// //     );
// //   }
