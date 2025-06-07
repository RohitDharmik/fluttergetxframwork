import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/components/drawer.dart';
import 'package:flutter_getx_mvc_framework/app/services/analyticsscreen.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({super.key});
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnalyticsScreen(
        screenName: 'DashboardView',
        child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text('DashboardView'),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  // Navigate to settings page
                  Get.toNamed('/setting-view');
                },
              ),
            ],
          ),
          body: Obx(() => ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  final task = controller.tasks[index];
                  return Dismissible(
                    key: Key(task.title + index.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) => controller.deleteTask(index),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (_) => controller.toggleTask(index),
                      ),
                      onTap: () => controller.toggleTask(index),
                    ),
                  );
                },
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Add Task',
                content: TextField(
                  controller: textController,
                  decoration: const InputDecoration(hintText: 'Task title'),
                ),
                textConfirm: 'Add',
                onConfirm: () {
                  if (textController.text.trim().isNotEmpty) {
                    controller.addTask(textController.text.trim());
                    textController.clear();
                    Get.back();
                  }
                },
                textCancel: 'Cancel',
                onCancel: () => textController.clear(),
              );
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}
