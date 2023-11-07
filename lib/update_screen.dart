import 'package:flutter/material.dart';

import 'add_screen.dart';
import 'first_screen.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController updateTitleController = TextEditingController();
  TextEditingController updatedescriptionController = TextEditingController();
  TextEditingController updatedeadlineController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: Text('Update Tasks')),
      body: SafeArea(
        child: ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListTile(
                  title: Text(notesList[index]['title'].toString()),
                  subtitle: Text(notesList[index]['description'].toString()),
                  trailing: Wrap(
                    children: [
                      Column(
                        children: [
                          const Text('deadline'),
                          Text(notesList[index]['deadline'].toString())
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            updateTitleController.text =
                                notesList[index]['title'];
                            updatedescriptionController.text =
                                notesList[index]['description'];
                            updatedeadlineController.text =
                                notesList[index]['deadline'];
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Update Task'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Title :',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold)),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: TextField(
                                              controller: updateTitleController,
                                              cursorColor: Colors.blue,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 2,
                                                              color: Colors
                                                                  .redAccent)),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                            ),
                                          ),
                                          const Text('Description :',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold)),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: TextField(
                                              controller:
                                                  updatedescriptionController,
                                              cursorColor: Colors.blue,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 2,
                                                              color: Colors
                                                                  .redAccent)),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                            ),
                                          ),
                                          const Text('Deadline :',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold)),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: TextField(
                                              controller:
                                                  updatedeadlineController,
                                              cursorColor: Colors.redAccent,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 2,
                                                              color: Colors
                                                                  .redAccent)),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors
                                                .redAccent, // Background color
                                            // Text Color (Foreground color)
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              notesList[index]['title'] =
                                                  updateTitleController.text;
                                              notesList[index]['description'] =
                                                  updatedescriptionController
                                                      .text;
                                              notesList[index]['deadline'] =
                                                  updatedeadlineController.text;
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FirstScreen()),
                                                      (Route route) => false);
                                            });
                                            updateTitleController.clear();
                                            updatedescriptionController.clear();
                                            updatedeadlineController.clear();
                                          },
                                          child: const Text(
                                            'Update Task',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
