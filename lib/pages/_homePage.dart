import 'package:flutter/material.dart';

import '_secondPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "Make an Appointment";
  String title = "Govt Hospital";
  //define the selectedDate as current date
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: makeAppointment(),
    );
  }

//This Widget return the Appointment Tile
  Widget makeAppointment() {
    return Center(
      child: InkWell(
        onTap: () {
          _selectDate(context);
        },
        child: Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Colors.blue, Color.fromARGB(255, 75, 65, 206)])),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w300, letterSpacing: 0.3),
          )),
        ),
      ),
    );
  }

//Get the Date from showDatePicker (shown the calender)
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        //if date was selected it push the new screen and pass the date
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondPage(
                      selected: selected,
                      text: text,
                    )));
      });
    }
  }
}
