import 'package:flutter/material.dart';
import 'package:tnn_news/livenews_screen.dart';
import 'package:tnn_news/new_file.dart';
import 'package:tnn_news/webview_screen.dart';
import 'package:tnn_news/youtube.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _launched;
  String _launchUrl = "http://161.97.162.167:1936/live/tnnnews/playlist.m3u8";

  Future<void> _launchInBrowser ({String url}) async {
    if(await canLaunch(_launchUrl)) {
      await launch(_launchUrl, forceSafariVC: false , forceWebView: false);
    } else {
      throw"Could not Launch Url";
    }
    
  }

  Future<void> _launchInApp ({String url}) async {
    if(await canLaunch(_launchUrl)) {
      await launch(_launchUrl, forceSafariVC: true , forceWebView: false);
    } else {
      throw"Could not Launch Url";
    }

  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/splash4.png"), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.3,
              ),
              GestureDetector(
                  onTap: () {
                    // _launchInApp(url: _launchUrl);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage(),),);
                  },
                  child: rowName(
                    text: "WATCH LIVE",
                  )),
              heightBox(height: height),
              rowName(
                text: "URDU NEWS",
              ),
              heightBox(height: height),
              rowName(
                text: "LATEST NEWS",
              ),
              heightBox(height: height),
              rowName(
                text: "PROGRAME",
              ),
              heightBox(height: height),
              rowName(
                text: "HEADLINE",
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/faceb.webp",
                      width: width * 0.15,
                      height: height * 0.15,
                    ),
                    Image.asset(
                      "assets/youtb.webp",
                      width: width * 0.15,
                      height: height * 0.15,
                    ),
                    Image.asset(
                      "assets/twiteer.webp",
                      width: width * 0.15,
                      height: height * 0.15,
                    ),
                    Image.asset(
                      "assets/whatsa.webp",
                      width: width * 0.15,
                      height: height * 0.15,
                    ),
                  ],
                ),
              ),
              heightBox(height: height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}

class heightBox extends StatelessWidget {
  const heightBox({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.03,
    );
  }
}

class rowName extends StatelessWidget {
  final String text;

  const rowName({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * 0.94,
          height: height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
            textAlign: TextAlign.center,
          )),
        ),
      ],
    );
  }
}
