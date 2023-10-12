

import 'package:first/Moudle/notas.dart';
import 'package:flutter/material.dart';
import 'utils/DataBaseApp.dart';
import 'Dashboard.dart';

class note_news extends StatefulWidget {
  Notaas notaas;
  note_news(this.notaas);
  
  State createState() => ict6_();
}

class ict6_ extends State<note_news> {
    
     var db = new control_databases();   
    int?  columnId ;
    String?  name ;
    String?  phone ;
    String?   email ;
    String?  note;
 
   TextField textfieldinset(TextEditingController con) {
    return TextField(
          decoration: InputDecoration(
              border: UnderlineInputBorder(), labelText: 'name'),
          controller: con,
         
        );
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = new TextEditingController();
     TextEditingController _phone = new TextEditingController();
     TextEditingController _email = new TextEditingController();
     TextEditingController _note = new TextEditingController();
    return Scaffold(

      appBar: AppBar(

          actions: [
      
      IconButton(onPressed: () => Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        myhome()
  
        )), icon: Icon(Icons.arrow_circle_left_sharp) ,)

      ],
        
      ),
      body: Column(
      
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:Column(children: [ textfieldinset(_name), textfieldinset(_phone), textfieldinset(_email), textfieldinset(_note),],)
        ),
        Expanded(
            child:Row(children: [FilledButton(onPressed:  () async {
                        
             widget.notaas.name= _name.text; 
             widget.notaas.phone= _phone.text; 
             widget.notaas.email= _email.text; 
             widget.notaas.note= _note.text; 
             
     

              print(await db.insertNote(widget.notaas)) ;
            }, child: Text("ارسال")),




            FilledButton(onPressed:  () async {
              var db = new control_databases();
              var first =await db.getlastUser() ;
            
              
              setState() {
                     print({first});

                    
                    }

            }, child: Text("عرض"))
            
            
            ],
            ) 
            ),
        Expanded(
            child:Column(children: [],) ),
      ],
    ),
    ) ;
  }


}


