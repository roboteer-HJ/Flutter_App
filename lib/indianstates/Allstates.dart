import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_stats/indianstates/states.dart';

class Allstates extends StatefulWidget {
  @override
  _AllstatesState createState() => _AllstatesState();
}

class _AllstatesState extends State<Allstates> {
  List States = [];
  List filteredstates = [];
  bool issearching = false;

  getCountries() async {
    var response = await Dio().get('https://api.covidindiatracker.com/state_data.json');
    return response.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries().then((data) {
      setState(() {
        States = filteredstates = data;
        //  print(countries);
      });
    });
  }

  void _filterstates(value) {
    setState(() {
      filteredstates = States.where((States) =>
          States['state'].toLowerCase().contains(value.toLowerCase())).toList();
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
          'All States Covid-19 Stats',
          style: TextStyle(fontSize: 19, fontStyle: FontStyle.italic,color: Colors.black),
        )
            : TextField(
          onChanged: (value) {
            _filterstates(value);
          },
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: "Search State here",
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
                filteredstates = States;
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
        child: filteredstates.length > 0
            ? ListView.builder(
            itemCount: filteredstates.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => state(filteredstates[index])));
                },
                child: Card(
                  color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Center(
                      child: Text(
                        filteredstates[index]['state'],
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
