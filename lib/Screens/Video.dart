 import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:fchecknew/Screens/BodyCondition.dart';




class MyVideo extends StatefulWidget {
  double vbmiScore;
  String vgend;
  String vnam;
  String vhel;
  double age;
  String height;
  double weight;
  MyVideo(va,vb,vn,vh,a,h,w){
    vbmiScore=va;
    vgend=vb;
    vnam=vn;
    vhel=vh;
    age=a;
    height=h;
    weight=w;
  }
  @override
  _MyVideoState createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  // void initState() {
  //   super.initState();
  //   listener = () {
  //     setState(() {});
  //   };
  // }
  void initState() {
      super.initState();
      String gender=widget.vgend;
      if(gender=="male"){
        playerController=VideoPlayerController.asset("video/malev.mp4")
          ..initialize().then((_){
            setState(() {

            });
          }


          );
      }
      else{
        playerController = VideoPlayerController.asset("video/femalev.mp4")
          ..initialize().then((_){
            setState(() {

            });
          })
        ;
      }


      //createVideo();
    // double s_value=widget.sv;
    // String sgenders=widget.sg;
    // String sname1=widget.sn;
    // String shealth=widget.sh;
    // super.initState();
    double vid_bmiScore1=widget.vbmiScore;
    //String vid_gen=widget.vgend;
    String vid_name=widget.vnam;
    String vid_health=widget.vhel;
    double ag=widget.age;
    String he=widget.height;
    double we=widget.weight;
    String ge=widget.vgend;
    Timer(Duration(seconds: 9),
            ()async =>
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //       MyVideo(s_value,sgenders,sname1,shealth)
        //   ),
        // )
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    BodyCondition(vid_name,vid_health,vid_bmiScore1,ag,he,we,ge)
            )
        )

    );


  }

  // void createVideo() {
  //   //double vid_bmiScore1=widget.vbmiScore;
  //   String vidgen=widget.vgend;
  //   //String vid_name=widget.vnam;
  //  //String vid_health=widget.vhel;
  //   //String vigend=vg;
  //   if (playerController == null) {
  //     if(vidgen=="male"){
  //       playerController = VideoPlayerController.asset("video/malev.mp4")
  //         ..addListener(listener)
  //         ..setVolume(1.0)
  //         ..initialize()
  //         ..play()//..dispose()
  //           ;
  //     }
  //     else{
  //       playerController = VideoPlayerController.asset("video/femalev.mp4")
  //         ..addListener(listener)
  //         ..setVolume(1.0)
  //         ..initialize()
  //         ..play()//..dispose()
  //           ;
  //     };
  //
  //
  //   }
  //   // else {
  //   //   if (playerController.value.isPlaying) {
  //   //     //playerController.pause();
  //   //   } else {
  //   //     //playerController.initialize();
  //   //     //playerController.play();
  //   //    //playerController.dispose();
  //   //     // .whenComplete(()=>
  //   //         //Navigator.push(context , MaterialPageRoute(builder: (context)=>BodyCondition(vid_name,vid_health,vid_bmiScore1)))
  //   // //);
  //   //   }
  //   // }
  // }

  //@override
  // void deactivate() {
  //   playerController.setVolume(1.0);
  //   playerController.removeListener(listener);
  //   super.deactivate();
  //   // playerController.dispose().whenComplete(() => Navigator.push(context , MaterialPageRoute(builder: (context)=>NextPage())));
  // }
  @override
  Widget build(BuildContext context) {
   // String videogender=widget.vgend;
    // String name=widget.nam;
    // String health=widget.hel;
    // double bmiScore1=widget.bmiScore;
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 13, 45, .7),
      appBar: AppBar(

        backgroundColor: Color.fromRGBO(31, 17, 71, 0.4),
        //shadowColor: Colors.black54,

        title: Text("BMI SCANNING....",style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              //height: 200,
            // width: 200,
             height: MediaQuery.of(context).size.height*0.7,
              width: MediaQuery.of(context).size.width*0.9,
              child: (playerController.value.isInitialized
                  ? VideoPlayer(
                playerController..play()..setVolume(1.0),
              )
                  : Container(
                // height: 100,
                // width: 100,
                // color: Colors.red,
              )),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text("Scanning...",style: TextStyle(color: Colors.white,fontSize: 15),),
          )
          //Text("$bmiScore1"),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     createVideo();
      //     playerController.play();
      //   },
      //   child: Icon(Icons.play_arrow),
      // ),
    );
  }
}
