import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  final List<Map<String, dynamic>> completedTasks;

  const BlankPage({Key? key, required this.completedTasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Tasks"),
        backgroundColor: const Color(0xFF675DF3),
      ),
      body: completedTasks.isEmpty
          ? const Center(child: Text("No completed tasks yet!"))
          : ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading:
                        const Icon(Icons.check_circle, color: Colors.green),
                    title: Text(
                      completedTasks[index]['title'],
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Completed at: ${completedTasks[index]['time']}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
