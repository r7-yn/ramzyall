
import 'package:flutter/material.dart';

class drw extends StatelessWidget{
  const drw({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        
        child: ListView( 
          
          padding: EdgeInsets.zero,
          
          children:[
     
            Container(
            color: Color.fromARGB(255, 134, 0, 243) ,
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(  
                
                radius: 50.0,
                
              backgroundImage: AssetImage("images/bahbuoh.png")),
            ),
            ),
     
            Container(color: Color.fromARGB(255, 134, 0, 243) ,
            child: Center(child:  Text("مطعم الدار",style: TextStyle(color: Colors.white),),)
            
            
            
            ,),
            SizedBox(height:1),
            ListTile(
              
              textColor: Colors.white,
              tileColor: Color.fromARGB(255, 42, 31, 143),
              title: Text('الصفحة الرئيسية'),
              leading: Icon(Icons.home),

            ),
            SizedBox(height:1),
             ListTile(
              title: Text('تسجيل الدخول'),
              leading: Icon(Icons.login),
              textColor: Colors.white,
              tileColor: Color.fromARGB(255, 42, 31, 143)
            ,),
            SizedBox(height:1),
            ListTile(
              title: Text('الوجبات'),
              leading: Icon(Icons.date_range_outlined),
              textColor: Colors.white,
              tileColor: Color.fromARGB(255, 42, 31, 143)

            ),
            SizedBox(height:1),
            ListTile(
              title: Text('العملاء'),
              leading: Icon(Icons.account_box_outlined),
                            textColor: Colors.white,
              tileColor: Color.fromARGB(255, 42, 31, 143)
            ),
                 SizedBox(height:1),
            ListTile(
              title: Text('الطلبات'),
              leading: Icon(Icons.access_time_filled),
                            textColor: Colors.white,
              tileColor: Color.fromARGB(255, 42, 31, 143)

            ),
            SizedBox(height:1),
            ListTile(
              title: Text('الخدمات'),
              leading: Icon(Icons.phone_in_talk_rounded),
                            textColor: Colors.white,
              tileColor: Color.fromARGB(255, 42, 31, 143)

            ),
            SizedBox(height:1),
            ListTile(
              title: Text('خدمة التوصيل'),
              leading: Icon(Icons.phone_android_sharp),
                            textColor: Colors.white,
              tileColor: Color.fromARGB(255, 42, 31, 143)
              

            ),
            SizedBox(height:1),
            ListTile(
              title: Text('العدادات'),
              leading: Icon(Icons.settings),
              textColor: Colors.white,
              tileColor: Color.fromARGB(255, 42, 31, 143)
,
            ),
          ],
        ),
      );
      

  }

    
  }


  
      