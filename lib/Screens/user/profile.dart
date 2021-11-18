//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // final uid = FirebaseAuth.instance.currentUser.uid;
  // final email = FirebaseAuth.instance.currentUser.email;
  // final creationTime = FirebaseAuth.instance.currentUser.metadata.creationTime;
  //
  // User user = FirebaseAuth.instance.currentUser;

  // verifyEmail() async {
  //   if (user != null && user.emailVerified) {
  //     await user.sendEmailVerification();
  //     print('Verification Email has been sent');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.orangeAccent,
  //         content: Text(
  //           'Verification Email has been sent',
  //           style: TextStyle(fontSize: 18.0, color: Colors.black),
  //         ),
  //       ),
  //     );
  //   }
  // }
  String email1;
  String password1;
  SharedPreferences logindata;
  getEmailPassword()async{
    logindata=await SharedPreferences.getInstance();
    setState(() {
      email1=logindata.getString('username') ?? '';
      password1=logindata.getString('password') ?? '';
    });


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmailPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),


      body: SafeArea(

        child: Center(

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: [

                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/feonnaa_logo.png'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("$email1",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.purple,
                ),

                SizedBox(
                  height: 10,
                ),
                Card(

                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle_rounded,
                      color: Colors.purple,
                    ),
                    title: Text("$email1",style: TextStyle(fontWeight: FontWeight.bold),),

                  ),

                ),

                // Card(
                //
                //   child: ListTile(
                //     leading: Icon(
                //       Icons.email,
                //       color: Colors.purple,
                //     ),
                //     title: Text("$email1",style: TextStyle(fontWeight: FontWeight.bold),),
                //
                //   ),
                // ),
                Card(

                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.purple,
                    ),
                    title: Text("$password1",style: TextStyle(fontWeight: FontWeight.bold),),

                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}