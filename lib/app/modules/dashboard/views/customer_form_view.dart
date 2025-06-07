import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class CustomerFormView extends GetView<DashboardController> {
  CustomerFormView({super.key});
  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final days = List.generate(7, (i) => today.add(Duration(days: i)));

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FA),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Text('Completed Tasks'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Date selector

          // Day selector
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (context, i) {
                final d = days[i];
                final isToday = d.day == today.day &&
                    d.month == today.month &&
                    d.year == today.year;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isToday ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Task list
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.completedTask.length,
                itemBuilder: (context, index) {
                  final task = controller.completedTask[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (_) => controller.toggleTask(index),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      title: Text(
                        task.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      subtitle: task.description != null &&
                              task.description!.isNotEmpty
                          ? Text(
                              task.description!,
                              style: TextStyle(
                                decoration: task.isCompleted
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            )
                          : null,
                      onTap: () => controller.toggleTask(index),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Add this method to DashboardView:
  void _showEditTaskDialog(BuildContext context, int index) {
    final task = controller.completedTask[index];
    textController.text = task.title;
    descriptionController.text = task.description ?? '';
    Get.defaultDialog(
      title: 'Edit Task',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Task title'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Task description'),
          ),
        ],
      ),
      textConfirm: 'Update',
      onConfirm: () {
        if (textController.text.trim().isNotEmpty) {
          controller.updateTask(
            index,
            textController.text.trim(),
            descriptionController.text.trim(),
          );
          textController.clear();
          descriptionController.clear();
          Get.back();
        }
      },
      textCancel: 'Cancel',
      onCancel: () {
        textController.clear();
        descriptionController.clear();
      },
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    textController.clear();
    descriptionController.clear();
    Get.defaultDialog(
      title: 'Add Task',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Task title'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Task description'),
          ),
        ],
      ),
      textConfirm: 'Add',
      onConfirm: () {
        if (textController.text.trim().isNotEmpty) {
          controller.addTask(
            textController.text.trim(),
            descriptionController.text.trim(),
          );
          textController.clear();
          descriptionController.clear();
          Get.back();
        }
      },
      textCancel: 'Cancel',
      onCancel: () {
        textController.clear();
        descriptionController.clear();
      },
    );
  }
}
