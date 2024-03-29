import 'package:fchecknew/Screens/BMIScore.dart';
import 'package:fchecknew/Screens/Details.dart';
import 'package:fchecknew/Screens/Intens.dart';
import 'package:fchecknew/Screens/LargeIn.dart';
// import 'package:fchecknew/Screens/Lungs.dart';
import 'package:fchecknew/Screens/brain.dart';
import 'package:fchecknew/Screens/drawer.dart';
import 'package:fchecknew/Screens/intesnew.dart';
import 'package:fchecknew/Screens/liver.dart';
import 'package:fchecknew/Screens/lungsnew.dart';
import 'package:fchecknew/Screens/stom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BodyCondition extends StatefulWidget {
  String names;
  String healths;
  double bmis;
  double age;
  String height;
  double weight;
  String gender;
  BodyCondition(na,he,bm,a,h,w,g){
    names=na;
    healths=he;
    bmis=bm;
    age=a;
    height=h;
    weight=w;
    gender=g;
  }
  @override
  _BodyConditionState createState() => _BodyConditionState();
}

class _BodyConditionState extends State<BodyCondition> {
  getScore(){
    String h=widget.healths;
    if(h=="UNDER WEIGHT"){
      return [44,41,40,42,45,43,41,47];
    }
    else if(h=="NEAR UNDERWEIGHT"){
      return [78,80,79,85,83,82,80,84];
    }
    else if(h=="HEALTHY"){
      return [88,90,89,95,93,92,90,94];
    }
    else if(h=="NEAR OVERWEIGHT"){
      return [78,80,79,85,83,82,80,84];
    }
    else if(h=="OVER WEIGHT"){
      return [52,50,55,54,51,55,53,56];
    }
    else if(h=="OBESE"){
      return [44,41,40,42,45,43,41,47];
    }
  }
  @override
  Widget build(BuildContext context) {
    final list=getScore();
    int liver=list[0];
    int heart=list[1];
    int brainr=list[2];
    int intenstine=list[3];
    int lintenstine=list[4];
    int lungs=list[5];
    int stomac=list[6];
    int kidny=list[7];
    String names1=widget.names;
    String healths1=widget.healths;
    double bmis1=widget.bmis;
    double age=widget.age;
    String height=widget.height;
    double weight=widget.weight;
    String gender=widget.gender;
    return Scaffold(
      //backgroundColor: Color.fromRGBO(21, 13, 45, .7),
      backgroundColor: Colors.white,
      appBar: AppBar(
        //leading: Container(
        //),
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(21, 13, 45, 1),
        //shadowColor: Colors.black54,
        elevation: 10,
        title: Text("YOUR BODY SCORE"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Liver()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Card(
                        color: Color.fromRGBO(21, 13, 45, .2),
                        child: Image(
                          image: AssetImage("images/liver.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    //SizedBox(width: 2,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //SizedBox(height: 3,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Stomach",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("$liver"+"%",style: TextStyle(color: Colors.grey,fontSize: 32,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          //SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.red,radius: 3,),Text(" Bad",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 3,),Text(" Average",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.green,radius: 3,),Text(" Good",style: TextStyle(color: Colors.grey),)],),)
                            ],

                          ),
                          //SizedBox(height: 5,),
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 1,
                              //trackShape: RoundedRectSliderTrackShape(),
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              //showValueIndicator: ShowValueIndicator.always,
                              //valueIndicatorColor: Colors.red,
                              //valueIndicatorShape: SliderComponentShape.noThumb,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                              //overlayColor: Colors.pink,
                              //overlappingShapeStrokeColor: Colors.red,
                              thumbColor: Colors.pink,
                              overlappingShapeStrokeColor: Colors.pink,
                            ),
                            child: Slider(
                              value: liver.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              //activeColor: Colors.blue,
                              //inactiveColor: Colors.blue[100],
                              //autofocus: true,
                              //label: "${_age.toStringAsFixed(0)}",
                              onChanged: (value){
                                //f2(value);
                              },

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Card(
                        color: Color.fromRGBO(21, 13, 45, .2),
                        child: Image(
                          image: AssetImage("images/heart.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    //SizedBox(width: 2,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //SizedBox(height: 3,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Heart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("$heart"+"%",style: TextStyle(color: Colors.grey,fontSize: 32,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          //SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.red,radius: 3,),Text(" Bad",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 3,),Text(" Average",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.green,radius: 3,),Text(" Good",style: TextStyle(color: Colors.grey),)],),)
                            ],

                          ),
                          //SizedBox(height: 5,),
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 1,
                              //trackShape: RoundedRectSliderTrackShape(),
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              //showValueIndicator: ShowValueIndicator.always,
                              //valueIndicatorColor: Colors.red,
                              //valueIndicatorShape: SliderComponentShape.noThumb,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                              //overlayColor: Colors.pink,
                              //overlappingShapeStrokeColor: Colors.red,
                              thumbColor: Colors.pink,
                              overlappingShapeStrokeColor: Colors.pink,
                            ),
                            child: Slider(
                              value: heart.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              //activeColor: Colors.blue,
                              //inactiveColor: Colors.blue[100],
                              //autofocus: true,
                              //label: "${_age.toStringAsFixed(0)}",
                              onChanged: (value){
                                //f2(value);
                              },

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Brain()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Card(
                        color: Color.fromRGBO(21, 13, 45, .2),
                        child: Image(
                          image: AssetImage("images/brain.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    //SizedBox(width: 2,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(height: 3,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Brain",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("$brainr"+"%",style: TextStyle(color: Colors.grey,fontSize: 32,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          //SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.red,radius: 3,),Text(" Bad",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 3,),Text(" Average",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.green,radius: 3,),Text(" Good",style: TextStyle(color: Colors.grey),)],),)
                            ],

                          ),
                          //SizedBox(height: 5,),
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 1,
                              //trackShape: RoundedRectSliderTrackShape(),
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              //showValueIndicator: ShowValueIndicator.always,
                              //valueIndicatorColor: Colors.red,
                              //valueIndicatorShape: SliderComponentShape.noThumb,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                              //overlayColor: Colors.pink,
                              //overlappingShapeStrokeColor: Colors.red,
                              thumbColor: Colors.pink,
                              overlappingShapeStrokeColor: Colors.pink,
                            ),
                            child: Slider(
                              value: brainr.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              //activeColor: Colors.blue,
                              //inactiveColor: Colors.blue[100],
                              //autofocus: true,
                              //label: "${_age.toStringAsFixed(0)}",
                              onChanged: (value){
                                //f2(value);
                              },

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Intens()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    width: MediaQuery.of(context).size.width*0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                      color: Color.fromRGBO(21, 13, 45, 1),
                    ),
                    child: Card(
                      color: Color.fromRGBO(21, 13, 45, .2),
                      child: Image(
                        image: AssetImage("images/smlin.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  //SizedBox(width: 2,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    width: MediaQuery.of(context).size.width*0.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                      color: Color.fromRGBO(21, 13, 45, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //SizedBox(height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Liver",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                              Text("$intenstine"+"%",style: TextStyle(color: Colors.grey,fontSize: 32,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        //SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.red,radius: 3,),Text(" Bad",style: TextStyle(color: Colors.grey),)],),),
                            Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 3,),Text(" Average",style: TextStyle(color: Colors.grey),)],),),
                            Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.green,radius: 3,),Text(" Good",style: TextStyle(color: Colors.grey),)],),)
                          ],

                        ),
                        //SizedBox(height: 5,),
                        SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 1,
                            //trackShape: RoundedRectSliderTrackShape(),
                            activeTickMarkColor: Colors.transparent,
                            inactiveTickMarkColor: Colors.transparent,
                            //showValueIndicator: ShowValueIndicator.always,
                            //valueIndicatorColor: Colors.red,
                            //valueIndicatorShape: SliderComponentShape.noThumb,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            //overlayColor: Colors.pink,
                            //overlappingShapeStrokeColor: Colors.red,
                            thumbColor: Colors.pink,
                            overlappingShapeStrokeColor: Colors.pink,
                          ),
                          child: Slider(
                            value: intenstine.toDouble(),
                            min: 0,
                            max: 100,
                            divisions: 100,
                            //activeColor: Colors.blue,
                            //inactiveColor: Colors.blue[100],
                            //autofocus: true,
                            //label: "${_age.toStringAsFixed(0)}",
                            onChanged: (value){
                              //f2(value);
                            },

                          ),
                        ),
                      ],
                    ),
                  )
                ],
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Lin()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Card(
                        color: Color.fromRGBO(21,13, 45, .2),
                        child: Image(
                          image: AssetImage("images/larin.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    //SizedBox(width: 2,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //SizedBox(height: 3,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Large Intenstine",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("$lintenstine"+"%",style: TextStyle(color: Colors.grey,fontSize: 32,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          // SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.red,radius: 3,),Text(" Bad",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 3,),Text(" Average",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.green,radius: 3,),Text(" Good",style: TextStyle(color: Colors.grey),)],),)
                            ],

                          ),
                          //SizedBox(height: 5,),
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 1,
                              //trackShape: RoundedRectSliderTrackShape(),
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              //showValueIndicator: ShowValueIndicator.always,
                              //valueIndicatorColor: Colors.red,
                              //valueIndicatorShape: SliderComponentShape.noThumb,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                              //overlayColor: Colors.pink,
                              //overlappingShapeStrokeColor: Colors.red,
                              thumbColor: Colors.pink,
                              overlappingShapeStrokeColor: Colors.pink,
                            ),
                            child: Slider(
                              value: lintenstine.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              //activeColor: Colors.blue,
                              //inactiveColor: Colors.blue[100],
                              //autofocus: true,
                              //label: "${_age.toStringAsFixed(0)}",
                              onChanged: (value){
                                //f2(value);
                              },

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Intesnew()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Card(
                        color: Color.fromRGBO(21, 13, 45, .2),
                        child: Image(
                          image: AssetImage("images/kidny.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    //SizedBox(width: 2,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //SizedBox(height: 3,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Intestine",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("$kidny"+"%",style: TextStyle(color: Colors.grey,fontSize: 32,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          // SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.red,radius: 3,),Text(" Bad",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 3,),Text(" Average",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.green,radius: 3,),Text(" Good",style: TextStyle(color: Colors.grey),)],),)
                            ],

                          ),
                          //SizedBox(height: 5,),
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 1,
                              //trackShape: RoundedRectSliderTrackShape(),
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              //showValueIndicator: ShowValueIndicator.always,
                              //valueIndicatorColor: Colors.red,
                              //valueIndicatorShape: SliderComponentShape.noThumb,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                              //overlayColor: Colors.pink,
                              //overlappingShapeStrokeColor: Colors.red,
                              thumbColor: Colors.pink,
                              overlappingShapeStrokeColor: Colors.pink,
                            ),
                            child: Slider(
                              value: kidny.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              //activeColor: Colors.blue,
                              //inactiveColor: Colors.blue[100],
                              //autofocus: true,
                              //label: "${_age.toStringAsFixed(0)}",
                              onChanged: (value){
                                //f2(value);
                              },

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Lungsnew()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Card(
                        color: Color.fromRGBO(21, 13, 45, .2),
                        child: Image(
                          image: AssetImage("images/lunce.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    //SizedBox(width: 2,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //SizedBox(height: 3,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Lungs",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("$lungs"+"%",style: TextStyle(color: Colors.grey,fontSize: 32,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          //SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.red,radius: 3,),Text(" Bad",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 3,),Text(" Average",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.green,radius: 3,),Text(" Good",style: TextStyle(color: Colors.grey),)],),)
                            ],

                          ),
                          //SizedBox(height: 5,),
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 1,
                              //trackShape: RoundedRectSliderTrackShape(),
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              //showValueIndicator: ShowValueIndicator.always,
                              //valueIndicatorColor: Colors.red,
                              //valueIndicatorShape: SliderComponentShape.noThumb,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                              //overlayColor: Colors.pink,
                              //overlappingShapeStrokeColor: Colors.red,
                              thumbColor: Colors.pink,
                              overlappingShapeStrokeColor: Colors.pink,
                            ),
                            child: Slider(
                              value: lungs.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              //activeColor: Colors.blue,
                              //inactiveColor: Colors.blue[100],
                              //autofocus: true,
                              //label: "${_age.toStringAsFixed(0)}",
                              onChanged: (value){
                                //f2(value);
                              },

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Stom()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Card(
                        color: Color.fromRGBO(21, 13, 45, .2),
                        child: Image(
                          image: AssetImage("images/stomack.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    //SizedBox(width: 2,),
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Color.fromRGBO(21, 13, 45, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //SizedBox(height: 3,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Kidney",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("$stomac"+"%",style: TextStyle(color: Colors.grey,fontSize: 32,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          //SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.red,radius: 3,),Text(" Bad",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 3,),Text(" Average",style: TextStyle(color: Colors.grey),)],),),
                              Container(child: Row(children: [CircleAvatar(backgroundColor: Colors.green,radius: 3,),Text(" Good",style: TextStyle(color: Colors.grey),)],),)
                            ],

                          ),
                          //SizedBox(height: 5,),
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 1,
                              //trackShape: RoundedRectSliderTrackShape(),
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              //showValueIndicator: ShowValueIndicator.always,
                              //valueIndicatorColor: Colors.red,
                              //valueIndicatorShape: SliderComponentShape.noThumb,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                              //overlayColor: Colors.pink,
                              //overlappingShapeStrokeColor: Colors.red,
                              thumbColor: Colors.pink,
                              overlappingShapeStrokeColor: Colors.pink,
                            ),
                            child: Slider(
                              value: stomac.toDouble(),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              //activeColor: Colors.blue,
                              //inactiveColor: Colors.blue[100],
                              //autofocus: true,
                              //label: "${_age.toStringAsFixed(0)}",
                              onChanged: (value){
                                //f2(value);
                              },

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BMIScore(names1,healths1,bmis1,age,height,weight,gender)));
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration:BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(5)),
                  
                  child: Center(
                    child: Text("SOLUTION",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          )
        ],
      ),
    );
  }
}
