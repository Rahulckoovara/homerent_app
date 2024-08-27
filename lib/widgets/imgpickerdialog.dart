import 'package:flutter/material.dart';
import 'package:tappal_app/widgets/primary_button.dart';

class ImagePickerDialog extends StatelessWidget {
  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;
  final VoidCallback onClosePressed;

  const ImagePickerDialog(
      this.onCameraPressed, this.onGalleryPressed, this.onClosePressed,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text("Select image"),
          ),
          ListTile(
            leading: Icon(Icons.camera_alt_outlined),
            title: Text("Camera"),
            // titleTextStyle: AppStyle.detailsContentTxtStyle,
            onTap: () {
              onCameraPressed();
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text("Gallery"),
            // titleTextStyle: AppStyle.detailsContentTxtStyle,
            onTap: () {
              onGalleryPressed();
            },
          ),
          PrimaryButton(onClosePressed, "close"),
          Text(
            "*Upload image with less than 100 KB",
            style: TextStyle(color: Colors.red, fontSize: 12),
          )
          //LinkButton(onClosePressed, AppStrings.close, "")
        ],
      ),
    );
  }
}
