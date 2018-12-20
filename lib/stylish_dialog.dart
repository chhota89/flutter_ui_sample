import 'package:flutter/material.dart';

class StylishDialogPage extends StatefulWidget {
  @override
  _StylishDialogPageState createState() => _StylishDialogPageState();
}

class _StylishDialogPageState extends State<StylishDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stylish Dialog"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            infoDialog(context);
          },
          child: Text("Show Dialog"),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Future<bool> infoDialog(context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: 200,
              height: 350,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 150,
                      ),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0))),
                      ),
                      Positioned(
                        top: 50,
                        left: 94,
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://static1.squarespace.com/static/599335a97131a5842d5402d1/t/5a8c81b4419202aaf2043811/1519157690515/Jimmy+Davenport+Color+Square.jpg?format=300w'),
                              ),
                              borderRadius: BorderRadius.circular(45.0),
                              border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 2)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Nice Place and good Services",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OKEY",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Theme.of(context).primaryColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
