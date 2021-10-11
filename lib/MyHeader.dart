import 'package:covid_19_stats/constants.dart';
import 'package:covid_19_stats/homepage.dart';
import 'package:covid_19_stats/Animations/Fadeanimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;

  const MyHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: FadeAnimation(1,
         Container(
          padding: EdgeInsets.only(left: 10, top: 5, right: 0),
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ],
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/virus.png"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 80,
                      child: FadeAnimation(
                        1.5,
                        Container(
                          child: SvgPicture.asset(
                            widget.image,
                            width: 200,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 135,
                      child: FadeAnimation(
                        1.5,
                        Container(
                          child: Text(
                            "${widget.textTop} \n${widget.textBottom}",
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      width: 30,
                      top: 30,
                      child: FadeAnimation(
                          1.5,
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return HomePage();
                                        },
                                      ),
                                    );
                                  },
                                  child:
                                      SvgPicture.asset("assets/icons/menu.svg"),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
