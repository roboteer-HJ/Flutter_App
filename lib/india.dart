import 'package:flutter/material.dart';
import 'package:covid_19_stats/Animations/Fadeanimation.dart';
import 'package:covid_19_stats/MyHeader.dart';
import 'package:covid_19_stats/constants.dart';
import 'package:covid_19_stats/widgets/counter.dart';
import 'package:covid_19_stats/indianstates/Allstates.dart';
import 'package:dio/dio.dart';
import 'package:covid_19_stats/misc/helper.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  final controller = ScrollController();
  double offset = 0;
  Map indiadetails = {};

  getCountries() async {
    var response =
        await Dio().get('https://api.covidindiatracker.com/total.json');
    return response.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(onScroll);
    getCountries().then((data) {
      setState(() {
        indiadetails = data;
        print(indiadetails);
      });
    });
    super.initState();
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
    return indiadetails['active'] != null
        ? Scaffold(
            body: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: <Widget>[
                  MyHeader(
                    image: "assets/icons/Drcorona.svg",
                    textTop: "Maintain distance ",
                    textBottom: "Be Safe",
                    offset: offset,
                  ),
                  FadeAnimation(
                    1.6,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Case Updates\n",
                                      style: kTitleTextstyle,
                                    ),
                                    TextSpan(
                                      text: "Latest Update - 10 min ago",
                                      style: TextStyle(
                                          color: kTextLightColor,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Allstates()),
                                  );
                                },
                                child: Text(
                                  "See details",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  FadeAnimation(
                    2,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 150,
                                child: Card(
                                  child: Counter(
                                    color: Colors.black,
                                    number: Helper.formatNumber(
                                        indiadetails['confirmed']),
                                    title: "Infected",
                                  ),
                                  color: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 150,
                                child: Card(
                                  child: Counter(
                                    color: Colors.black,
                                    number: Helper.formatNumber(
                                        indiadetails['active']),
                                    title: "Active",
                                  ),
                                  color: Colors.amberAccent[700],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    2,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 150,
                                child: Card(
                                  child: Counter(
                                    color: Colors.black,
                                    number: Helper.formatNumber(
                                        indiadetails['deaths']),
                                    title: "Deaths",
                                  ),
                                  color: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 150,
                                child: Card(
                                  child: Counter(
                                    color: Colors.black,
                                    number: Helper.formatNumber(
                                        indiadetails['recovered']),
                                    title: "Recovered",
                                  ),
                                  color: Colors.greenAccent[700],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
