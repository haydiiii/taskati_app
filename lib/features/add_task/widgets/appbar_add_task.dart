import 'package:flutter/material.dart';
import 'package:taskati_app/core/functions/routing.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/features/tasks_view/views/tasks_view.dart';

import '../../../core/utils/text_styles.dart';

class AppBaraddTask extends StatelessWidget {
  const AppBaraddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            pushWithReplacment(context, TasksView());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary,
          )),
      title: Text(
        'Add Task',
        style: getTitleStyle(context, color: AppColors.primary),
      ),
      centerTitle: true,
    );
  }
}
