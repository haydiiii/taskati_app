import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/features/add_task/data/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: taskModel.color == 0
                  ? AppColors.primary
                  : taskModel.color == 1
                      ? AppColors.orange
                      : taskModel.color == 2
                          ? AppColors.red
                          : Colors.green,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      taskModel.title,
                      style: getBodyStyle(context, color: AppColors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.access_time,
                          color: AppColors.white,
                          size: 20,
                        ),
                        Gap(5),
                        Text('${taskModel.startTime} - ${taskModel.endTime}',
                            style: getBodyStyle(context,
                                fontSize: 11, color: AppColors.white)),
                      ],
                    ),
                    Gap(5),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      taskModel.note,
                      style: getBodyStyle(context, color: AppColors.white),
                    ),
                  ],
                ),
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
                  child: Text(taskModel.isCompleted ? 'Completed' : 'TODO',
                      style: getTitleStyle(
                        context,
                        color: AppColors.white,
                      ))),
            ],
          ),
        )
      ],
    );
  }
}
