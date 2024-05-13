import 'package:flutter/material.dart';
import 'package:tappal_app/common/custom_dimens.dart';
import 'package:tappal_app/widgets/primary_button.dart';
import 'package:lottie/lottie.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(CustomDimens.commonPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text('Find Your \nApartment Here',
            style: TextStyle(
              fontSize: 30
            ),
            ),
              SizedBox(height: CustomDimens.spacerH),
              Text('Most it diagrams headline of should there with practice to and with my sections.',
              style: TextStyle(
                fontSize: 16
              ),
              ),
               SizedBox(height: CustomDimens.spacerH),
               SizedBox(height: CustomDimens.spacerH),               
               PrimaryButton(() {}, 'Get Started'),
               SizedBox(height: CustomDimens.spacerH),
               Container(
                height: 500,
                width: double.infinity,
                child: Image.asset('assets/welcome.png'),
          //Lottie.network('https://lottie.host/b65a75d6-05e9-4fc3-9d76-2894861fcb48/AHkc5GCwQE.json', 
              )
            ],
          ),
        ),
      ),
    );
  }
}