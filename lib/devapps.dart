import 'package:flutter/material.dart';

class DevApps extends StatefulWidget {
  @override
  State<DevApps> createState() => _DevAppsState();
}

class _DevAppsState extends State<DevApps> {
  static const active = Colors.green;
  static const inactive = Colors.cyan;
  var leftColor = inactive;
  var rightColor = inactive;

  activeInactiveColor(int data) {
    if (data == 1) {
      rightColor = inactive;
      if (leftColor == inactive) {
        leftColor = active;
      } else {
        leftColor = inactive;
      }
    }
    if (data == 2) {
      leftColor = inactive;
      if (rightColor == inactive) {
        rightColor = active;
      } else {
        rightColor = inactive;
      }
    }
  }

  double _sliderValue = 240.0;
  int _addRemoveValue = 100;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.purple),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _sliderValue.round().toString(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Slider(
                    value: _sliderValue,
                    onChanged: (double sliderValue) {
                      setState(() {
                        _sliderValue = sliderValue;
                      });
                    },
                    min: 0,
                    max: 400,
                    label: _sliderValue.round().toString(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeInactiveColor(1);
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(color: leftColor),
                          child: Center(
                            child: Text(
                              "First One",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeInactiveColor(2);
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(color: rightColor),
                          child: Center(
                            child: Text("Second One",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    backgroundColor: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.yellowAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    _addRemoveValue.toString(),
                    style: TextStyle(fontSize: 28),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            _addRemoveValue--;
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            _addRemoveValue++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
