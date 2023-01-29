import 'package:flutter/material.dart';

class CustomDetailsPageCard extends StatelessWidget {
  const CustomDetailsPageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: 157,
      child: Card(
        color: const Color(0xffF5F7FF),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('subject',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color(0xff00345B))),
              const SizedBox(
                height: 5,
              ),
              Text('Carpentry',
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.7))),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Overall tweaks and finalizations within the entire carpentry area.Overall tweaks and finalizations within the entire carpentry area',
                style: TextStyle(
                    height: 2,
                    fontSize: 12, color: Colors.black),maxLines: 4,overflow: TextOverflow.visible,),
            ],
          ),
        ),
      ),
    );
  }
}
