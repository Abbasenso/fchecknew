import 'package:fchecknew/Screens/BmiWheel.dart';
import 'package:fchecknew/Screens/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController _firstController = TextEditingController();
  TextEditingController _secondController = TextEditingController();
  String gender;
  double height;
  double weight=74.0;
  double age =19.0;
  String name;
  String phone;
  double ft;
  double inch=0.0;



  final k1= GlobalKey<FormState>();
  final k2=GlobalKey<FormState>();
  final k3=GlobalKey<FormState>();
  final k4=GlobalKey<FormState>();
  //final k2= GlobalKey<FormState>();
  // bool validateing(){
  //   if(name==null || gender==null || phone==null){
  //     return false;
  //   }
  //   return true;
  //
  // }
  // double getHeight(){
  //   return (ft+inch);
  // }
  @override
  Widget build(BuildContext context) {
    //height=getHeight();
    //bool v=validateing();
    // String gender;
    // double height=138.0;
    // double weight=74.0;
    // double age =19.0;
    // String name;
    // String phone;
    return Scaffold(
      //backgroundColor: Color.fromRGBO(21, 13, 45, .7),
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(21, 13, 45, 1),
        //backgroundColor: Colors.white,
        //shadowColor: Colors.black54,
        elevation: 10,
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Form(
                key: k1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    height: 60,
                    child: TextFormField(
                      enableInteractiveSelection: false,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Name ',
                        labelStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Name';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          name=value;
                        });
                      },
                    ),

                  ),
                ),
              ),


              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Row(
              //     crossAxisAlignment:CrossAxisAlignment.center ,
              //     children: [
              //       Text("Name:",style: TextStyle(color: Colors.white,fontSize: 15),),
              //       SizedBox(
              //         width: 35,
              //       ),
              //       Container(
              //         height: 45,
              //         width: 250,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //           shape: BoxShape.rectangle,
              //           borderRadius: BorderRadius.circular(5)
              //         ),
              //         child: Center(
              //           child: TextFormField(
              //             validator: (value){
              //               if (value == null || value.isEmpty) {
              //                 return ' Please enter your name';
              //               }
              //               else if(value.length<4){
              //                 return ' Name is too shot';
              //               }
              //               else if(value.length>20){
              //                 return ' Name is too large';
              //               }
              //               return null;
              //             },
              //             decoration: InputDecoration(
              //               //hintText: "Enter your name",
              //               //alignLabelWithHint: true,
              //               //hintMaxLines: 1,
              //               //eabled: true,
              //               border: InputBorder.none,
              //               focusedBorder: InputBorder.none,
              //               enabledBorder: InputBorder.none,
              //               errorBorder: InputBorder.none,
              //               disabledBorder: InputBorder.none,
              //               // hintStyle: TextStyle(
              //               //   color: Colors.grey,
              //               // ),
              //
              //             ),
              //             onChanged: (value){
              //               setState(() {
              //                 name=value;
              //               });
              //             },
              //             maxLines: 1,
              //             autovalidateMode: AutovalidateMode.onUserInteraction,
              //           ),
              //         ),
              //       )
              //
              //     ],
              //   ),
              // ),
              SizedBox(height: 10,),
              Form(
                key: k2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    height: 60,
                    child: TextFormField(
                      //keyboardType:TextInputType.phone,
                      enableInteractiveSelection: false,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Phone ',
                        labelStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Phone';
                        }
                        else if(value.length<10 || value.length>10){
                          return 'Please put the correct one';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          phone=value;
                        });
                      },
                    ),

                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Row(
              //     crossAxisAlignment:CrossAxisAlignment.center ,
              //     children: [
              //       Text("Phone No:",style: TextStyle(color: Colors.white,fontSize: 15),),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Container(
              //         margin: EdgeInsets.only(left: 4),
              //         height: 45,
              //         width: 250,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             shape: BoxShape.rectangle,
              //             borderRadius: BorderRadius.circular(5)
              //         ),
              //         child: Center(
              //           child: TextFormField(
              //             validator: (value){
              //               if(value == null || value.isEmpty){
              //                 return ' Please enter your phone no.';
              //               }
              //               else if(value.length<10 || value.length>10){
              //                 return ' Please enter a valid phone no.';
              //               }
              //               return null;
              //             },
              //             decoration: InputDecoration(
              //               //hintText: "Enter your name",
              //               //alignLabelWithHint: true,
              //               //hintMaxLines: 1,
              //               //eabled: true,
              //               border: InputBorder.none,
              //               focusedBorder: InputBorder.none,
              //               enabledBorder: InputBorder.none,
              //               errorBorder: InputBorder.none,
              //               disabledBorder: InputBorder.none,
              //               // hintStyle: TextStyle(
              //               //   color: Colors.grey,
              //               // ),
              //
              //             ),
              //             maxLines: 1,
              //             keyboardType: TextInputType.phone,
              //             onChanged: (value){
              //               setState(() {
              //                 phone=value;
              //               });
              //             },
              //             autovalidateMode: AutovalidateMode.onUserInteraction,
              //           ),
              //         ),
              //       )
              //
              //     ],
              //   ),
              // ),
              SizedBox(height: 20,),
              Form(
                key:k3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          gender="male";
                        });
                      },
                      child: Container(
                        height: gender=="male"?145:140,
                        width: gender=="male"?135:130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gender=="male"?Colors.pink: Color.fromRGBO(41, 26, 87, 1.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height:100,
                              width: 130,
                              //color: Colors.black,
                              child: Center(
                                child: Image(
                                  image: AssetImage("images/male.png"),
                                  fit: BoxFit.contain,
                                  height: 60,
                                ),
                              ),

                            ),
                            SizedBox(height: 10,),
                            Text("MALE",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          gender="female";
                        });
                      },
                      child: Container(
                        height: gender=="female"?145:140,
                        width: gender=="female"?135:130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: gender=="female"?Colors.pink: Color.fromRGBO(41, 26, 87, 1.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height:100,
                              width: 130,
                              //color: Colors.black,
                              child: Center(
                                child: Image(
                                  image: AssetImage("images/female.png"),
                                  fit: BoxFit.contain,
                                  height: 60,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("FEMALE",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20,),
              Container(
                height: 110,
                width: 350,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(41, 26, 87, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(width: 15,),
                    Form(
                      key: k4,
                      child: Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(25, 20, 70, 1),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            controller: _firstController,
                            style: TextStyle(color: Colors.white),
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              // else if(value.length<4){
                              //   return ' Name is too shot';
                              // }
                              else if(value.length>2){
                                return ' ';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              //hintText: "Enter your name",
                              //alignLabelWithHint: true,
                              //hintMaxLines: 1,
                              //eabled: true,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                              // hintStyle: TextStyle(
                              //   color: Colors.grey,
                              // ),

                            ),
                            onChanged: (value){

                              setState(() {
                                ft=double.tryParse(value)*30.48;
                              });
                             // _ftCal();
                            },
                            //maxLines: 1,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            //keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Text("ft.",style: TextStyle(color: Colors.white),),
                    SizedBox(width: 10,),
                    Container(
                      height: 45,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(25, 20, 70, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          controller: _secondController,
                          style: TextStyle(color: Colors.white),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return ' ';
                            }
                            // else if(value.length<4){
                            //   return ' Name is too shot';
                            // }
                            else if(value.length>2){
                              return ' ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            //hintText: "Enter your name",
                            //alignLabelWithHint: true,
                            //hintMaxLines: 1,
                            //eabled: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            suffixStyle: TextStyle(color: Colors.white)
                            // hintStyle: TextStyle(
                            //   color: Colors.grey,
                            // ),

                          ),
                          onChanged: (value){
                            //_ftCal();
                           if(value==""){
                             setState(() {
                               inch=0;
                               _secondController.text="0";
                             });
                           }
                           else{
                             setState(() {
                               inch=double.tryParse(value)*2.54;
                             });
                           }
                          },
                          //maxLines: 1,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          //keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Text("in.",style: TextStyle(color: Colors.white),)
                  ],
                ),

                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(top: 10),
                //       child: Text("HEIGHT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                //     ),
                //     SizedBox(height: 20,),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text("${height.toStringAsFixed(0)}",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),Text(" cm",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold) ,)
                //       ],
                //     ),
                //
                //     SliderTheme(
                //       data: SliderThemeData(
                //         trackHeight: 1,
                //         activeTrackColor: Colors.white,
                //         inactiveTrackColor: Colors.white,
                //         activeTickMarkColor: Colors.transparent,
                //         inactiveTickMarkColor: Colors.transparent,
                //         thumbColor: Colors.pink,
                //         //overlayColor: Colors.pink[300]
                //       ),
                //       child: Slider(
                //         value: height,
                //         min: 0,
                //         max: 200,
                //         divisions: 200,
                //         //activeColor: Colors.white,
                //         //inactiveColor: Colors.white,
                //         //autofocus: true,
                //         label: "${height.toStringAsFixed(0)}",
                //         onChanged: (value){
                //          setState(() {
                //            height=value;
                //          });
                //         },
                //
                //       ),
                //     ),
                //
                //   ],
                // ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.indigo[900]
                      color: Color.fromRGBO(41, 26, 87, 1.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text("WEIGHT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${weight.toStringAsFixed(0)}",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                            Text(" kg",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(),
                                color: Color.fromRGBO(21, 13, 45, .7),
                              ),
                              child: Center(
                                child: IconButton(
                                    onPressed:(){
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                ),
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                color: Color.fromRGBO(21, 13, 45, .7),
                              ),
                              child: Center(
                                child: IconButton(
                                    onPressed:(){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 180,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Colors.indigo[900]
                      color: Color.fromRGBO(41, 26, 87, 1.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text("AGE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${age.toStringAsFixed(0)}",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                            //Text(" kg",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                color: Color.fromRGBO(21, 13, 45, .7),
                              ),
                              child: Center(
                                child: IconButton(
                                    onPressed:(){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                ),
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                color: Color.fromRGBO(21, 13, 45, .7),
                              ),
                              child: Center(
                                child: IconButton(
                                    onPressed:(){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  if (k1.currentState.validate() && gender!=null && k2.currentState.validate() && k3.currentState.validate() && k4.currentState.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyResult(gender,height,weight,age,name,phone,ft,inch,age)));

                  }
                  else{
                    final snackBar = SnackBar(
                      content: Text("FILL ALL THE FIELDS WITH GENDER TOO",style: TextStyle(color: Colors.red,fontSize: 12),),
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
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                 // v==true?
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyResult(gender,height,weight,age,name,phone)));
                  // : SnackBar(
                  //   content: const Text('Please fill all the fields'),
                  //   // action: SnackBarAction(
                  //   //   label: 'Action',
                  //   //   onPressed: () {
                  //   //     // Code to execute.
                  //   //   },
                  //   // ),
                  // );
                  // if(name==null || phone==null || gender==null){
                  //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyResult(gender,height,weight,age,name,phone)));
                  // }
                  // else{
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MyResult(gender,height,weight,age,name,phone)));
                  // }
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width*.6,

                  decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(5)),

                  child: Center(
                    child: Text("CALCULATE YOUR BMI",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,),),
                  ),
                ),
              ),
              SizedBox(height: 5,)

              //  Text(("$inch"),style: TextStyle(color: Colors.white),)

            ],
          )
        ],
      ),
    );
  }

  // void _ftCal() {
  //   if (_firstController.text.trim().isNotEmpty &&
  //       _secondController.text.trim().isNotEmpty) {
  //     final firstValue = double.parse(_firstController.text);
  //     final secondValue = double.parse(_secondController.text);
  //     height=firstValue+secondValue;
  //   }
  // }
   }


