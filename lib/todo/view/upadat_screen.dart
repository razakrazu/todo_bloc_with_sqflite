import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_bloc/todo/bloc/todobloc_bloc.dart';
import 'package:todo_bloc/todo/model/model.dart';

class EditPopupScreen extends StatelessWidget {
  final Future<Database> database;
  final TodoModel todo;
  EditPopupScreen({super.key, required this.database, required this.todo});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // നിലവിലുള്ള ഡാറ്റ ടെക്സ്റ്റ്ഫീൽഡുകളിൽ നിറയ്ക്കുക
    nameController.text = todo.name;
    placeController.text = todo.place;
    descriptionController.text = todo.description;

    return SizedBox(
      height: 400,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'EDIT DETAILS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: placeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Place',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Description',
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                TodoModel updatedTodo = TodoModel(
                  id: todo.id, // ID മാറ്റരുത്
                  name: nameController.text,
                  place: placeController.text,
                  description: descriptionController.text,
                );
                context.read<TodoblocBloc>().add(UpdateTodo(updatedTodo));
                Navigator.pop(context); // Edit Popup അടയ്ക്കുക
                Navigator.pop(context); // UserDetails Popup അടയ്ക്കുക
              },
              child: const Text('UPDATE'),
            ),
          ],
        ),
      ),
    );
  }
}
