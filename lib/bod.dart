import 'package:flutter/material.dart';

class body extends StatelessWidget{
  const body({super.key});
  @override
  Widget build(BuildContext context) {
 
    
 return  Column(
        children: [const Padding(padding: EdgeInsets.all(20)),
          Container( color: Color.fromARGB(255, 31, 125, 247),
            margin: const EdgeInsets.only(right: 20,top: 20,left: 20),
            padding: const EdgeInsets.only(right: 250.0,top: 50,bottom: 5),
            width: 400,
            height: 80,
            child: Text(
              'MaterialApp',
              style: TextStyle(color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(child: Container( color: Color.fromARGB(255, 92, 161, 234),
            margin: EdgeInsets.only(right: 20,bottom: 20,left: 20),
            
            width: 400,
            height: 500,
            child: Center(child: Text(
              'hello',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),)
          ),)
          ]);
          

  }
}

