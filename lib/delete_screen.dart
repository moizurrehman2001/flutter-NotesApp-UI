import 'package:flutter/material.dart';
import 'package:to_do_application/first_screen.dart';

import 'add_screen.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text('delete Tasks'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListTile(
                  title: Text(notesList[index]['title'].toString()),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(notesList[index]['description'].toString()),
                  ),
                  trailing: Wrap(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('deadline'),
                          Text(notesList[index]['deadline'].toString()),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              notesList.removeAt(index);
                              Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => FirstScreen()),
                        (Route route) => false);
                            });
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
