import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:500,
width:300,
child:Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children:[
   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
     children: [
        SizedBox(width:40),
       Text('Details',style:TextStyle(fontSize:23,fontWeight:FontWeight.w600,decoration:TextDecoration.underline,
       decorationColor: const Color.fromARGB(255, 0, 0, 0), // Change the underline color
    decorationThickness: 1.0,     // Adjust the underline thickness
    decorationStyle: TextDecorationStyle.solid, )),
      
       IconButton(onPressed: (){}, icon: Icon(Icons.edit))
     ],
   ),
  SizedBox(height:23),
  Text('Name: Gogul',style:TextStyle(fontSize:20,fontWeight:FontWeight.w300)),
  SizedBox(height:23),
  Text('Place: Malappuram',style:TextStyle(fontSize:14,fontWeight:FontWeight.w300)),
  SizedBox(height:20),
   Text('Description: i am boy my name is razak. I will find my job  i will achive my dream job then I will shine all person at any time in my life ',style:TextStyle(fontSize:15,fontWeight:FontWeight.w500,color: Colors.grey)),
])
    );
  }
}