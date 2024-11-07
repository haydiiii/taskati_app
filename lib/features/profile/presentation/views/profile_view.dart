import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/constants/assets_icons.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_button.dart';
import 'package:taskati_app/features/profile/presentation/views/widgets/image_modal_bottom_sheet.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.sunny),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(AssetsIcons.user),
                  ),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        // استدعاء دالة showImageSourceOptions بدون استخدام pushTo
                        showImageSourceOptions(context);
                      },
                      icon: Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
              Gap(20),
              Divider(),
              Gap(20),
              Row(
                children: [
                  Text(
                    'Haidi Khattab',
                    style: getTitleStyle(context, color: AppColors.primary),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary,
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 19,
                      child: IconButton(
                        onPressed: () {
                          editName(context);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////showImageSourceOptions////////////////////////
void showImageSourceOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Container(
            margin: EdgeInsets.all(10),
            height: 100,
            width: double.infinity,
            child: Column(children: [
              CustomButton(
                width: double.infinity,
                height: 40,
                textColor: AppColors.white,
                color: AppColors.primary,
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Upload from Camera',
              ),
              Gap(5),
              CustomButton(
                width: double.infinity,
                height: 40,
                textColor: AppColors.white,
                color: AppColors.primary,
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Upload from Gallery  ',
              ),
            ])),
      );
    },
  );
}

////////////////editNameee////////////////////////
void editName(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Container(
            margin: EdgeInsets.all(10),
            height: 100,
            width: double.infinity,
            child: Column(children: [
              TextFormField(),
              Gap(5),
              CustomButton(
                width: double.infinity,
                height: 40,
                textColor: AppColors.white,
                color: AppColors.primary,
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Upload from Gallery  ',
              ),
            ])),
      );
    },
  );
}
