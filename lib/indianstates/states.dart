import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:covid_19_stats/misc/helper.dart';

class state extends StatelessWidget {
  final Map StateDetail;

  state(this.StateDetail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          StateDetail['state'],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              front: CountryCard('Confirmed Cases',Colors.redAccent),
              back: CountryFlipCard(Helper.formatNumber(StateDetail['confirmed']),Colors.red),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard('Active Cases',Colors.amberAccent),
              back: CountryFlipCard(Helper.formatNumber(StateDetail['active']),Colors.teal),
            ),

            FlipCard(
              front: CountryCard('Recovered Cases',Colors.greenAccent),
              back: CountryFlipCard(Helper.formatNumber(StateDetail['recovered']),Colors.lightGreen),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard('Deaths',Colors.tealAccent),
              back: CountryFlipCard(Helper.formatNumber(StateDetail['deaths']),Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  MaterialAccentColor color;
  CountryCard(this.title,this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontStyle: FontStyle.italic),
            ),
          )),
    );
  }
}

class CountryFlipCard extends StatelessWidget {
  final String title;
  MaterialColor color;

  CountryFlipCard(this.title,this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
