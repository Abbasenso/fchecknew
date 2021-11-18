
import 'dart:ui';

//import 'package:bmi_calculate/screens/MyVideo.dart';
//import 'package:bmi_calculator/Screens/Scanner.dart';
import 'package:fchecknew/Screens/Video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:delayed_display/delayed_display.dart';

import 'drawer.dart';

//import 'BodyCondition.dart';
//import 'MyButton.dart';

class MyResult extends StatefulWidget {
  String gender1;
  double height;
  double weight;
  double age;
  String name;
  String phone;
  double foot;
  double inchs;
  double a;
  MyResult(gen,hei,wei,ag,nam,ph,foots,inchhs,a){
    gender1=gen;
    height=hei;
    weight=wei;
    age=ag;
    name=nam;
    phone=ph;
    foot=foots;
    inchs=inchhs;
    age=a;



  }
  @override
  _MyResultState createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {

  // double bmi(){
  //   return (widget.kgs.toInt() /(((widget.fts.toInt() * 0.3048) +(widget.inchs.toInt() * 0.0254)) * ((widget.fts.toInt() * 0.3048) +(widget.inchs.toInt() * 0.0254))));
  //   // _value=bmic;
  // }
  double bmi(){
    double h=widget.foot+widget.inchs;
    double w=widget.weight;
    return ((w) /((h*0.01) * (h*0.01)));
    // _value=bmic;
  }

  getBmi(){
    double bmivalue=bmi();
    if(bmivalue <18.5){
      return ["UNDER WEIGHT","Slow and Poor Body Growth","Anemia","Low Immunity","Osteoporosis","Homonal Disbalance","Irregular Menstruation"];
    }
    else if(bmivalue>18.4 && bmivalue<=20.5){
      return ["NEAR UNDERWEIGHT","Low Energy","Weakness","Low BP","Dizziness","Black Out"," Low Immunity"];
    }
    else if(bmivalue>20.5 && bmivalue<=22.5){
      return ["HEALTHY","Follow Happy","Healthy","Active lifestyle","Good Immunity","Freshness","No Weakness"];
    }
    else if(bmivalue>22.5 && bmivalue<=24.9){
      return ["NEAR OVERWEIGHT", "High BP","Back & Leg Pain","Diabetes","Indigestion","Lethargy","Mood Swing"];
    }
    else if(bmivalue>24.9 && bmivalue<=29.9){
      return ["OVER WEIGHT","High BP","Heart Disease","Hyper Thyroidism","Fatty liver","Kidney Stone","Spondylitis"];
    }
    else{
      return ["OBESE","Stroke or Heart Attact","Cancer ","Insomnia","Polycystic ovary syndrome","Infertility","Gallbladder or Kidney Stone"];
    }

  }

  @override
  Widget build(BuildContext context) {
    //getValue();
    String name1=widget.name;
    String phone1=widget.phone;
    double weight1=widget.weight;
    double age1=widget.age;
    String genders=widget.gender1;
    double f=widget.foot;
    double i=widget.inchs;
    String height1="${f.toStringAsFixed(0)}"+"."+"${i.toStringAsFixed(0)}";


    double _value= bmi();
    List a=getBmi();
    String health=a[0];
    String p1=a[1];
    String p2=a[2];
    String p3=a[3];
    String p4=a[4];
    String p5=a[5];
    String p6=a[6];
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 13, 45, 0.7019607843137254),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(21, 13, 45, .4),
        //shadowColor: Colors.black54,
        elevation: 10,
        title: Text("BMI WHEEL"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.40,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(21, 13, 45, .9),
                child: SfRadialGauge(
                  //
                  //backgroundColor: Colors.black,
                  enableLoadingAnimation: true,
                  // title: GaugeTitle(text: "BODY MASS INDEX",alignment: GaugeAlignment.center,textStyle: TextStyle(
                  //   color: Colors.black,
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 20,
                  // ),
                  // ),
                  axes:<RadialAxis> [
                    RadialAxis(
                      //canRotateLabels: true,
                      //labelOffset: 0,
                        minimum: 12,
                        maximum: 35,
                        axisLineStyle: AxisLineStyle(
                          thickness: 132,
                          thicknessUnit: GaugeSizeUnit.logicalPixel,
                          cornerStyle: CornerStyle.bothFlat,

                          //dashArray: [1.2,1.2],

                        ),
                        //labelOffset:-50,
                        //canRotateLabels: true,
                        showLabels: false,
                        //labelFormat: null,
                        //maximumLabels: 0,
                        //showFirstLabel: false,
                        //showLastLabel: false,
                        //showAxisLine: true,
                        showTicks: false,
                        canScaleToFit: true,
                        radiusFactor: 1.15,
                        //majorTickStyle: MajorTickStyle(color: Colors.red),
                        //majorTickStyle: null,
                        //minorTickStyle: null,
                        //interval: 0,
                        // useRangeColorForAxis: true,
                        ranges: <GaugeRange>[
                          //GaugeRange(startValue: 12,startWidth:75,endWidth:75,color:Colors.black, endValue: 18.4,sizeUnit: GaugeSizeUnit.logicalPixel,gradient:SweepGradient(colors: const<Color>[Colors.green,Colors.yellow,Colors.red],stops: const<double>[0.1,0.5,1.1],center: Alignment.center,tileMode: TileMode.mirror,startAngle: 20,endAngle: 10),rangeOffset: 50),
                          //GaugeRange(startValue: 18.5, endValue: 24.9,rangeOffset: 50,sizeUnit: GaugeSizeUnit.logicalPixel,startWidth: 75,endWidth: 75,label: "UNDER WEIGHT"),

                          // GaugeRange(startValue: 13, endValue: 18.5,color: Colors.red,label:"\nUNDERWEIGHT\n<18.5\n",startWidth: 20,endWidth: 20, labelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 17,)),
                          // GaugeRange(startValue: 18.5, endValue: 25,color: Colors.green,label: "\nNORMAL\n18.5-24.9\n",labelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 17)),
                          // GaugeRange(startValue: 25, endValue: 30,color: Colors.deepOrangeAccent[400],label: "\nOVERWEIGHT\n25.0-29.9\n",labelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 17)),
                          // GaugeRange(startValue: 30, endValue: 35,color: Colors.deepOrangeAccent[700],label: "\nOBESE\n30.0-34.9\n",labelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 17)),
                          // GaugeRange(startValue: 35, endValue: 40,color: Colors.redAccent[700],label: "\nEXTREMLYOBESE\n35<\n",labelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 17)),
                          GaugeRange(startValue: 12, endValue: 18.4,rangeOffset: 40,startWidth: 92,endWidth: 92,color:Colors.yellowAccent),
                          GaugeRange(startValue: 18.5, endValue: 20.5,rangeOffset: 40,startWidth: 92,endWidth: 92,color:Colors.lightGreenAccent[700]),
                          GaugeRange(startValue: 20.6, endValue: 22.5,rangeOffset: 40,startWidth: 92,endWidth: 92,color:Color.fromRGBO(1,650 , 1, 1)),
                          GaugeRange(startValue: 22.6, endValue: 24.9,rangeOffset: 40,startWidth: 92,endWidth: 92,color:Color.fromRGBO(1, 500, 1, 30)),
                          GaugeRange(startValue: 25.0, endValue: 29.9,rangeOffset: 40,startWidth: 92,endWidth: 92,color:Colors.orange[700]),
                          GaugeRange(startValue: 30, endValue: 38,rangeOffset: 40,startWidth: 92,endWidth: 92,color:Colors.redAccent[700]),

                        ],

                        pointers: <GaugePointer>[
                          NeedlePointer(needleColor: Colors.white,needleLength: 0.5,enableAnimation: true,animationDuration: 2000,animationType: AnimationType.values[6],value: _value,enableDragging: true,knobStyle: KnobStyle(knobRadius: 0.05,borderWidth: 0.03,sizeUnit:GaugeSizeUnit.factor,borderColor: Colors.white,color: Colors.pink),
                            //needleColor:(_value >18.4 && _value<=24.9) ? Colors.green : Colors.redAccent
                            //tailStyle: TailStyle(color: Colors.yellow,length: 5,lengthUnit: GaugeSizeUnit.logicalPixel)
                          ),
                          //NeedlePointer(needleColor: Colors.black,needleLength: 0.6,enableAnimation: true,animationDuration: 150000,animationType: AnimationType.values[6],value: _value,),

                        ],
                        startAngle: 180,
                        endAngle: 360,
                        //interval: 0,
                        //centerX: 1,
                        //centerY: 1,
                        //radiusFactor: 1,
                        //canScaleToFit: true,
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(widget:Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text("BMI SCORE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15),)),
                                Center(child: Text("${_value.toStringAsFixed(1)}",style: TextStyle(color: _value>18.4 && _value<=24.9? Colors.white:Colors.white,fontWeight: FontWeight.w900,fontSize: 25),)),
                              ],
                            ),
                          ),
                            angle: 410,
                            positionFactor: 1.35,
                          ),

                          GaugeAnnotation(widget:Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text("BMI WHEEL",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 15),)),
                                //Center(child: Text("${_value.toStringAsFixed(1)}",style: TextStyle(color: _value>18.4 && _value<=24.9? Colors.green:Colors.red,fontWeight: FontWeight.w900,fontSize: 20),)),
                              ],
                            ),
                          ),
                            angle: 90,
                            positionFactor: 1.2,
                          ),

                          GaugeAnnotation(widget:Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text("NAME",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),)),
                                Center(child: Text("$name1",style: TextStyle(color: _value>18.4 && _value<=24.9? Colors.white:Colors.white,fontWeight: FontWeight.w900,fontSize: 25),)),
                              ],
                            ),
                          ),
                            angle: 130,
                            positionFactor: 1.35,
                          ),





                        ]

                    )
                  ],
                ),
              ),
              // Container(
              //   child: Image(
              //     image: AssetImage("images/guages.jpg"),
              //     fit: BoxFit.fill,
              //   ),
              // ),

              SizedBox(
                height: 10,
              ),

              Container(
                // height: MediaQuery.of(context).size.height*0.15,
                // width: MediaQuery.of(context).size.width*0.95,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   color: Color.fromRGBO(21, 13, 45, .9),
               // color: Color.fromRGBO(21, 13, 45, .9),
                // ),
                child: Center(
                  child: Image(
                    image: AssetImage("images/indicator1.png"),
                    fit: BoxFit.cover,
                  ),
                ),

              ),


              SizedBox(
                height: 10,
              ),


              DelayedDisplay(
                delay: Duration(seconds: 1),
                slidingCurve: Curves.easeInOutQuad,
                fadeIn: true,
                slidingBeginOffset: Offset.fromDirection(0),
                fadingDuration: Duration(seconds: 1),
                child: Container(
                  //height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.98,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(21, 13, 45, .9),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.055,
                          width: MediaQuery.of(context).size.width*0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.pink,
                              //color: Colors.yellowAccent
                              //gradient: LinearGradient(
                                 // colors: [Colors.yellowAccent,Colors.green,Colors.red],
                                 // begin: Alignment.centerLeft,
                                 // end: Alignment.centerRight
                              //)
                          ),
                          child: Center(child: Text("$health",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                        ),
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),


              DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingCurve: Curves.easeInOutQuad,
                  fadeIn: true,
                  slidingBeginOffset: Offset.fromDirection(0),
                  fadingDuration: Duration(seconds: 1),

                  child: Container(
                    width: MediaQuery.of(context).size.width*0.98,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(21, 13, 45, .9),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(


                            child: Center(child: Text("BMI(Body Mass Index)",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,

                                fontSize: 17,decoration: (TextDecoration.underline)),)),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10,top: 5,left: 20,right: 20),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("Body mass index, or BMI, is a measure of body size. It combines a person’s weight with their height."
                                " The results of a BMI measurement can give an idea about whether a person is healthy or unhealthy.",
                              style: TextStyle(color: Colors.white,fontSize: 15,
                                ),
                            ),
                          ),
                        ),


                        Row(
                           children: [
                             Container(
                               margin: EdgeInsets.all(8),
                               height: 10,
                               width: 10,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.yellowAccent
                               ),
                             ),
                             Text(" Extreme Under Weight(Below 18.5)",style: TextStyle(color: Colors.white,fontSize: 16))
                           ],
                        ),
                        SizedBox(height: 5,),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10,top: 5,left: 20,right: 20),
                          child: Align(

                            alignment: Alignment.topCenter,


                            child: Text("A BMI of less than 18.5 indicates that you are underweight, Your health may be at risk,you have to some medical Challenge to healthy your body. "
                                "You are recommended to ask your doctor or a dietitian for advice.",
                              style: TextStyle(color: Colors.white,fontSize: 14,
                                ),

                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green
                              ),
                            ),
                            Text(" Healthy(18.5–24.9)",style: TextStyle(color: Colors.white,fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 5,),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10,top: 5,left: 20,right: 20),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("A BMI of 18.5-24.9 indicates that you are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.",
                              style: TextStyle(color: Colors.white,fontSize: 14,
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange
                              ),
                            ),
                            Text(" Over Weight(25.0–29.9)",style: TextStyle(color: Colors.white,fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 5,),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10,top: 5,left: 20,right: 20),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("A BMI of 25-29.9 indicates that you are slightly overweight. Your health may be at risk,you have to some medical Challenge to healthy your body . "
                                "You are recommended to talk to your doctor or a dietitian for advice.",
                              style: TextStyle(color: Colors.white,fontSize: 14,
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red
                              ),
                            ),
                            Text(" OBESE(above 30.0)",style: TextStyle(color: Colors.white,fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 5,),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10,top: 5,left: 20,right: 20),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("A BMI of over 30 indicates that you are heavily overweight. "
                                "Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice.",
                              style: TextStyle(color: Colors.white,fontSize: 14,
                              ),
                            ),
                          ),
                        )

                      ],


                    ),

                  )
              ),

              SizedBox(
                height: 20,
              ),



              DelayedDisplay(
                delay: Duration(seconds: 2),
                slidingCurve: Curves.easeInOutQuad,
                fadeIn: true,
                slidingBeginOffset: Offset.fromDirection(-2),
                fadingDuration: Duration(seconds: 0),
                child: GestureDetector(
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text("BODY SCAN",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyVideo(_value,genders,name1,health,age1,height1,weight1,)
                      //Scanner(_value,genders,name1,health)
                    ));
                  },
                ),
              ),
              SizedBox(height: 5,),
              // Container(
              //     height: 100,
              //     width: 100,
              //     color: Colors.white,
              //     child: Text("${widget.inchs}")),
              //Text("$genders"),
             // Text("$kgs1"),


            ],
          )
        ],
      ),
    );
  }
}
//rangeOffset:0.2,
// sizeUnit:GaugeSizeUnit.factor
