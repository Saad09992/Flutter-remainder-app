import 'package:firebase_remainder_app/controllers/remainder_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemainderManagementPage extends StatelessWidget {
  const RemainderManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RemainderController _remainderController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Remainders"),
      ),
      body: Obx(() {
        final remainderList = _remainderController.remainderModel;

        if (remainderList.isEmpty) {
          return const Center(
            child: Text("No remainders available."),
          );
        }

        return ListView.builder(
          itemCount: remainderList.length,
          itemBuilder: (context, index) {
            final remainder = remainderList[index];

            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(remainder.animeId),
                subtitle: Text(
                  "Day: ${remainder.day}\nTime: ${remainder.time.toLocal()}",
                ),
                trailing: IconButton(
                  onPressed: () {
                    _remainderController.deleteRemainder(remainder.id);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
