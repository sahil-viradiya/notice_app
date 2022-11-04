// ignore_for_file: prefer_const_constructors

import 'package:analog_clock/analog_clock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';
import 'package:jiffy/jiffy.dart';
import 'package:notice_app/models/event_model.dart';
import 'package:notice_app/screens/fragments/fragment.dart';
import 'package:notice_app/widgets/event.dart';
import 'package:notice_app/widgets/holiday.dart';

const int HOME_PAGE = 1;
const int EVENTS = 2;
const int HOLIDAY = 3;

class HomeScreen extends StatefulWidget {
  String quote = "";
  String author = "";
  EventModel? eventModel;
  bool loading = true;
  var dt = DateTime.now();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current_page = 1;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (widget.quote.isEmpty) {
      load_quote(firestore);
    }

    return Scaffold(
        drawer: _drawer(),
        appBar: AppBar(
          title: Text(current_page == HOLIDAY
              ? "Holidays"
              : current_page == EVENTS
                  ? "Events"
                  : ""),
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color(0xffF6EAEA),
        body: _fragments());
  }

  Widget _fragments() {
    switch (current_page) {
      case HOME_PAGE:
        return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: AnalogClock(
              decoration: BoxDecoration(
                  color: const Color(0xffE3EDF7),
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 255, 236, 236),
                    Color.fromARGB(255, 255, 238, 238)
                  ], begin: Alignment.topCenter, end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 177, 177, 177).withOpacity(0.2),
                      blurRadius: 32,
                      spreadRadius: 1,
                      offset: const Offset(30, 20),
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      blurRadius: 32,
                      spreadRadius: 1,
                      offset: Offset(-20, -10),
                    ),
                  ]),
              width: 150.0,
              height: 150.0,
              isLive: true,
              hourHandColor: Colors.black,
              minuteHandColor: Colors.black,
              showSecondHand: true,
              numberColor: Colors.black87,
              showNumbers: true,
              showAllNumbers: true,
              textScaleFactor: 1.8,
              showTicks: true,
              showDigitalClock: false,
            ),
          ),

          //Gretings
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              greeting(widget.dt),
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text("Jay Bharat"),
          ),

          //Divider
          Divider(
            height: 1,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    " “" + widget.quote + "”",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "- " + widget.author,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  //Date Decoation
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(151, 138, 138, 138)
                                      .withOpacity(0.2),
                                  blurRadius: 32,
                                  spreadRadius: 1,
                                  offset: const Offset(30, 20),
                                ),
                                const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 32,
                                  spreadRadius: 1,
                                  offset: Offset(-20, -10),
                                ),
                              ]),
                          child: Text(
                            Jiffy(widget.dt).format("do"),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(151, 138, 138, 138)
                                      .withOpacity(0.2),
                                  blurRadius: 32,
                                  spreadRadius: 1,
                                  offset: const Offset(30, 20),
                                ),
                                const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 32,
                                  spreadRadius: 1,
                                  offset: Offset(-20, -10),
                                ),
                              ]),
                          child: Text(
                            Jiffy(widget.dt).format("MMM"),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(151, 138, 138, 138)
                                      .withOpacity(0.2),
                                  blurRadius: 32,
                                  spreadRadius: 1,
                                  offset: const Offset(30, 20),
                                ),
                                const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 32,
                                  spreadRadius: 1,
                                  offset: Offset(-20, -10),
                                ),
                              ]),
                          child: Text(
                            Jiffy(widget.dt).format("EEE"),
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Event
                  widget.loading
                      ? CircularProgressIndicator()
                      : widget.eventModel == null
                          ? Text("No Events")
                          : !widget.eventModel!.holiday
                              ? Event(widget.eventModel!)
                              : Holiday(widget.eventModel!)
                ],
              ),
            ),
          )

          //Quotes
        ]);

      case EVENTS:
        return Fragment(EVENTS);
      case HOLIDAY:
        return Fragment(HOLIDAY);
      default:
        return Text("Something went wrong");
    }
  }

  String greeting(DateTime dt) {
    int hour = dt.hour;

    print(hour);

    if (hour >= 6 && hour < 12) {
      return "Good Morning ☕";
    } else if (hour >= 12 && hour < 18) {
      return "Good Afternoon 🌞";
    } else if (hour >= 18 && hour < 21) {
      return "Good Evening 🌅";
    } else {
      return "Good Night 🌙";
    }
  }

  load_quote(firestore) {
    firestore
        .collection('quotes')
        .doc('quotes')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print(documentSnapshot.get('quote'));
        setState(() {
          widget.quote = documentSnapshot.get('quote');
          widget.author = documentSnapshot.get('author');
        });
        load_events(firestore);
      }
    });
  }

  load_events(firestore) {
    var today = DateTime.now();
    firestore
        .collection('events')
        .where("scheduled_at", isGreaterThanOrEqualTo: DateTime.now())
        .get()
        .then((QuerySnapshot querySnapshot) {
      try {
        var doc = querySnapshot.docs.first;
        print(doc['msg']);
        widget.eventModel = EventModel(
          doc["scheduled_at"].toDate(),
          doc["added"].toDate(),
          doc["msg"],
          doc["holiday"],
          doc["image"],
        );
        setState(() {
          widget.loading = false;
        });
      } catch (e) {
        print(e);
        setState(() {
          widget.loading = false;
        });
      }
    });
  }

  Widget _drawer() {
    return Drawer(
      backgroundColor: Color(0xffE08181),
      child: SingleChildScrollView(
        child: Column(children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 50,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                current_page = HOME_PAGE;
              });
            },
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                current_page = EVENTS;
              });
            },
            leading: Icon(
              Icons.celebration_rounded,
              color: Colors.black,
            ),
            title: Text(
              "Events",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                current_page = HOLIDAY;
              });
            },
            leading: Icon(
              Icons.airline_seat_flat,
              color: Colors.black,
            ),
            title: Text(
              "Holidays",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Divider(),
          Text("Developers"),
          SizedBox(
            height: 16,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Color.fromARGB(159, 62, 62, 62))
                ],
                image: DecorationImage(
                  image: AssetImage("assets/images/divyeshsir.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              "Prof. Divyesh Makavana",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Color.fromARGB(159, 62, 62, 62))
                ],
                image: DecorationImage(
                  image: AssetImage("assets/images/jaysir.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              "Prof. Jay Chudasama",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Color.fromARGB(159, 62, 62, 62))
                ],
                image: DecorationImage(
                  image: AssetImage("assets/images/sahil.JPG"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              "RWn. Sahil Viradiya",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Color.fromARGB(159, 62, 62, 62))
                ],
                image: DecorationImage(
                  image: AssetImage("assets/images/ronak.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              "RWn. Ronak Pithava",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Color.fromARGB(159, 62, 62, 62))
                ],
                image: DecorationImage(
                  image: AssetImage("assets/images/romil.JPG"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
             "RWn. Romil Narola",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ]),
      ),
    );
  }
}
