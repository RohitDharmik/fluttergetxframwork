import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_framework/app/components/drawer.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({super.key});
  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final days = List.generate(7, (i) => today.add(Duration(days: i)));

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FA),
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Text('Dashboard'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_rounded, color: Colors.white),
            onPressed: () => _showAddTaskDialog(context),
          ),
        ],
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
                            vertical: 8, horizontal: 16),
                        child: Column(
                          children: [
                            Text(
                              _weekdayShort(d.weekday),
                              style: TextStyle(
                                color:
                                    isToday ? Colors.blueAccent : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              d.day.toString(),
                              style: TextStyle(
                                color:
                                    isToday ? Colors.blueAccent : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
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
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(16),
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
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          trailing: IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.blueAccent),
                            onPressed: () =>
                                _showEditTaskDialog(context, index),
                          ),
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
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

// Add this method to DashboardView:
  void _showEditTaskDialog(BuildContext context, int index) {
    final task = controller.tasks[index];
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

  String _weekdayShort(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }
}
