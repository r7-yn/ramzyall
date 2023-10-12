import 'package:flutter/material.dart';





class todo extends StatelessWidget{
  const todo({super.key});
  
  @override
  Widget build(BuildContext context) {

  return   Container(color:Color.fromARGB(255, 13, 123, 240) , child:  Column(children: [
    
    Container( margin: EdgeInsets.only(top: 50),child: HomeScreen(),
    height: 50,
    
    ),
    
    
Expanded(child:     Container(decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius:BorderRadius.only(topLeft: Radius.circular(70) ,topRight:Radius.circular(70))



 ),

height: 580,


))
],


),
 
 );
  
  
  
  }





}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int hours = 0;
  int minutes = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(minutes: 1), startTimer);
    setState(() {
      minutes = DateTime.now().minute;
      hours = DateTime.now().hour;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
          '${hours.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')}',
          
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,wordSpacing: 5,color: const Color.fromARGB(180, 255, 255, 255)),
        );
  
  
  }
}