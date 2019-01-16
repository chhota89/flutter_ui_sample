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
  bool isFlightSelected = true;
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
                ),
                SizedBox(height: 24.0),
                Text("Where whould\nYou want to go?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: 'Quicksand')),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: TextField(
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontFamily: 'Quicksand'),
                      controller: TextEditingController(text: locations[0]),
                      cursorColor: secondColor,
                      decoration: InputDecoration(
                          suffixIcon: Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(30.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                onPressed: () {}),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 15.0)),
                    ),
                  ),
                ),
                SizedBox(height: 26),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFlightSelected = true;
                        });
                      },
                      child: ChoiceChip(
                          iconData: Icons.flight_takeoff,
                          text: "Flight",
                          isSelected: isFlightSelected),
                    ),
                    SizedBox(width: 20.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isFlightSelected = false;
                        });
                      },
                      child: ChoiceChip(
                          iconData: Icons.hotel,
                          text: "Hotel",
                          isSelected: !isFlightSelected),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData iconData;
  final String text;
  final isSelected;

  const ChoiceChip({this.iconData, this.text, this.isSelected});

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20.0))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            widget.iconData,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(width: 8.0),
          Text(
            widget.text,
            style: TextStyle(
                fontSize: 16.0, color: Colors.white, fontFamily: 'Quicksand'),
          )
        ],
      ),
    );
  }
}
