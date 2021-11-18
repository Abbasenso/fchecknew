
import 'package:fchecknew/Screens/login.dart';
import 'package:fchecknew/Screens/user/user_main.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   final storage = new FlutterSecureStorage();
//   Future<bool> checkLoginStatus() async {
//     String value = await storage.read(key: "uid");
//     if(value==null)
//     {
//       return false;
//     }else{
//       return true;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: _initialization,
//         builder: (context, snapshot) {
//           // Check for Errors
//           if (snapshot.hasError) {
//             print("Something Went Wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           return MaterialApp(
//             title: 'F-Check',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             debugShowCheckedModeBanner: false,
//             home: FutureBuilder(
//                 future: checkLoginStatus(),
//                 builder: (BuildContext context, AsyncSnapshot<bool>snapshot){
//                   if(snapshot.data==false){
//                     return Login();
//                   }
//
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Container(
//                         color: Colors.white,
//                         child: Center(child: CircularProgressIndicator()));
//                   }
//                   return MyHome();
//
//
//                 }
//
//             ),
//           );
//         });
//   }
// }

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  title: 'F-Check',
theme: ThemeData(
primarySwatch: Colors.blue
),
home: myApp(),
  ));
}

class myApp extends StatefulWidget {

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  @override
  Widget build(BuildContext context) {

    return Login();
  }
}
