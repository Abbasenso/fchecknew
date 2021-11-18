import 'package:fchecknew/Screens/LogIn2.dart';
import 'package:fchecknew/Screens/MyHome.dart';
import 'package:fchecknew/Screens/contactus.dart';
import 'package:fchecknew/Screens/health.dart';
import 'package:fchecknew/Screens/home.dart';
import 'package:fchecknew/Screens/user/change_password.dart';
import 'package:fchecknew/Screens/user/profile.dart';
import 'package:fchecknew/main.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class MyDrawer extends StatefulWidget{
  MyDrawer({Key key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  SharedPreferences loginData;
  String email;
  getEmailPass()async{
    loginData=await SharedPreferences.getInstance();
    setState(() {
      email=loginData.getString('username')?? '';
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmailPass();
  }
  @override
  Widget build(BuildContext context) {
    // final image="https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png";
     final hoverColor=Colors.white38;
    // final storage = new FlutterSecureStorage();
    // final email = FirebaseAuth.instance.currentUser.email;

    return Drawer(

      child: Container(

        padding: EdgeInsets.zero,
        child: Material(
          color: Colors.blue,
          child: ListView(

            children: [

              DrawerHeader(
                padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                accountName: Text("F-Check"),
                    accountEmail: Text("$email"),
                    currentAccountPicture:CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("images/feonnaa_logo.png"),
                    )
              )
              ),
             ListTile(
               leading: Icon(
                 CupertinoIcons.home,
                 color: Colors.white,
               ),
               title: Text("Home",
                 textScaleFactor: 1.3,
                 style: TextStyle(color: Colors.white),),
                 hoverColor: hoverColor,
               onTap: (){

                 Navigator.of(context).push(MaterialPageRoute(
                     builder: (context)=>MyHome()));
               },

             ),

              ListTile(
                leading: Icon(
                  CupertinoIcons.add_circled,
                  color: Colors.white,
                ),
                title: Text("Health Tips",
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white),),
                hoverColor: hoverColor,
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>Health(title: 'F-Check',)));

                },

              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.phone,
                  color: Colors.white,
                ),
                title: Text("Contact Us",
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white),),
                hoverColor: hoverColor,
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>ContactUs()));

                },
              ),



              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text("Profile",
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white),),
                hoverColor: hoverColor,
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>Profile()));

                },
              ),



              ListTile(
                leading: Icon(
                  CupertinoIcons.info,
                  color: Colors.white,
                ),
                title: Text("App Info",
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white),
                ),
                hoverColor: hoverColor,
                onTap: (){
                  showAboutDialog(
                      context: context,
                      applicationIcon: FlutterLogo(),
                      applicationName: "F-Check",
                      applicationVersion: '1.0.6',
                      applicationLegalese: 'Developed By Feonnaa Herbals',
                      children:<Widget> [
                        Text("Health is a gift that cannot be ignored, but in today’s world it is just the opposite. "
                            "People are so tensed in their life or worked up that the last possible area of focus or concern for an individual is their health"),

                      ]

                  );
                },
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.square_arrow_right,
                  color: Colors.white,
                ),
                title: Text("Log Out",
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white),
                ),
                hoverColor: hoverColor,
                onTap: ()async{
                  loginData=await SharedPreferences.getInstance();
                  loginData.setBool('login', true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:
                          (context) =>
                          Login()
                      )
                  );

                },

              ),
            ],


          ),
        ),


      ),

    );
  }
}
