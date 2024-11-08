import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/core/constants/assets_icons.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_button.dart';
import 'package:taskati_app/core/widgets/snackbar_dialog.dart';
import 'package:taskati_app/features/tasks_view/views/tasks_view.dart';

String? path;

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && nameController.text.isNotEmpty) {
                  AppLocalStorage.cashData('name', nameController.text);
                  AppLocalStorage.cashData('image', path!);
                  AppLocalStorage.cashData('isLogin', true);
                  pushAndRemoveUntil(context, TasksView());
                } else if (nameController.text.isEmpty) {
                  showSnackbarDialog(
                      context: context, message: 'Please Enter Your Name');
                } else if (path == null) {
                  showSnackbarDialog(
                      context: context, message: 'Please Upload Your Image');
                } else {
                  showSnackbarDialog(
                      context: context,
                      message: 'Please Enter Your Name and Upload Your Image');
                }
              },
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
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : AssetImage(AssetsIcons.user),
              ),
              Gap(10),
              CustomButton(
                textColor: AppColors.white,
                color: AppColors.primary,
                onPressed: () {
                  uploadImage(true);
                },
                height: 150.h,
                text: 'Upload from Camera',
              ),
              Gap(5),
              CustomButton(
                textColor: AppColors.white,
                color: AppColors.primary,
                onPressed: () {
                  uploadImage(false);
                },
                height: 150.h,
                text: 'Upload from Gallery  ',
              ),
              Gap(5),
              Divider(),
              Gap(10),
              TextFormField(
                onChanged: (value) {
                  nameController.text = value;
                },
                controller: nameController,
                decoration: InputDecoration(hintText: 'Enter Your Name'),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadImage(bool isCamera) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
