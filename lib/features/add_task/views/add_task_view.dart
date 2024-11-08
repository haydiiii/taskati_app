import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';
import 'package:taskati_app/core/widgets/custom_button.dart';
import 'package:taskati_app/features/add_task/widgets/appbar_add_task.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var noteController = TextEditingController();
  var titleController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int selectedIndix = 0;
  var date = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(DateTime.now().add(
    const Duration(minutes: 30),
  ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppBaraddTask()),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: getTitleStyle(context),
              ),
              Gap(5),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Enter Title here',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Title';
                  }
                },
              ),
              Gap(10),
              Text(
                'Note',
                style: getTitleStyle(context),
              ),
              Gap(5),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Note';
                  }
                },
                controller: noteController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter Note here',
                ),
              ),
              Gap(10),
              Text(
                'Date',
                style: getTitleStyle(context),
              ),
              Gap(5),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                              initialDate: DateTime.now())
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            date = DateFormat('yyyy/MM/dd').format(value);
                          });
                        }
                      });
                    },
                  ),
                  hintText: date,
                ),
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    ' Start Time',
                    style: getTitleStyle(context),
                  )),
                  Expanded(
                      child: Text(
                    'End Time',
                    style: getTitleStyle(context),
                  )),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                      hintText: startTime,
                      suffixIcon: IconButton(
                          onPressed: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  startTime = value.format(context);
                                });
                              }
                            });
                          },
                          icon: Icon(
                            Icons.alarm,
                            color: AppColors.primary,
                          )),
                    ),
                    readOnly: true,
                  )),
                  const Gap(20),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: endTime,
                      suffixIcon: IconButton(
                          onPressed: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        DateTime.now()
                                            .add(Duration(minutes: 30))))
                                .then((value) {
                              if (value != null) {
                                setState(() {
                                  endTime = value.format(context);
                                });
                              }
                            });
                          },
                          icon: Icon(
                            Icons.alarm,
                            color: AppColors.primary,
                          )),
                    ),
                  )),
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: getTitleStyle(context),
                      ),
                      Row(
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndix = index;
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 13,
                                      backgroundColor: index == 0
                                          ? AppColors.primary
                                          : index == 1
                                              ? AppColors.orange
                                              : AppColors.red,
                                      child: (index == selectedIndix)
                                          ? Icon(
                                              Icons.done,
                                              color: AppColors.white,
                                            )
                                          : SizedBox(),
                                    ),
                                  ),
                                )),
                      )
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    width: 150,
                    height: 50,
                    text: 'Create Task',
                    textColor: AppColors.white,
                    onPressed: () {},
                    color: AppColors.primary,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
