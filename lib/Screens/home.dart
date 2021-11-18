import 'package:fchecknew/Screens/LogIn2.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu,color: Colors.white,size: 30,),
                  Image.asset("images/feonnaa_logo.png",width: 50,)
                ],
              ),
            ),
           SizedBox(height: 40,),
            Padding(
                padding: const EdgeInsets.all(12.0),
               child: Center(
                 child: Wrap(
                   spacing: 20.0,
                   runSpacing: 20.0,
                   children: [
                     SizedBox(
                       width: 160.0,
                       height: 160.0,
                       child: Card(
                         color: Color.fromARGB(255, 21, 21, 21),
                         elevation: 2.0,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8.0)
                         ),
                         child: Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Image.asset("images/bmi.png",width: 100.0,),
                                 SizedBox(height: 10.0),
                                 Text("BMI",style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20.0
                                 ),)
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                   
                     SizedBox(
                       width: 160.0,
                       height: 160.0,
                       child: Card(
                         color: Colors.white,
                         elevation: 2.0,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8.0)
                         ),
                         child: Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Image.asset("images/health_tips.png",width: 100.0,),
                                 SizedBox(height: 10.0),
                                 Text("Health Tips",style: TextStyle(
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20.0
                                 ),)
                               ],

                             ),

                           ),

                         ),

                       ),

                     ),


                     SizedBox(
                       width: 160.0,
                       height: 160.0,
                       child: Card(
                         color: Color.fromARGB(255, 21, 21, 21),
                         elevation: 2.0,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8.0)
                         ),
                         child: Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Image.asset("images/contact.png",width: 100.0,),
                                 SizedBox(height: 10.0),
                                 Text("Contact Us",style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20.0
                                 ),)
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 160.0,
                       height: 160.0,
                       child: Card(
                         color: Color.fromARGB(255, 21, 21, 21),
                         elevation: 2.0,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8.0)
                         ),
                         child: Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Image.asset("images/chat.png",width: 100.0,),
                                 SizedBox(height: 10.0),
                                 Text("Chat",style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20.0
                                 ),)
                               ],
                             ),
                           ),
                         ),

                       ),

                     ),

                     SizedBox(
                       width: 160.0,
                       height: 160.0,
                       child: Card(
                         color: Color.fromARGB(255, 21, 21, 21),
                         elevation: 2.0,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8.0)
                         ),
                         child: Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Image.asset("images/appinfo.png",width: 100.0,),
                                 SizedBox(height: 10.0),
                                 Text("App Info",style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20.0
                                 ),)
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 160.0,
                       height: 160.0,
                       child: Card(
                         color: Color.fromARGB(255, 21, 21, 21),
                         elevation: 2.0,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8.0)
                         ),
                         child: Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Image.asset("images/logout.png",width: 100.0,),
                                 SizedBox(height: 10.0),
                                 Text("Log Out",style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20.0
                                 ),)
                               ],
                             ),
                           ),
                         ),
                       ),
                     )

                   ],
                 ),
               ),
            ),

          ],
        ),
      ),

    );
  }

}