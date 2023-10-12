import 'notesend.dart';
import 'Moudle/notas.dart';
import 'package:flutter/material.dart';
import 'Dashboard.dart';

class drw extends StatelessWidget{
  const drw({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        
        child: ListView( 
          padding: EdgeInsets.zero,
          
          children: [ 
            UserAccountsDrawerHeader(
              
              
              accountName: Text('Hareth almqtri'),
              accountEmail: Text('Email:  *******@gamil.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),  
                
              )
              ),
            ListTile(onTap: () =>  Navigator.pushReplacement(context as BuildContext,
      MaterialPageRoute(builder: (context) =>
      
      myhome()
      )),  
              title: Text('Dashboard'),
              leading: Icon(Icons.dashboard),

            ),
             ListTile(
              title: Text('mydata'),
              leading: Icon(Icons.contact_phone),
              onTap: () =>

Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
      note_news(Notaas(0,"","","",""))
       
  
        )) 
                 ,
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),

            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),

            ),
          ],
        ),
      );
      

  }

    
  }


  
      