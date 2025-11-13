import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_bloc/todo/bloc/todobloc_bloc.dart';
import 'package:todo_bloc/todo/view/home_screen.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'todo_database'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE todo (id INTEGER PRIMARY KEY, name TEXT, place TEXT, description TEXT)',
      );
    },
    version: 1,
  );

  runApp(MyApp(database: database,  ));
}

class MyApp extends StatelessWidget {
  final Future<Database> database;

  MyApp({super.key, required this.database, });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoblocBloc(database)..add(LoadTodo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(database: database, ),
      ),
    );
  }
}
