import "package:flutter/material.dart";
//Initialize intl package for accessing WeakDays
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key, required this.selected, required this.text})
      : super(key: key);
  DateTime selected;
  String text;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //Time Shedule List
  List sheduleList = [
    "10.00 AM to 10.30 AM",
    "10.30 AM to 11.00 AM",
    "11.00 AM to 11.30 AM",
    "11.30 AM to 12.00 AM",
    "12.00 AM to 12.30 AM",
    "12.30 AM to 1.00 AM",
    "1.00 AM to 1.30 AM",
    "1.30 AM to 2.00 AM",
    "2.00 AM to 2.30 AM",
    "2.30 AM to 3.00 AM",
    "5.00 AM to 5.30 AM",
    "5.30 AM to 6.00 AM",
    "6.00 AM to 6.30 AM",
    "6.30 AM to 7.00 AM",
    "7.00 AM to 7.30 AM",
  ];
  @override
  Widget build(BuildContext context) {
    // Get The Day What selected in calender using intl package
    var appointmentDay = DateFormat('EEEE').format(widget.selected);
    // Get The Date What selected in calender
    String appointmentDate =
        "${widget.selected.day}-${widget.selected.month}-${widget.selected.year}";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: dayandDate("Selected Day : ", appointmentDay)),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: dayandDate("Selected Date : ", appointmentDate)),
          SizedBox(
            height: 10,
          ),
          sheduleTitle(),
          SizedBox(
            height: 10,
          ),
          sheduletimeList()
        ],
      ),
    );
  }

//This Widget used for shown Selected Day and Date
  Widget dayandDate(String hint, String daydate) {
    return Row(
      children: [
        Text(
          hint,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          daydate,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }

//This Widget used for shown Title for shedule
  Widget sheduleTitle() {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: Center(
            child: Text(
          "Select a Shedule Time",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )));
  }

//This Widget get the List of time shedule in List data to shown in the card
  Widget sheduletimeList() {
    return Expanded(
      child: ListView.builder(
          itemCount: sheduleList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                  leading: Icon(
                    Icons.timer,
                  ),
                  title: Text(sheduleList[index])),
            );
            // (sheduleList[index]);
          }),
    );
  }
}
