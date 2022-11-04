import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../models/event_model.dart';

class Event extends StatelessWidget {
   late EventModel eventModel;

  Event(this.eventModel);


  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text(Jiffy(eventModel.added).fromNow()),
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
                  eventModel.msg,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}
