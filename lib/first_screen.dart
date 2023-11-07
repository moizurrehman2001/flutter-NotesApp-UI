import 'package:flutter/material.dart';
import 'package:to_do_application/add_screen.dart';
import 'package:to_do_application/update_screen.dart';

import 'delete_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: const Text('My Tasks'),
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  if (value == '1') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddScreen()),
                    );
                  } else if (value == '2') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeleteScreen()),
                    );
                  }
                },
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      const PopupMenuItem(value: '1', child: Text('Add Tasks')),
                      const PopupMenuItem(
                          value: '2', child: Text('Update Tasks')),
                      const PopupMenuItem(
                          value: '3', child: Text('Delete Tasks')),
                    ]),
          ],
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    title: Text(notesList[index]['title'].toString()),
                    subtitle:
                        Text(notesList[index]['description'].toString()),
                    trailing: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('deadline'),
                        Text(notesList[index]['deadline'].toString()),
                      ],
                    ),
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddScreen()),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
