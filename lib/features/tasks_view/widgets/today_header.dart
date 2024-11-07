import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_button.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('yMMMd').format(DateTime.now()),
                style: getTitleStyle(
                  context,
                )),
            Text('Today', style: getTitleStyle(context)),
          ],
        ),
        Spacer(),
        CustomButton(
          width: 150,
          height: 50,
          text: '+add Task',
          textColor: AppColors.white,
          onPressed: () {},
          color: AppColors.primary,
        )
      ],
    );
  }
}