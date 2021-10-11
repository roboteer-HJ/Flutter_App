import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_stats/screens/country.dart';

class Allcountries extends StatefulWidget {
  @override
  _AllcountriesState createState() => _AllcountriesState();
}

class _AllcountriesState extends State<Allcountries> {
  Map covid = {};
  List countries = [];
  List filteredcountries = [];
  bool issearching = false;

  getCountries() async {
    var response = await Dio().get('https://api.covid19api.com/summary');
    return response.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries().then((data) {
      setState(() {
        covid = data;
        countries = filteredcountries = covid['Countries'];
        //  print(countries);
      });
    });
    // print(covid);
  }

  void _filtercountries(value) {
    setState(() {
      filteredcountries = countries.where((country) =>
          country['Country'].toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        iconTheme: IconThemeData(color: Colors.black),
        title: !issearching
            ? Text(
                'All Countries Covid-19 Stats',
          style: TextStyle(fontStyle: FontStyle.italic,fontSize: 17,color: Colors.black),
              )
            : TextField(
                onChanged: (value) {
                  _filtercountries(value);
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search Country here",
                    hintStyle: (TextStyle(color: Colors.black))),
              ),
        actions: <Widget>[
          issearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      issearching = false;
                      filteredcountries = countries;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      issearching = true;
                    });
                  },
                )
        ],
      ),
      body: Container(
            padding: EdgeInsets.all(20),
            child: filteredcountries.length > 0
                ? ListView.builder(
                    itemCount: filteredcountries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Country(filteredcountries[index])));
                        },
                        child: Card(
                          color: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(100.0),),
                          elevation: 10,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Center(
                              child: Text(
                                filteredcountries[index]['Country'],
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
      );
  }
}
