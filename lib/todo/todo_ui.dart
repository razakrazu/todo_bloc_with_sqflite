import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: 
      FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      appBar: AppBar(title: Text('Todo',style: TextStyle(fontSize: 23, fontWeight:FontWeight.w900),),centerTitle:true ,backgroundColor: const Color.fromARGB(255, 2, 154, 164),),
      body: ListView.builder(itemBuilder: (context, index) {
      return Column(
        children: [
SizedBox(
  height: 80,
  width: 350,
  child: Card(color: const Color.fromARGB(255, 138, 189, 189),
  elevation: 5,
    child:ListTile(title: Text('Name:Razak',style: TextStyle(fontSize: 23, fontWeight:FontWeight.w500),),
    subtitle:Text('place:vadakara',style: TextStyle(fontSize: 18,fontWeight:FontWeight.w500 ),),
    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
    
    ),),
)
        ],
      );
    },),);
  }
}