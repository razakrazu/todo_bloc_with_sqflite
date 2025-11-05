import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_bloc/todo/bloc/todobloc_bloc.dart';
import 'package:todo_bloc/todo/view/popup_screen.dart';
import 'package:todo_bloc/todo/view/show_details.dart';

class HomeScreen extends StatelessWidget {
  final Future<Database>  database;
  final bool dbExists;
  const HomeScreen({super.key,required this.database,required this.dbExists});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoblocBloc(database,dbExists),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: AddPopupScreen());
              },
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(
            'Todo',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 2, 154, 164),
        ),
        body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 80,
                  width: 350,
                  child: Card(
                    color: const Color.fromARGB(255, 171, 231, 231),
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                         showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(content: UserDetails());
                            },
                          );
                      },
                      title: Text(
                        'Name:Razak',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        'place:vadakara',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          //  Navigator.of(context).push(MaterialPageRoute(builder:(context) => UserDetails(),));
                         
                        },

                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
