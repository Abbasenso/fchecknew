import 'package:fchecknew/Screens/Details.dart';
import 'package:fchecknew/Screens/MyHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _formkey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Image.asset("images/fchecknew.png",height: size.height * 0.21,),

                SizedBox(height: size.height * 0.03),
                Image.asset(
                  "assets/icons/dfgd.png",
                  height: size.height * 0.27,
                ),
                SizedBox(height: size.height * 0.03),

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFFF1E6FF),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Username",
                            border: InputBorder.none,


                            icon: Icon(
                              Icons.person,
                              color: Colors.purple,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          validator: (value) {
                            if (value.isEmpty) {
                              Pattern pattern =
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?)*$";
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value) || value == null)
                                return 'Enter a valid username';
                              else
                                return null;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(

                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFFF1E6FF),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.lock,
                              color: Colors.purple,
                            ),
                          ),
                          // keyboardType:  TextInputType.visiblePassword,
                          // controller: passwordTextController,
                          controller: password,
                          validator: (value) {
                            if (value.isEmpty) {
                              // Pattern pattern =  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              //     r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              //     r"{0,253}[a-zA-Z0-9])?)*$";
                              // RegExp regex = new RegExp(pattern);
                              // if (!regex.hasMatch(value) || value == null)
                              return 'The password field cannot be empty';
                            } else if (value.length < 6) {
                              return "The password has to be at least 6 character long";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color.fromARGB(255, 226, 3, 83),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: ListTile(
                          title: MaterialButton(
                            onPressed: ()  {
                              if (_formkey.currentState.validate()) {
                                login(context,email.text,password.text);
                              }
                              else{
                                login(context,email.text,password.text);
                              }
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
void login( BuildContext context , String email, String password) {
  String phone_no = 'Feonnaa' , pass = 'feonnaa@123';
  if(phone_no.toString() ==  email.toString() && pass.toString() == password.toString()){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>MyHome()));
  }else{
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Invalid username or password')));
  }
}
