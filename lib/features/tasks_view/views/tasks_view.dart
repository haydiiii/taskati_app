import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/constants/assets_icons.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_button.dart';
import 'package:taskati_app/features/tasks_view/widgets/home_header.dart';
import 'package:taskati_app/features/tasks_view/widgets/today_header.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  String selectedIndex = DateFormat('yMMMd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            HomeHeader(),
            Gap(15),
            TodayHeader(),
            Gap(15),
            DatePicker(
              DateTime.now(),
              height: 100,
              width: 70,
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColors.primary,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                setState(() {
                  selectedIndex = date.toString();
                });
              },
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (itemContext, index) {
                      return Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Flutter Task -1',
                                      style: getBodyStyle(context,
                                          color: AppColors.white),
                                    ),
                                    Gap(5),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: AppColors.white,
                                          size: 20,
                                        ),
                                        Gap(5),
                                        Text('10:00 AM',
                                            style: getBodyStyle(context,
                                                fontSize: 11,
                                                color: AppColors.white)),
                                        Text('-',
                                            style: getBodyStyle(context,
                                                fontSize: 11,
                                                color: AppColors.white)),
                                        Text('10:00 AM',
                                            style: getBodyStyle(context,
                                                fontSize: 11,
                                                color: AppColors.white)),
                                      ],
                                    ),
                                    Gap(5),
                                    Text(
                                      'I will do this Task',
                                      style: getBodyStyle(context,
                                          color: AppColors.white),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 100,
                                  child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Divider(
                                        color: AppColors.white,
                                      )),
                                ),
                                RotatedBox(
                                    quarterTurns: 3,
                                    child: Text('TODO',
                                        style: getTitleStyle(
                                          context,
                                          color: AppColors.white,
                                        ))),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (itemContext, index) => Gap(15),
                    itemCount: 3))
          ],
        ),
      )),
    );
  }
}
