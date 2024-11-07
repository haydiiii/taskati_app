import 'package:flutter/material.dart';
import 'package:taskati_app/core/constants/assets_icons.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello , Haidi',
                style: getTitleStyle(context, color: AppColors.primary)),
            Text('Have a nice day', style: getBodyStyle(context)),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(AssetsIcons.user),
        )
      ],
    );
  }
}
