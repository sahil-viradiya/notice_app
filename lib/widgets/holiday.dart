import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
import 'package:notice_app/models/event_model.dart';

class Holiday extends StatelessWidget {
  late EventModel eventModel;
  bool today = false;

  Holiday(this.eventModel);

  Holiday.today(this.eventModel, {this.today = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(151, 138, 138, 138).withOpacity(0.2),
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
                    Icon(today?Icons.access_time:Icons.calendar_month),
                    Text(today
                        ? Jiffy(eventModel.added).fromNow()
                        : Jiffy(eventModel.scheduled_at).format("MMMM do yyyy")),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            child: Image.network(eventModel.image),
          )
        ],
      ),
    );
  }
}
