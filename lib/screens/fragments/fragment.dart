import 'package:cloud_firestore/cloud_firestore.dart';
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

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<EventModel> events = [];
  bool loading = true;

  @override
  State<Fragment> createState() => _FragmentState();
}

class _FragmentState extends State<Fragment> {
  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      load_events(widget.firestore);
      return CircularProgressIndicator();
    }

    return ListView.builder(
        itemCount: widget.events.length,
        itemBuilder: ((context, index) {
          if (widget.events[index].holiday && widget.mode == HOLIDAY) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Holiday(widget.events[index]),
            );
          } else if (widget.events[index].holiday && widget.mode == EVENTS) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Event(widget.events[index]),
            );
          } else {
            return Container();
          }
        }));
  }

  load_events(firestore) {
    firestore
        .collection('events')
        .where("scheduled_at", isGreaterThanOrEqualTo: DateTime.now())
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        widget.events.add(EventModel(
          doc["scheduled_at"].toDate(),
          doc["added"].toDate(),
          doc["msg"],
          doc["holiday"],
          doc["image"],
        ));
      }

      setState(() {
        widget.loading = false;
      });
    });
  }
}
