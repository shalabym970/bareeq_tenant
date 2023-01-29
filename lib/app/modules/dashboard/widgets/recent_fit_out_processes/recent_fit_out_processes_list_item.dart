import 'package:flutter/material.dart';

class RecentFitOutProcessesListItem extends StatelessWidget {
  const RecentFitOutProcessesListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
          child: Container(
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
        height: 116,
        child: Card(
          color: const Color(0xffF5F7FF),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Text('Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color(0xff00345B))),
                        SizedBox(
                          height: 5,
                        ),
                        Text('WP--21--018',
                            style: TextStyle(fontSize: 12, color: Colors.black))
                      ],
                    ),
                    Column(
                      children: const [
                        Text('Complete Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color(0xff00345B))),
                        SizedBox(
                          height: 5,
                        ),
                        Text('20/2/2000',
                            style: TextStyle(fontSize: 12, color: Colors.black))
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Opening Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Color(0xff00345B)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('04/3/2033',
                            style: TextStyle(fontSize: 12, color: Colors.black))
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          'Status',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Color(0xff00345B)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('not yet started',
                            style: TextStyle(fontSize: 12, color: Colors.black))
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Start Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Color(0xff00345B))),
                    SizedBox(
                      height: 5,
                    ),
                    Text('12/10/2022',
                        style: TextStyle(fontSize: 12, color: Colors.black))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
