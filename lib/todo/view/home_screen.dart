import 'package:flutter/material.dart';
import 'package:todo_bloc/todo/popup_screen.dart';
import 'package:todo_bloc/todo/show_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
              showDialog(context: context, builder: (context) {
                         return AlertDialog(content:AddPopupScreen());
                       },);
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
   showDialog(context: context, builder: (context) {
                         return AlertDialog(content:UserDetails());
                       },);
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
    );
  }
}
