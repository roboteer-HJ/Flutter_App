import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:covid_19_stats/misc/helper.dart';

class Country extends StatelessWidget {
  final Map country;

  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          country['Country'],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              front: CountryCard('Total Confirmed',Colors.redAccent),
              back: CountryFlipCard(Helper.formatNumber(country['TotalConfirmed']),Colors.red),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard('Today\'s Confirmed',Colors.redAccent),
              back: CountryFlipCard(Helper.formatNumber(country['NewConfirmed']),Colors.red),
            ),

            FlipCard(
              front: CountryCard('Total Deaths',Colors.yellowAccent),
              back: CountryFlipCard(Helper.formatNumber(country['TotalDeaths']),Colors.blueGrey),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard('Today\'s Deaths',Colors.yellowAccent),
              back: CountryFlipCard(Helper.formatNumber(country['NewDeaths']),Colors.blueGrey),
            ),
            FlipCard(
              front: CountryCard('Total Recovered ',Colors.greenAccent),
              back: CountryFlipCard(Helper.formatNumber(country['TotalRecovered']),Colors.green),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard('Today\'s Recovered',Colors.greenAccent),
              back: CountryFlipCard(Helper.formatNumber(country['NewRecovered']),Colors.green),
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
              fontSize: 17,
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
