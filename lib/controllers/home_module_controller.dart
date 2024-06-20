// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_planner/services/posting_function.dart';
import 'package:time_planner/widget/snackbar.dart';

class HomeModuleController {
  var currentPageIndexOnMainFrame = 0.obs;
  PageController mainframePageController = PageController(initialPage: 0);
  TextEditingController addATaskTitleTEC = TextEditingController();
  TextEditingController addAtaskDescriptionTEC = TextEditingController();
  TextEditingController searchTEC = TextEditingController();
  var selectedEventDate = DateTime.now().obs;
  var showSelectedDate = false.obs;
  var showLoadingAnimationInAddATaskPopup = false.obs;
  var showSearchResult = false.obs;

  selectDate(BuildContext context) async {
    var eventDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime(20100),
    );
    if (eventDate != null) {
      selectedEventDate.value = eventDate;
      showSelectedDate.value = true;
    }
  }

  saveATask() async {
    String title = addATaskTitleTEC.value.text;
    String description = addAtaskDescriptionTEC.value.text;
    String status = "Pending";
    if (title.isNotEmpty &&
        description.isNotEmpty &&
        showSelectedDate.value == true) {
      showLoadingAnimationInAddATaskPopup.value = true;
      await Future.delayed(const Duration(seconds: 2));
      String postedSeccessfully = await PostingFunction().addTask(
        title: title,
        description: description,
        eventDate: selectedEventDate.value,
        status: "Pending",
      );
      showLoadingAnimationInAddATaskPopup.value = false;
      if (postedSeccessfully == "Success") {
        addATaskTitleTEC.text = "";
        addAtaskDescriptionTEC.text = "";
        showSelectedDate.value = false;
        Get.back();
        showSnackBar(
          title: "Success!",
          message: "Your task has been added to your time planner list.",
        );
      } else {
        showLoadingAnimationInAddATaskPopup.value = false;
        showSnackBar(
          title: "Error",
          message:
              "An error occurred while trying to save our task to yout time planner list.",
        );
      }
    } else {
      showSnackBar(title: "Error", message: "Input fields cannot be empty!");
    }
  }

  void deleteTodoTask(String id) async {
    await PostingFunction().deleteTodoTask(id);
    Get.back();
    showSnackBar(
        title: "Task deleted",
        message: "Your task has been deleted from time planner.");
  }

  void clearScreenSearchPage() {
    showSearchResult.value = false;
    searchTEC.text = '';
  }

  void deleteUserData() async {
    await PostingFunction().deleteUserData();
    showSnackBar(
        title: "Success",
        message: "Done! You're relived of all of your todos.");
  }
}
