import 'package:covid_19_stats/Animations/Fadeanimation.dart';
import 'package:covid_19_stats/constants.dart';
import 'package:covid_19_stats/MyHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Get to know",
              textBottom: "About Covid-19.",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FadeAnimation(1.8,
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Symptoms",
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SymptomCard(
                            image: "assets/images/headache.png",
                            title: "Headache",
                            isActive: true,
                          ),

                          SymptomCard(
                            image: "assets/images/caugh.png",
                            title: "Caugh",

                          ),
                          SymptomCard(
                            image: "assets/images/fever.png",
                            title: "Fever",

                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Preventions", style: kTitleTextstyle),
                    SizedBox(height: 10),
                    PreventCard(
                      text:
                      "Face masks are one tool utilized for preventing the spread of disease.",
                      image: "assets/images/wear_mask-2.png",
                      title: "Wear face mask",
                    ),
                    PreventCard(
                      text:
                      "Washing your hands properly takes about as long as singing \"Happy Birthday\" twice.",
                      image: "assets/images/wash_hands-2.png",
                      title: "Wash your hands",
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 160,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 155,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kActiveShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
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

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
              : BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 12,
            color: kActiveShadowColor,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
