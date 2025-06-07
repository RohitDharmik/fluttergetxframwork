import 'package:flutter/widgets.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/modules/tasks.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/profile_page_view.dart';
import 'package:flutter_getx_mvc_framework/app/modules/dashboard/views/setting_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  RxInt selectedIndex = 0.obs;
  Rx<PageController> pageController = PageController(initialPage: 0).obs;

  void changePage(int index) {
    selectedIndex.value = index;
    pageController.value.jumpToPage(index);
  }

  final List<Widget> bottomBarPages = [
    DashboardView(),
    ProfilePageView(),
    ProfilePageView(),
    SettingView(),
  ];

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }

  final tasks = <Task>[].obs;
  final completedTask = <CompletedTask>[].obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void addTask(String title, String discription) {
    tasks.add(Task(title: title, description: discription));

    saveTasks();
  }

  void updateTask(int index, String title, String description) {
    if (index < 0 || index >= tasks.length) return;
    tasks[index].title = title;
    tasks[index].description = description;
    tasks.refresh();
    saveTasks();
  }

  void toggleTask(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
    saveTasks();
  }

  void deleteTask(int index) {
    if (index < 0 || index >= tasks.length) return;
    final task = tasks[index];
    completedTask.add(CompletedTask(
      title: task.title,
      description: task.description,
      
    ));
    tasks.removeAt(index);
    saveTasks();
  }

  void saveTasks() {
    storage.write('tasks', tasks.map((t) => t.toJson()).toList());
  }

  void loadTasks() {
    final stored = storage.read<List>('tasks');
    if (stored != null) {
      tasks.assignAll(
          stored.map((e) => Task.fromJson(Map<String, dynamic>.from(e))));
    }
  }
}
