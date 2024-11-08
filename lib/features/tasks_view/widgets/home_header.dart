import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati_app/core/constants/assets_icons.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/services/local_storage.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/features/profile/presentation/views/profile_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? name = AppLocalStorage.getCahData('name');
    String? path = AppLocalStorage.getCahData('image');
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello , $name',
                style: getTitleStyle(context, color: AppColors.primary)),
            Text('Have a nice day', style: getBodyStyle(context)),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            pushWithReplacment(context, ProfileView());
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage: (path != null)
                ? FileImage(File(path)) as ImageProvider
                : AssetImage(AssetsIcons.user),
          ),
        )
      ],
    );
  }
}
