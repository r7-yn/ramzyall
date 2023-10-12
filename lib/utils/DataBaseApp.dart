
import 'dart:async';

import 'dart:io';

import 'package:first/Moudle/notas.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


class control_databases  {
   final String nameTable = "newsa";
  final String id = "id" ;
  final String name = "name" ;
  final String phone = "phone";
  final String email = "email";
  final String note = "note" ;
  static Database? _database;
 
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }else
    return _database = await createDB();
     
  }


 
 

  Future<Database> createDB() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path , 'masdb.db');
    var database = await openDatabase(path,version: 1,
        onCreate:  _onCreate);
    return database;
  }
void _onCreate(Database db ,int version){
  
    var sql = "CREATE TABLE IF NOT EXISTS $nameTable ($id INTEGER PRIMARY KEY AUTOINCREMNT UNIQUE,"
        " $name TEXT, $phone TEXT, $email TEXT , $note TEXT )";
    db.execute(sql);


}
Future<int> insertNote( Notaas notes) async{
     Database?  db = await  database;
    var result = await db!.rawInsert("INSERT INTO  ${nameTable}(${name},${phone},${email}, ${note} )VALUES(?,?,?,?)" ,[ notes.name , notes.phone,notes.email,notes.note]);
    return result;
  
   
}

  Future<List> getAll() async{
    var db = await  database;
    var sql = "SELECT * FROM $nameTable";
    List result = await db!.rawQuery(sql);
    return result.toList();
  }

Future<int?> getCount() async{
    var db = await  database;
    var sql = "SELECT COUNT(*) FROM $nameTable";

    return  Sqflite.firstIntValue(await db!.rawQuery(sql)) ;
  }
  Future<Map?> getUser(int id) async{
    
    var db = await  database;
    var sql = "SELECT * FROM $nameTable WHERE id = $id";
    var result = await db!.rawQuery(sql);
    if(result.length == 0) return null;
    return result.first ;
  }

  Future<Map?> getlastUser() async{
    
    var db = await  database;
    var sql = "SELECT * FROM $nameTable";
    var result = await db!.rawQuery(sql);
    if(result.length == 0) return null;
    return result.last ;
  }
 
  Future<int> deleteUser(int id) async{
    var db = await  database;
    return  await db!.delete(
        nameTable , where: "id = ?" , whereArgs: [id]
    );
  } 
  
  Future<int> updateUser(Notaas user) async{
    var db = await  database;
    return  await db!.update(
   nameTable ,user.toMap(), where: " id  = ?" , whereArgs: [user.columnId]
    );
  }
  

  Future<void> Close() async{
    var db = await  database;
    return  await db!.close();
  }

}




/*
class Notaas{

int? columnId ;
String?  name ;
String?  phone ;
String?   email ;
String?  note;

Notaas(this.columnId ,this.name ,this.phone , this.email , this.note );

Notaas.map(dynamic obj){
  this.name = obj['username'];
  this.phone = obj['password'];
  this.email = obj['city'];
  this.note = obj['age'];
  this.columnId = obj['id'];
}

String? get _name => name;
String? get _phone => phone;
String? get _email => email;
String? get _note => note;
int? get _id => columnId;

Map<String , dynamic> toMap(){
  var map = new Map<String , dynamic>();
  map['name'] = _name;
  map['phone'] = _phone;
  map['email'] = _email;
  map['note'] = _note;
  if(columnId != null){
    map['id'] = _id;
  }
  return map;
}

Notaas.fromMap(Map<String , dynamic>map){
   this.name = map['username'];
      this.phone = map['password'];
      this.email = map['city'];
      this.note = map['age'];
      this.columnId = map['id'];
}

}

*/