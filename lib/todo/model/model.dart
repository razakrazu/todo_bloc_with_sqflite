class TodoModel{
  String ? id;
  String name;
  String place;
  String description;
  TodoModel({this.id,required this.name, required this.place, required this.description});

// model  data  covert to Object and insert sqflite
  Map<String,dynamic> toMap(){
    return   {
      'id':id,
      'name':name,
      'place': place,
      'description':description,

    };
  }
   
   
   factory TodoModel.fromMap(Map<String,dynamic> map){
    return TodoModel(
      id:map['id'] 
    ,name:map['name'],
    place:map['place'],
    description: map['description']);
   }
}