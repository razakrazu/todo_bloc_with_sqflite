import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_bloc/todo/bloc/todobloc_bloc.dart';
import 'package:todo_bloc/todo/model/model.dart';
import 'package:todo_bloc/todo/view/popup_screen.dart';


class HomeScreen extends StatelessWidget {
  final Future<Database> database;
  // final bool dbExists;
  const HomeScreen({super.key, required this.database, });

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: AddPopupScreen(
                    database: database,
               
                  ),
                );
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
        leading: IconButton(onPressed: (){
          
        }, icon:Icon(Icons.abc) ),),
        body: BlocBuilder<TodoblocBloc, TodoblocState>(
          builder: (context, state) {
            if(state is TodoLoading){
            return  Center(child: CircularProgressIndicator());
              
            }else if(state is TodoLoaded ){
              if(state.todolist.isEmpty){
                return Center(child:  Text('no Todo items'),);
              }
               return ListView.builder(
              itemCount: state.todolist.length,
              itemBuilder: (context, index) {
                TodoModel todo = state.todolist[index];
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
                            // showDialog(
                            //   context: context,
                            //   builder: (context) {
                            //     return AlertDialog(
                            //       content: UserDetails(
                            //         database: database,
                            //         todomodels: todo,
                                  
                            //       ),
                            //     );
                                
                            //   },
                            // );
                            
                          },
                          title: Text(
                            state.todolist[index].name,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            'place:${state.todolist[index].place}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              
                                context.read<TodoblocBloc>()
                                  .add(DeleteTodo(todo.id!)); //  Navigator.of(context).push(MaterialPageRoute(builder:(context) => UserDetails(),));
                            },

                            icon: Icon(Icons.delete),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
            }else if(state is TodoError){
                return  Center(child: Text(state.errormsg));
            }else{
              return Center(child:Text('Unexpected Error  check your code'));
            }
          }
        ),           
      );
  
  }
}
