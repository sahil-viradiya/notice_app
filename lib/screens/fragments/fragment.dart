import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notice_app/models/event_model.dart';
import 'package:notice_app/widgets/holiday.dart';

import '../../widgets/event.dart';
import '../home_screen.dart';

class Fragment extends StatefulWidget {
  int mode;

  Fragment(this.mode);

  // FirebaseFirestore firestore = .instance;
  List<EventModel> events = [];
  bool loading = true;

  @override
  State<Fragment> createState() => _FragmentState();
}

class _FragmentState extends State<Fragment> {
  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      load_events();
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
        itemCount: widget.events.length,
        itemBuilder: ((context, index) {
          print(widget.events[index].holiday && widget.mode == HOLIDAY);
          if (widget.events[index].holiday && widget.mode == HOLIDAY) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Holiday(widget.events[index]),
            );
          } else if (!widget.events[index].holiday && widget.mode == EVENTS) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Event(widget.events[index]),
            );
          } else {
            return Container();
          }
        }));
  }

  load_events() async {
    print("dsvsd");
    var dio = Dio();
    try {
      var response = await dio
          .get('http://sahilviradiya.pythonanywhere.com/api/load_events/');
      // print(response.data);
      if (response.statusCode == 200) {
        for (var event in response.data) {
          widget.events.add(EventModel(
            DateTime.parse(event["scheduled_at"]),
            DateTime.parse(event["added"]),
            event["msg"],
            event["holiday"],
            event["image"],
          ));
        }

        setState(() {
          widget.loading = false;
        });
      }
    } catch (e) {
      print(e.toString());
      setState(() {
        widget.loading = false;
      });
    }
  }
}
