import 'package:covid_19_stats/screens/Allcountries.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_stats/Animations/Fadeanimation.dart';
import 'package:covid_19_stats/MyHeader.dart';
import 'package:covid_19_stats/constants.dart';
import 'package:covid_19_stats/widgets/counter.dart';
import 'package:dio/dio.dart';
import 'package:covid_19_stats/misc/helper.dart';
class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  final controller = ScrollController();
  double offset = 0;
  Map Globalcountries = {};
  Map Globaldetails = {};
  getCountries() async {
    var response =
    await Dio().get('https://api.covid19api.com/summary');
    return response.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(onScroll);
    getCountries().then((data) {
      setState(() {
        Globalcountries = data;
        Globaldetails = Globalcountries['Global'];
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
    return Globaldetails['TotalConfirmed']!= null ?
    Scaffold(
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
                                text: "Latest Update - 1 hour ago",
                                style: TextStyle(
                                    color: kTextLightColor,
                                    fontStyle: FontStyle.italic
                                ),
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
                                  builder: (context) => Allcountries()),
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 150,
                          child: Card(
                            child: Counter(
                              color: Colors.black,
                              number: Helper.formatNumber(Globaldetails['TotalConfirmed']),
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
                              number: Helper.formatNumber((Globaldetails['TotalConfirmed'] - Globaldetails['TotalRecovered'])),
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 150,
                          child: Card(
                            child: Counter(
                              color: Colors.black,
                              number: Helper.formatNumber(Globaldetails['TotalDeaths']),
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
                              number: Helper.formatNumber(Globaldetails['TotalRecovered']),
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
    ) :
    Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CircularProgressIndicator(),
        ),
    );
  }
}
