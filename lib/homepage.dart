import 'package:flutter/material.dart';
import 'package:covid_19_stats/Animations/Fadeanimation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_19_stats/infoscreen.dart';
import 'package:covid_19_stats/india.dart';
import 'package:covid_19_stats/global.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(1),
                  height: 500,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 20,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 130,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            2,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        right: 15,
                        width: 80,
                        top: 48,
                        child: FadeAnimation(2, Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context){
                                      return InfoScreen();
                                    },
                                  ),);
                                },
                                child: SvgPicture.asset("assets/icons/menu.svg"),
                              )
                            ],
                          ),

                        )),
                      ),
                      Positioned(
                        left: 40,
                        height: 500,
                        child: FadeAnimation(
                            1.6,
                            Container(
                              // margin: EdgeInsets.only(top: 0),
                              child: Center(
                                child: Text(
                                  "Stay Home",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            )),
                      ),
                      Positioned(
                        right: 20,
                        height: 600,
                        child: FadeAnimation(
                            1.6,
                            Container(
                              // margin: EdgeInsets.only(top: 0),
                              child: Center(
                                child: Text(
                                  "Stay Safe",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            )),
                      )

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal : 10.0, vertical: 50),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          2,
                           RaisedButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Global()),
                              );
                            },
                             padding: const EdgeInsets.all(0.0),
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "WorldWide",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          2,
                          RaisedButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => India()),
                              );
                            },
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "India",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
