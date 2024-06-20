import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:time_planner/model/task_model.dart';
import 'package:time_planner/theme/theme.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../views/screen/task_detail_screen.dart';

class TodoCard extends StatelessWidget {
  final TaskModel task;
  const TodoCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TaskDetailScreen(
              task: task,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: Get.width,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  task.status == "Pending"
                      ? FontAwesomeIcons.clipboard
                      : task.status == "Active"
                          ? FontAwesomeIcons.clipboardQuestion
                          : FontAwesomeIcons.clipboardCheck,
                  color: Get.isDarkMode ? darkPrimaryColor : lightPrimaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    task.title,
                    overflow: TextOverflow.ellipsis,
                    style: getDefaultTextStyle.copyWith(
                      color: Get.isDarkMode ? darkPrimaryColor : darkBlueColor,
                    ),
                  ),
                ),
                Text(
                  timeago.format(task.eventDate),
                  style: getSubtitleTextStyle.copyWith(
                    color: Get.isDarkMode
                        ? whiteColor.withOpacity(.6)
                        : blackColor.withOpacity(.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
