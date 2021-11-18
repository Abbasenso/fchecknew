import 'dart:convert';

import 'package:fchecknew/Screens/MyHome.dart';
import 'package:fchecknew/Screens/registration.dart';
import 'package:fchecknew/main.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fchecknew/Screens/forgot_password.dart';
import 'package:fchecknew/Screens/signup.dart';
import 'package:fchecknew/Screens/user/user_main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);



  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  //var _userData=[];
  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final storage = new FlutterSecureStorage();



  SharedPreferences logindata;
  bool newuser;

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => MyHome()));
    }
  }

  // userLogin() async {
  //   try {
  //     UserCredential userCrendential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //     //print(userCrendential.user?.uid);
  //     await storage.write(key: "uid", value: userCrendential.user?.uid);
  //
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => MyHome(),
  //       ),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print("No User Found for that Email");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.redAccent,
  //           content: Text(
  //             "No User Found for that Email",
  //             style: TextStyle(fontSize: 18.0, color: Colors.white),
  //           ),
  //         ),
  //       );
  //     } else if (e.code == 'wrong-password') {
  //       print("Wrong Password Provided by User");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.redAccent,
  //           content: Text(
  //             "Wrong Password Provided by User",
  //             style: TextStyle(fontSize: 18.0, color: Colors.white),
  //           ),
  //         ),
  //       );
  //     }
  //   }
  // }
int isornot;
  Future <void> userLogin( a)async{
   List ud=a;
   var i;
    for(i=0;i<ud.length;i++){
      if(email=="${ud[i]["username"]}" && password=="${ud[i]["password"]}"){
        logindata.setBool('login', false);
        logindata.setString('username', email);
        logindata.setString('password', password);
        Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHome(),
                  ),
                );
        setState(() {
          isornot=1;
        });
        break;

        // SnackBar(
        //               backgroundColor: Colors.redAccent,
        //               content: Text(
        //                 "Login Successful",
        //                 style: TextStyle(fontSize: 18.0, color: Colors.white),
        //               ),
        //             );
        // final snackBar = SnackBar(
        //   content: Text("Login Success",style: TextStyle(color: Colors.green,fontSize: 12),),
        //   action: SnackBarAction(
        //     label: "Done",
        //     textColor: Colors.green,
        //     onPressed: (){
        //
        //     },
        //   ),
        //   // action: SnackBarAction(
        //   //   label: 'Undo',
        //   //   onPressed: () {
        //   //     // Some code to undo the change.
        //   //   },
        //   // ),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // setState(() {
        //   check=1;
        // });
        // logedInOrNot(check);
        //break;
      }
      else{
        setState(() {
          isornot=0;
        });
        // final snackBar = SnackBar(
        //   content: Text("Either username or password is wrong",style: TextStyle(color: Colors.red,fontSize: 12),),
        //   action: SnackBarAction(
        //     label: "ERROR!",
        //     textColor: Colors.red,
        //     onPressed: (){
        //
        //     },
        //   ),
        //   // action: SnackBarAction(
        //   //   label: 'Undo',
        //   //   onPressed: () {
        //   //     // Some code to undo the change.
        //   //   },
        //   // ),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // setState(() {
        //   check=0;
        // });
        // logedInOrNot(check);
      }
      // SnackBar(
      //               backgroundColor: Colors.redAccent,
      //               content: Text(
      //                 "Either Username Or Password Is Not Correct",
      //                 style: TextStyle(fontSize: 18.0, color: Colors.white),
      //               ),
      //             );

    }
   // if(isornot==1){
   //   final snackBar1 = SnackBar(
   //     content: Text("Login Success",style: TextStyle(color: Colors.green,fontSize: 12),),
   //     action: SnackBarAction(
   //       label: "Done",
   //       textColor: Colors.green,
   //       onPressed: (){
   //
   //       },
   //     ),
   //     // action: SnackBarAction(
   //     //   label: 'Undo',
   //     //   onPressed: () {
   //     //     // Some code to undo the change.
   //     //   },
   //     // ),
   //   );
   //   ScaffoldMessenger.of(context).showSnackBar(snackBar1);
   // }
   // else{
   //   final snackBar2 = SnackBar(
   //     content: Text("Either username or password is wrong",style: TextStyle(color: Colors.red,fontSize: 12),),
   //     action: SnackBarAction(
   //       label: "ERROR!",
   //       textColor: Colors.red,
   //       onPressed: (){
   //
   //       },
   //     ),
   //     // action: SnackBarAction(
   //     //   label: 'Undo',
   //     //   onPressed: () {
   //     //     // Some code to undo the change.
   //     //   },
   //     // ),
   //   );
   //   ScaffoldMessenger.of(context).showSnackBar(snackBar2);
   // }
  }
  showSnackbar(){
    if(isornot==1){
      final snackBar1 = SnackBar(
        content: Text("Login Success",style: TextStyle(color: Colors.green,fontSize: 12),),
        action: SnackBarAction(
          label: "Done",
          textColor: Colors.green,
          onPressed: (){

          },
        ),
        // action: SnackBarAction(
        //   label: 'Undo',
        //   onPressed: () {
        //     // Some code to undo the change.
        //   },
        // ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    }
    else{
      final snackBar2 = SnackBar(
        content: Text("Either username or password is wrong",style: TextStyle(color: Colors.red,fontSize: 12),),
        action: SnackBarAction(
          label: "ERROR!",
          textColor: Colors.red,
          onPressed: (){

          },
        ),
        // action: SnackBarAction(
        //   label: 'Undo',
        //   onPressed: () {
        //     // Some code to undo the change.
        //   },
        // ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
    }
  }



  // var check;
  //  logedInOrNot(ch) {
  //   var l;
  //   if(ch==1){
  //     l=1;
  //     myApp(l);
  //   }
  //   else{
  //     l=0;
  //     myApp(l);
  //   }
  // }

var _userData2=[];
    dynamic fetchData() async {
    final url="https://feonnaaherbals.com/fcheck_backend/fcheck_user.php";
    var _userData=[];
    try {
      final response = await http.get(Uri.parse(url));
      //debugPrint(response.body);
      final jsonData = jsonDecode(response.body) as List;
      // setState(() {
      //  userData= jsonData;
      // });
      _userData=jsonData;
      //print(_userData);
      return _userData;
    }
    catch (err) {
      print(err);
    }
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   //super.initState();
  //   this.fetchData();
  // }
  void initState() {
    super.initState();
    fetchData().then((value) {
      //debugPrint('type-->$value');
      _userData2=value;
      //print(_userData2);

      // do functions requiring value parameter
    });
    check_if_already_login();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  String _launched;
 void _launchInBrowser(String url) async =>
      await launch(url,enableJavaScript: true,forceWebView: true);

  @override
  Widget build(BuildContext context) {
      print(_userData2);
    //var userData1=fetchData();
    //var userData1=_userData;
    //print(userData1);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,

      body: Form(
        key: _formKey,


        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(


            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("image_new/fcheck_login.png",height: size.height * 0.21,),

                  SizedBox(height: size.height * 0.03),
                  Image.asset(
                    "assets/icons/dfgd.png",
                    height: size.height * 0.27,
                    //width: size.width*5,
                  ),
                  SizedBox(height: size.height * 0.03),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Email: ',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        } else if (!value.contains('@')) {
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                      onChanged: (value){
                        email=emailController.text;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password: ',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink,
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),


                          onPressed: () {
                            // Validate returns true if the form is valid, otherwise false.
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                email = emailController.text;
                                password = passwordController.text;
                              });
                              userLogin(_userData2);
                              showSnackbar();
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () => {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => ForgotPassword(),
                        //       ),
                        //     )
                        //   },
                        //   child: Text(
                        //     'Forgot Password ?',
                        //     style: TextStyle(fontSize: 14.0),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account? "),
                        TextButton(
                          child: Text('Signup'),
                          onPressed: (){
                            setState(() {
                              _launched = 'https://feonnaaherbals.com/payment/';
                            });
                            _launchInBrowser('https://feonnaaherbals.com/payment/');
                          },
                        ),
                        // TextButton(
                        //   onPressed: () => {
                        //     Navigator.pushAndRemoveUntil(
                        //         context,
                        //         PageRouteBuilder(
                        //           pageBuilder: (context, a, b) => UserMain(),
                        //           transitionDuration: Duration(seconds: 0),
                        //         ),
                        //         (route) => false)
                        //   },
                        //   child: Text('Dashboard'),
                        // ),
                      ],
                    ),
                  )],
              )
            ],
          ),
        ),
      ),
    );
  }



}