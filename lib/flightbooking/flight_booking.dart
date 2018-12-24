import 'package:flutter/material.dart';
import 'package:flutterui_hiretalent/flightbooking/custom_shape_path_clipper.dart';

class FlightBookingHome extends StatefulWidget {
  @override
  _FlightBookingHomeState createState() => _FlightBookingHomeState();
}

var firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

var locations = ["Mumbai", "Pune", "Surat"];

class _FlightBookingHomeState extends State<FlightBookingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        TopContainer(),
      ],
    ));
  }
}

class TopContainer extends StatefulWidget {
  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  var selectedLocationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapePathClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 16),
                      PopupMenuButton(
                        itemBuilder: (context) => <PopupMenuItem<int>>[
                              PopupMenuItem(
                                value: 0,
                                child: Text(locations[0],
                                    style: dropDownMenuItemStyle),
                              ),
                              PopupMenuItem(
                                value: 1,
                                child: Text(locations[1],
                                    style: dropDownMenuItemStyle),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text(locations[2],
                                    style: dropDownMenuItemStyle),
                              )
                            ],
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectedLocationIndex],
                              style: dropDownLabelStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
