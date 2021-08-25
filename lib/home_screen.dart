import 'package:flutter/material.dart';
import 'package:tnn_news/livenews_screen.dart';
import 'package:tnn_news/program_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _launched;
  String _launchUrlLive = "http://161.97.162.167:1936/live/tnnnews/playlist.m3u8";
  String _launchtwitter = "https://twitter.com/te_tnn";
  String _launchUrlfb = "https://www.facebook.com/TE.News.Network";
  String _launchUrlyoutube = "https://www.youtube.com/channel/UC3PfHsJxeWJ7kt5Ta9u_DXQ/featured";
  String _launchUrlUrduNews = "https://tnnnews.tv/";
  String _launchUrlLatestNews = "https://eng.tnnnews.tv/";
  String _launchUrlProgramme = "https://www.youtube.com/channel/UC3PfHsJxeWJ7kt5Ta9u_DXQ/videos";
  String _launchUrlHeadline = "https://www.youtube.com/channel/UC3PfHsJxeWJ7kt5Ta9u_DXQ/videos";
  String _number = "+923104619364";

  Future<void> _launchInBrowser ({String url}) async {
    if(await canLaunch(url)) {
      await launch(url, forceSafariVC: false , forceWebView: false);
    } else {
      throw"Could not Launch Url";
    }

  }
  Future<void> _launchInWhatsapp ({String number , String message }) async {
    String url = 'whatsapp://send?phone=$number&text=$message';
    if(await canLaunch(url)) {
      await launch(url);
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
                height: height * 0.35,
              ),
              rowName(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LiveNewsScreen(url: _launchUrlLive ,),),);
                },
                text: "WATCH LIVE",
              ),
              heightBox(height: height),
              rowName(
                onTap: () {
                  _launchInBrowser(url: _launchUrlUrduNews );
                },
                text: "URDU NEWS",
              ),
              heightBox(height: height),
              rowName(
                onTap: () {
                  _launchInBrowser(url: _launchUrlLatestNews );
                },
                text: "ENGLISH NEWS",
              ),
              heightBox(height: height),
              rowName(
                onTap: () {
                  // _launchInBrowser(url: _launchUrlProgramme );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProgramScreen(),),);
                },
                text: "PROGRAME",
              ),
              heightBox(height: height),
              rowName(
                onTap: () {
                  _launchInBrowser(url: _launchUrlHeadline );
                },
                text: "HEADLINE",
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    socialMediaButtons(width: width, height: height , path: "assets/faceb.webp", onTap: () {
                      _launchInBrowser(url: _launchUrlfb);
                    },),
                    socialMediaButtons(width: width, height: height , path: "assets/youtb.webp", onTap: () {
                      _launchInBrowser(url: _launchUrlyoutube);
                    },),
                    socialMediaButtons(width: width, height: height , path: "assets/twiteer.webp", onTap: () {
                      _launchInBrowser(url: _launchtwitter);
                    },),
                    socialMediaButtons(width: width, height: height , path: "assets/whatsa.webp", onTap: () {
                      _launchInWhatsapp(number: _number , message: " ");
                    },),

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

class socialMediaButtons extends StatelessWidget {
  const socialMediaButtons({
    Key key,
    @required this.width,
    @required this.height,
    @required this.path,
    @required this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final String path;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        path,
        width: width * 0.15,
        height: height * 0.15,
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
  final Function onTap;

  const rowName({
    Key key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
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
        ),
      ],
    );
  }
}
