import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'drwer2.dart';
class mybode extends StatelessWidget{
  const mybode({super.key});
  
  @override
  Widget build(BuildContext context) {

    Text t =Text("Material" , textDirection: TextDirection.rtl,textAlign: TextAlign.left, style: TextStyle(
          fontSize: 33,
          color:  Colors.white, decoration: TextDecoration.none)
          );   

  return Scaffold( backgroundColor: Color.fromARGB(255, 250, 250, 250),

appBar: AppBar(
      
      title: t,
      backgroundColor: Color.fromARGB(255, 45, 120, 232),
       actions: [
      
      IconButton(onPressed: () => Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        myhome()
  
        )), icon: Icon(Icons.arrow_circle_left_sharp) ,)

      ],
        

      ),

body: Center( 
      child:Column(children: [Transform.rotate(
        
        angle: 0.30,
        child: Container(child: Text('dasfdaasdxasdsdfas',style: TextStyle( fontStyle: FontStyle.italic,backgroundColor: Colors.blue,)
        
        
        
        ),
        margin: EdgeInsets.only(top: 100),
        ),
      ),

        Transform.rotate(
        
        angle: 0.30,
        child: Container(
          margin: EdgeInsets.only(top: 100),
          width: 300,
          height: 50,
          color: Colors.blue,
        ),
      ),
      ],) 
      
    ),
  drawer: drw(),
);
  
  
  }





}