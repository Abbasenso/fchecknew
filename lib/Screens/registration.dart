import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';



class Registration extends StatefulWidget {

  @override
  State<Registration> createState() => _RegistrationState();
}




class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context){
   return MaterialApp(
     home: Scaffold(
       body: Container(
         child: SafeArea(
           child:WebView(
             initialUrl: 'https://flutter.dev/?gclsrc=ds&gclsrc=ds',
             javascriptMode: JavascriptMode.unrestricted,
             onWebViewCreated: (WebViewController wc){

             },
           ),
         ),
       ),
     ),
   );

  }
  }