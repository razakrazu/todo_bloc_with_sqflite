import 'package:flutter/material.dart';

class AddPopupScreen extends StatelessWidget {
  const AddPopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
    child: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
Text(
                      'ADD DETAILS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),
                        SizedBox(height:50),
          TextFormField(   decoration:  InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),),hintText: 'Name'
          ),),
          
           SizedBox(height:20),
           TextFormField(
            decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),),hintText: 'Place'
          ),
           ),
           SizedBox(height:20),
           TextFormField(
               decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),),hintText: 'Discription'
          ),
           ),
           SizedBox(height:40),

           ElevatedButton(onPressed: (){}
           , child: Text('ADD'))
        ],
      ),
    ));
  }
}