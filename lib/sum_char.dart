import 'package:flutter/material.dart';
import 'Dashboard.dart';



class charcter extends StatefulWidget {
  @override
  _charcter createState() => _charcter();
}

class _charcter extends State<charcter> {
  TextEditingController numders = TextEditingController();
  int sum = 0;
  int all = 0;

  void sumadd() {
    setState(() {
      //all = int.parse(numders.text);
      sum = numders.text.length;
    });
  }

  void allb() {
    setState(() {
      all = int.parse(numders.text);
    }
    );
  }

  void clear() {
    setState(() {
      sum = 0;
      all=0;
      numders.clear();
    });
  }

  @override
  void dispose() {
    numders.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('SUM_char'),
        centerTitle: true,
        backgroundColor: Colors.blue,
          actions: [
      
      IconButton(onPressed: () => Navigator.pushReplacement(context as BuildContext,
  
        MaterialPageRoute(builder: (context) =>
  
        
  
        myhome()
  
        )), icon: Icon(Icons.arrow_circle_left_sharp) ,)

      ],
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numders,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'ادخل الرقم',               
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sumadd,
              child: Text('عرض عدد '),
            ),
            Text(
              'عدد الارقام: $sum',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: clear,
              child: Text('تنظيف'),
            ),
          ],
        ),
      ),
    );
  }
}