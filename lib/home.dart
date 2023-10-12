import 'package:flutter/material.dart';
import 'sum_char.dart';
import 'UI/splash_screen.dart';


import 'todo.dart';
import 'Calculat.dart';
class mainz extends StatelessWidget{
  const mainz({super.key});
  
  @override
  Widget build(BuildContext context) {

    Text t =Text("Material" , textDirection: TextDirection.rtl,textAlign: TextAlign.left, style: TextStyle(
          fontSize: 33,
          color:  Colors.white, decoration: TextDecoration.none)
          );   

  return  MaterialApp( 
  debugShowCheckedModeBanner: false,
  home: Scaffold( backgroundColor: Color.fromARGB(255, 250, 250, 250),



body: Center(
  child:   Column(
  
  
  
        mainAxisAlignment: MainAxisAlignment.center,
        
        
  
        children: [
          FilledButton(onPressed: () =>  Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
        SplashScreen()
       
  
        )), 
  
        child: Text("data"))
        ,  SizedBox(height:5)
        ,FilledButton(onPressed: () =>  Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        charcter()
  
        )), 
  
        child: Text("charcter")),
          SizedBox(height:5),
        FilledButton(onPressed: () =>  Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        CalculatorApp()
  
        )), 
  
        child: Text("Calculator")),
    SizedBox(height:5),
        FilledButton(onPressed: () =>  Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        todo()
  
        )), 
  
        child: Text("todo")),
          SizedBox(height:5),
      FilledButton(onPressed: () =>  Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        CalculatorApp()
  
        )), 
  
        child: Text("Calculator")),   
  
        
  
        ]),
) ,


),
  
); 
  
  
  
  }





}