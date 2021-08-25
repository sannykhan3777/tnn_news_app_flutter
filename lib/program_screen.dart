import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({Key key}) : super(key: key);

  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {

  String url1 = "http://tnnnews.tv/category/%D8%B5%D8%A8%D8%AD-%D9%88%D9%90%D9%90%D8%AF-%D9%B9%DB%8C-%D8%A7%DB%8C%D9%86-%D8%A7%DB%8C%D9%86/";
  String url2 = "http://tnnnews.tv/category/%DA%A9%D9%88%D9%88%D8%B1-%D8%B3%D9%B9%D9%88%D8%B1%DB%8C-%D9%88%D9%90%D8%AF-%D9%B9%DB%8C-%D8%A7%DB%8C%D9%86-%D8%A7%DB%8C%D9%86/";
  String url3 = "http://tnnnews.tv/category/%D8%B3%D9%BE%D9%88%D8%B1%D9%B9%D8%B3-%D9%88%D9%90%D9%90%D8%AF-%D9%B9%DB%8C-%D8%A7%DB%8C%D9%86-%D8%A7%DB%8C%D9%86/";
  String url4 = "http://tnnnews.tv/category/%DA%A9%D8%B1%D8%A7%D8%A6%D9%85%D8%B2-%D9%88%D9%90%D9%90%D8%AF-%D9%B9%DB%8C-%D8%A7%DB%8C%D9%86-%D8%A7%DB%8C%D9%86/";
  String url5 = "http://tnnnews.tv/category/%DB%81%DB%8C%D9%84%D8%AA%DA%BE-%D9%88%D9%90%D8%AF-%D9%B9%DB%8C-%D8%A7%DB%8C%D9%86-%D8%A7%DB%8C%D9%86/";
  String url6 = "http://tnnnews.tv/category/%D8%B3%D9%84%DB%8C%D8%A8%D8%B1%D9%B9%DB%8C-%D9%B9%D8%A7%D8%A6%D9%85-%D9%88%D9%90%D8%AF-%D9%B9%DB%8C-%D8%A7%DB%8C%D9%86-%D8%A7%DB%8C%D9%86/";
  String url7 = "http://tnnnews.tv/category/%D8%AD%D9%82%D8%A7%D8%A6%D9%82-%D9%88%D9%90%D9%90%D8%AF-%D9%B9%DB%8C-%D8%A7%DB%8C%D9%86-%D8%A7%DB%8C%D9%86/";
  String url8 = "http://tnnnews.tv/category/%D9%84%D8%A7%D8%A6%DB%8C%D9%88-%D9%88%D9%90%D9%90%D8%AF-%D8%B9%D8%B4%D8%A7-%D8%B8%DB%81%D8%B1%DB%81/";

  Future<void> _launchInBrowser ({String url}) async {
    if(await canLaunch(url)) {
      await launch(url, forceSafariVC: false , forceWebView: false);
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
            child: GridView.count(mainAxisSpacing: 0.0, crossAxisSpacing: 40.0,padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),crossAxisCount: 2 , children: [

              programBox(height: height, width: width , onTapp: () {
                _launchInBrowser(url: url1);
              }, imagePath: "assets/01.png",),
              programBox(height: height, width: width , onTapp: () {
                _launchInBrowser(url: url2);
              },imagePath: "assets/02.png",),
              programBox(height: height, width: width , onTapp: () {
                _launchInBrowser(url: url3);
              },imagePath: "assets/03.png",),
              programBox(height: height, width: width , onTapp: () {
                _launchInBrowser(url: url4);
              },imagePath: "assets/04.png",),
              programBox(height: height, width: width , onTapp: () {
                _launchInBrowser(url: url5);
              },imagePath: "assets/05.png",),
              programBox(height: height, width: width , onTapp: () {
                _launchInBrowser(url: url6);
              },imagePath: "assets/06.png",),
              programBox(height: height, width: width , onTapp: () {
                _launchInBrowser(url: url7);
              },imagePath: "assets/07.png",),
              programBox(height: height, width: width , onTapp: () {
                _launchInBrowser(url: url8);
              },imagePath: "assets/08.png",),


            ]


              ),
          ),
        ),
      ),
    );
  }
}

class programBox extends StatelessWidget {
  const programBox({
    Key key,
    @required this.height,
    @required this.width,
    @required this.onTapp,
    @required this.imagePath,
  }) : super(key: key);

  final double height;
  final double width;
  final Function onTapp;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
    height: height * 0.1,
    width: width * 0.1,
    child: Center(
      child: GestureDetector(onTap : onTapp,child: Image.asset(imagePath , height: height * 0.5 , width: width * 0.5,)),

    ),
            );
  }
}

