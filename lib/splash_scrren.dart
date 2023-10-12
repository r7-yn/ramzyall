



import 'package:first/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myhome()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
       
       return Scaffold(
        body: Column(

        children: [
      
    Expanded(child:   Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [Color.fromARGB(255, 239, 53, 6), Color.fromARGB(255, 255, 101, 155)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(350,300)
          
          ),
            
          ),
          height: 200,
      ),),
     Expanded(child:  Center( heightFactor:MediaQuery.of(context).size.height/260,
            child: CircularPercentIndicator(
            animation: true,
            animationDuration: 2300,
            radius:60,
            percent: 1,
            
            center:  CircleAvatar( 
              
              radius: 55.0,
              
            backgroundImage: AssetImage("images/bahbuoh.png")),
            
            )
          ),),
      
      
    Expanded(child:   Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [Color.fromARGB(255, 239, 53, 6), Color.fromARGB(255, 255, 101, 155)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(350,300)
          
          ),
            
          ),
          height: 200,
      ),  )
          ],
      ),
       );
     }


}
