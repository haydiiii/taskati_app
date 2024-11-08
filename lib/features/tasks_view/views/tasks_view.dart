import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/core/constants/assets_icons.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_button.dart';
import 'package:taskati_app/features/add_task/data/task_model.dart';
import 'package:taskati_app/features/tasks_view/widgets/home_header.dart';
import 'package:taskati_app/features/tasks_view/widgets/task_card.dart';
import 'package:taskati_app/features/tasks_view/widgets/today_header.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  String selectedIndex = DateFormat('yyyy/MM/dd').format(DateTime.now());
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
                  selectedIndex = DateFormat('yyyy/MM/dd').format(date);
                });
              },
            ),
            Expanded(
                child: ValueListenableBuilder(
              valueListenable: Hive.box<TaskModel>('taskBox').listenable(),
              builder: (context, Box<TaskModel> value, child) {
                List<TaskModel> tasks = [];
                for (var element in value.values) {
                  ////filteration by date///

                  if (element.date == selectedIndex) {
                    tasks.add(element);
                  }
                }
                if (value.isEmpty) {
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(AssetsIcons.empty),
                          Gap(15),
                          Text(
                            textAlign: TextAlign.center,
                            'You don\'t have any tasks yet \n Add New Task to make your day productive',
                            style: getBodyStyle(context),
                          ),
                        ]),
                  );
                }
                return ListView.separated(
                    itemBuilder: (itemContext, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.check, color: AppColors.white),
                              Gap(5),
                              Text('Completed',
                                  style: getBodyStyle(context,
                                      color: AppColors.white))
                            ],
                          ),
                        ),
                        secondaryBackground: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete, color: AppColors.white),
                              Gap(5),
                              Text('Delete',
                                  style: getBodyStyle(context,
                                      color: AppColors.white))
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            value.delete(tasks[index].id);
                          } else {
                            value.put(
                                tasks[index].id,
                                TaskModel(
                                    id: tasks[index].id,
                                    endTime: tasks[index].endTime,
                                    color: 3,
                                    isCompleted: true,
                                    title: tasks[index].title,
                                    note: tasks[index].note,
                                    date: tasks[index].date,
                                    startTime: tasks[index].startTime));
                          }
                        },
                        child: TaskCard(
                          taskModel: tasks[index],
                        ),
                      );
                    },
                    separatorBuilder: (itemContext, index) => Gap(15),
                    itemCount: tasks.length);
              },
            ))
          ],
        ),
      )),
    );
  }
}
