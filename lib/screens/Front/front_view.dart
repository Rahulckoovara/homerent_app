import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/screens/Front/front_logic.dart';
import 'package:tappal_app/widgets/favourites_tile.dart';
import 'package:tappal_app/widgets/primary_button.dart';
import 'package:lottie/lottie.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(FrontLogic());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(CustomDimens.commonPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find Your \nApartment Here',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: CustomDimens.spacerH),
                Text(
                  'Most it diagrams headline of should there with practice to and with my sections.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: CustomDimens.spacerH),
                SizedBox(height: CustomDimens.spacerH),
                PrimaryButton(() {
                  logic.goToLogin();
                }, 'Get Started'),
                CustomListTile(
                    leadingImageUrl:
                        'https://th.bing.com/th/id/R.a1d4a6f8ba9cf40bbe69c6e47546e8a3?rik=dgUZMgnDeoL7Dw&riu=http%3a%2f%2fwww.luxxu.net%2fblog%2fwp-content%2fuploads%2f2017%2f02%2f20-Incredible-Modern-Houses-Around-the-United-States-5.jpg&ehk=jltOlopAEXlYw25Qjcb6BhHSadJcIyJ863PI4ffrO70%3d&risl=1&pid=ImgRaw&r=0',
                    title: "3000",
                    subtitle: 'Luxury Villa 2000 sqft',
                    bedCount: 2,
                    sofaCount: 3,
                    bathroomCount: 3),
                SizedBox(height: CustomDimens.spacerH),
                Container(
                  height: 500,
                  width: double.infinity,
                  //  child: Image.asset('assets/welcome.png'),
                  //Lottie.network('https://lottie.host/b65a75d6-05e9-4fc3-9d76-2894861fcb48/AHkc5GCwQE.json',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
