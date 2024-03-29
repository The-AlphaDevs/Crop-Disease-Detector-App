import 'package:flutter/material.dart';
import 'image_storer.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'globals.dart' as globals;

class Result extends StatefulWidget {
  final String predictedDisease;
  final String confidence;
  Result({
    @required this.predictedDisease,
    @required this.confidence,
  });
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  static final obj = ImageStorer();
  File cropimage = obj.getImage();

  @override
  void initState() {
    super.initState();
    globals.hasHistory = true;
  }

  void googleSearch(String queryWord) async {
    // String queryWord;
    // const String search_query = "Diseases similar to Tomato late blight";
    String url = "https://www.google.com/search?q=" + queryWord;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Aatmarnirbhar Farmer'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 350,
                      width: 380,
                      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Color(0xff000000),
                        width: 6,
                      )),
                      child: Image.file(cropimage,
                          width: 380, height: 350, fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 40,
                      width: 20,
                    ),
                    Container(
                      color: Color(0xFFa4f5ff),
                      padding: EdgeInsets.all(30),
                      height: 150,
                      width: 380,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Predicted Disease: ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Nunito',
                                    color: Colors.black),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  widget.predictedDisease,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                      color: Colors.green),
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Confidence: ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Nunito',
                                    color: Colors.black),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  widget.confidence + "%",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                      color: Colors.green),
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 20,
                    ),
                    Container(
                      color: Color(0xFFa4f5ff),
                      padding: EdgeInsets.all(30),
                      height: 98,
                      width: 385,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Remedies: ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Nunito',
                                    color: Colors.black),
                                softWrap: false,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                height: 55,
                                width: 190,
                                child: RaisedButton.icon(
                                  label: Text(
                                    "Crops with  \nSimilar Diseases",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Nunito',
                                        color: Colors.white),
                                  ),
                                  textColor: Colors.white,
                                  icon: Icon(Icons.search, color: Colors.white),
                                  color: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17)),
                                  onPressed: () {
                                    googleSearch("Diseases similar to " +
                                        widget.predictedDisease);
                                    // pickImageFromGallery(ImageSource.gallery);
                                    // Navigator.push(context,
                                    //MaterialPageRoute(builder: (context) => Predict(cropimage: _image)));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                height: 50,
                                width: 190,
                                child: RaisedButton.icon(
                                  label: Text(
                                    "More Remedies",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Nunito',
                                        color: Colors.white),
                                  ),
                                  textColor: Colors.white,
                                  icon: Icon(Icons.search, color: Colors.white),
                                  color: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17)),
                                  onPressed: () {
                                    googleSearch("Home Remedies for " +
                                        widget.predictedDisease);
                                    // pickImageFromGallery(ImageSource.gallery);
                                    // Navigator.push(context,
                                    // MaterialPageRoute(builder: (context) => Predict(cropimage: _image)));
                                  },
                                ),
                              ),
                            ),

                            //     SizedBox(
                            //   height: 30,
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
