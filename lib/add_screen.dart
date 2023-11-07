import 'package:flutter/material.dart';
import 'package:to_do_application/first_screen.dart';

List<Map> notesList = [];

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  addItem() {
    setState(() {
      notesDetails['title'] = titleController.text;
      notesDetails['description'] = descriptionController.text;
      notesDetails['deadline'] = deadlineController.text;
    });
  }

  Map notesDetails = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text('Add Tasks'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Title :',
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  cursorColor: Colors.redAccent,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.redAccent)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  controller: titleController,
                ),
              ),
              const Text('Description :',
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.redAccent)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  controller: descriptionController,
                ),
              ),
              const Text('Deadline :',
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.redAccent)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  controller: deadlineController,
                ),
              ),
              Center(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                onPressed: () {
                  setState(() {
                    addItem();
                    notesList.add(notesDetails);
                    titleController.clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => FirstScreen()),
                        (Route route) => false);
                  });
                },
                child: const Text('Add Tasks',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold)),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
