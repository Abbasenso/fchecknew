import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final hoverColor=Colors.white38;

  Future<void> _launched;
  //To open webview
  Future<void> _launchInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  //To open phonebook
  Future<void> _callUsers(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //To open email/gmail
  Future<void> _mailUsers(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //To open link in browser
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context)=>Scaffold(
          appBar: AppBar(
            title: Text("Contact Us"),
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
              Text("Feonnaa Herbals",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
                width: 200.0,
                child: Divider(
                  color: Colors.purple,
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Card(

                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.purple,
                  ),
                  title: Text("18003137322 (Toll-free)",style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: () => setState(() {
                    _launched = _callUsers('tel:18003137322');
                  }),

                ),

              ),

              Card(

                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.purple,
                  ),
                  title: Text("inquiry@laminaresearchcenter.com",style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: () => setState(() {
                    _launched = _mailUsers(
                        'mailto:inquiry@laminaresearchcenter.com?subject=F-check help&body=Hi%20FAI');
                  }),


                ),
              ),
              Card(

                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.purple,
                  ),
                  title: Text("feonnaaherbals.com",style: TextStyle(fontWeight: FontWeight.bold),),
                  hoverColor: hoverColor,
                  onTap: () => setState(() {
                    _launched = _launchInWebView('https://www.feonnaaherbals.com/');
                  }),

                ),
              ),

              Card(

                child: ListTile(
                  leading: Icon(
                    Icons.vpn_lock_rounded,
                    color: Colors.purple,
                  ),
                  title: Text("Visit FAI Site",style: TextStyle(fontWeight: FontWeight.bold),),
                  hoverColor: hoverColor,
                  onTap: () => setState(() {
                    _launched = _launchInBrowser('https://feonnaaaiworld.com/');
                  }),

                ),
              ),


            ],
          ),
        ),
      ),
    ),
  );
}