import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_3d_drawer/flutter_3d_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xffF6EAEA),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    color: Color.fromARGB(255, 177, 177, 177).withOpacity(0.2),
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
            "Good Morning",
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
                  " “You only live once, but if you do it right, once is enough”",
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "- Jay Chudasama",
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
                          "29th",
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
                          "Oct",
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
                          "Sun",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),

                //Event

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        opacity: 0.3,
                        image: AssetImage(
                          "assets/images/e1.png",
                        ),
                        fit: BoxFit.cover,
                      ),
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "EVENT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue),
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time),
                              Text("2 Days pela"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the pLorem Ipsum is simply dummy text of the printing and typesetting industry.rinting and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Image.asset(
                            "assets/images/e2.png",
                            width: 60,
                            fit: BoxFit.contain,
                          )
                        ],
                      )
                    ],
                  ),
                ),

                //Holiday
                SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "HOLIDAY",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 10, 193, 86)),
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_time),
                                Text("2 Days pela"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        child: Image.network(
                          "https://images.ganeshaspeaks.com/Content-OtherImages/Diwali-21-750.jpg",
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )

        //Quotes
      ]),
    );
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
                  image: AssetImage("assets/images/sahil.JPG"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              "Sahil Viradiya",
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
              "Sahil Viradiya",
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
              "Sahil Viradiya",
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
              "Sahil Viradiya",
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
              "Sahil Viradiya",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ]),
      ),
    );
  }
}
