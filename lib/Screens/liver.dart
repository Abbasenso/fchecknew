import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Liver extends StatefulWidget {
  @override
  _LiverState createState() => _LiverState();
}

class _LiverState extends State<Liver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 13, 45, .7),
      appBar: AppBar(
        leading: Container(
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(21, 13, 45, .4),
        //shadowColor: Colors.black54,
        elevation: 10,
        title: Text("HOW HEALTHY YOUR BODY PARTS",style: TextStyle(fontSize: 17),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Image(image: AssetImage("images/liver_one.png"),fit: BoxFit.fill,),
              ),
              SizedBox(height: 10,),
              Center(child: Text("Problems",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Container(
                  child: Card(
                    color: Colors.red,
                    child: Center(
                      child: Text("\nSkin and eyes that appear yellowish(jaundice). Abdominal pain and swelling, Swelling in the legs and ankles, Itchy skin, dark urine color, Pale stool color.\n",style:
                      TextStyle(
                          color: Colors.white
                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(child: Text("Solution",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)),
              SizedBox(height: 5,),
              Container(
                color: Color.fromARGB(255, 34, 22, 72),
                child: CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: ExactAssetImage('images/liver_two.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: ExactAssetImage('images/liver_three.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: ExactAssetImage('images/liver_four.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: ExactAssetImage('images/cslider.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 250.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.45,
                  ),
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}
