import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/constants/assets_icons.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_button.dart';

class UploadView extends StatelessWidget {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Done",
                  style: getBodyStyle(context, color: AppColors.primary),
                ))
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(25.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AssetsIcons.user),
                ),
                Gap(10),
                CustomButton(
                  textColor: AppColors.white,
                  color: AppColors.primary,
                  onPressed: () {},
                  height: 150.h,
                  text: 'Upload from Camera',
                ),
                Gap(5),
                CustomButton(
                  textColor: AppColors.white,
                  color: AppColors.primary,
                  onPressed: () {},
                  height: 150.h,
                  text: 'Upload from Gallery  ',
                ),
                Gap(5),
                Divider(),
                Gap(10),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Enter Your Name'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
