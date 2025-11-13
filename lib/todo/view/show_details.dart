import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_bloc/todo/model/model.dart';
import 'package:todo_bloc/todo/view/upadat_screen.dart';

class UserDetails extends StatelessWidget {
  final Future<Database> database;
  final TodoModel todomodels;
  const UserDetails({
    super.key,
    required this.database,
    required this.todomodels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 40),
              Text(
                'Details',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: const Color.fromARGB(
                    255,
                    0,
                    0,
                    0,
                  ), // Change the underline color
                  decorationThickness: 1.0, // Adjust the underline thickness
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),

              IconButton(onPressed: () {
                     showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: EditPopupScreen(
                          database: database,
                          todo: todomodels, // എഡിറ്റ് ചെയ്യാനുള്ള ഡാറ്റ പാസ്സ് ചെയ്യുന്നു
                        ),
                      );
                    },
                  );
              }, icon: Icon(Icons.edit)),
            ],
          ),
          SizedBox(height: 23),
          Text(
            'Name: ${todomodels.name}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 23),
          Text(
            'Place: ${todomodels.place}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 20),
          Text(
            'Description: ${todomodels.description}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
