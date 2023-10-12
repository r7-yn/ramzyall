
import 'package:first/home.dart';
import 'package:first/lect6/ict6.dart';
import 'package:first/todo.dart';
import 'Calculat.dart';

import 'package:flutter/material.dart';
import 'drwer.dart';


 class myhome extends StatefulWidget {
  

  @override
  State<myhome> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<myhome> {
  int currentPageIndex = 0;

  


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(


      
      appBar: AppBar(
      
      title: Text("Material" , textDirection: TextDirection.rtl,textAlign: TextAlign.left, style: TextStyle(
          fontSize: 33,
          color:  Colors.white, decoration: TextDecoration.none)
          ),
      backgroundColor: Color.fromARGB(255, 45, 120, 232),
    
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: 'note',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.timelapse),
            icon: Icon(Icons.timer),
            label: 'time',
          ),
        ],
      ),
      body: <Widget>[
        
        Container(
          
       
          alignment: Alignment.center,
          child: mainz()
        ),
        Container(
         
          alignment: Alignment.center,
          child:ict6(),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: todo(),
        ),
      ][currentPageIndex],
   drawer: drw(),
    );
  
  }
}
