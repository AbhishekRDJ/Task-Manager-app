import 'package:flutter/material.dart';
import 'blank_page.dart';
import 'entry_page.dart';
import 'gemini_page.dart';
import 'profile_page.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask(String task) {
    setState(() {
      _tasks.add({
        'title': task,
        'isDone': false,
        'time': TimeOfDay.now().format(context),
      });
    });
    _taskController.clear();
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Task"),
          content: TextField(
            controller: _taskController,
            decoration: const InputDecoration(hintText: "Enter task"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_taskController.text.isNotEmpty) {
                  _addTask(_taskController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const EntryPage()));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlankPage(
                    completedTasks:
                        _tasks.where((task) => task['isDone']).toList())));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const GeminiPage()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        backgroundColor: const Color(0xFF675DF3),
      ),
      body: _tasks.isEmpty
          ? const Center(child: Text("No tasks added yet!"))
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: Checkbox(
                      value: _tasks[index]['isDone'],
                      onChanged: (_) {
                        setState(() {
                          _tasks[index]['isDone'] = !_tasks[index]['isDone'];
                        });
                      },
                    ),
                    title: Text(
                      _tasks[index]['title'],
                      style: TextStyle(
                        decoration: _tasks[index]['isDone']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text("Added at: ${_tasks[index]['time']}",
                        style: const TextStyle(color: Colors.grey)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _tasks.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        backgroundColor: const Color(0xFF675DF3),
        child: const Icon(Icons.add, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: const Color(0xFFF0F9FF),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => _navigateToPage(0),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () => _navigateToPage(1),
              ),
              const SizedBox(width: 40),
              IconButton(
                icon: const Icon(Icons.description),
                onPressed: () => _navigateToPage(2),
              ),
              IconButton(
                icon: const Icon(Icons.group),
                onPressed: () => _navigateToPage(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
