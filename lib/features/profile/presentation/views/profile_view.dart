import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/core/constants/assets_icons.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_button.dart';
import 'package:taskati_app/features/tasks_view/views/tasks_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  uploadImage(bool isCamera) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      AppLocalStorage.cashData(
        'image',
        pickedImage.path,
      );
    }
  }

  String path = AppLocalStorage.getCahData('image');

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary,
          ),
          onPressed: () {
            pushWithReplacment(context, TasksView());
          },
        ),
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
                    backgroundImage: (path != null)
                        ? FileImage(File(path)) as ImageProvider
                        : AssetImage(AssetsIcons.user),
                  ),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {
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
                                        uploadImage(true);
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
                                        uploadImage(false);
                                        Navigator.pop(context);
                                      },
                                      text: 'Upload from Gallery  ',
                                    ),
                                  ])),
                            );
                          },
                        );
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
                    AppLocalStorage.getCahData('name'),
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
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Form(
                                key: formKey,
                                child: SafeArea(
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      height: 100,
                                      width: double.infinity,
                                      child: Column(children: [
                                        TextFormField(
                                            controller: nameController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter Your Name';
                                              } else {
                                                return null;
                                              }
                                            }),
                                        Gap(5),
                                        CustomButton(
                                          width: double.infinity,
                                          height: 40,
                                          textColor: AppColors.white,
                                          color: AppColors.primary,
                                          onPressed: () {
                                            AppLocalStorage.cashData(
                                                'name', nameController.value);
                                            Navigator.pop(context);
                                          },
                                          text: 'Upload Your Name ',
                                        ),
                                      ])),
                                ),
                              );
                            },
                          );
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
