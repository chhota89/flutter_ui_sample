import 'package:flutter/material.dart';
class OnlineDatingPage extends StatefulWidget {
  @override
  _OnlineDatingPageState createState() => _OnlineDatingPageState();
}

class _OnlineDatingPageState extends State<OnlineDatingPage> {

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(getColorHexFromStr('#459c9b')),
        elevation: 0.0,
        title: Text("Speed Dating", style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -1 * (MediaQuery.of(context).size.width/2 + 100),
            left: -100,
            child: Container(
              height: MediaQuery.of(context).size.width + 200,
              width: MediaQuery.of(context).size.width + 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width + 200), color: Color(getColorHexFromStr('#459c9b'))
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                          child: Image.network('https://lh3.googleusercontent.com/-ih85KBLeTZQ/TYiZc8CHBpI/AAAAAAAAFPo/akOlq18YVGQ/s1600/emma+watson+images.jpg+%252850%2529.jpg',
                          height: 330,width: double.infinity, fit: BoxFit.cover)),
                      SizedBox(height: 24.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Maggig Hugan", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Quicksand')),
                            Text("Shang gai", style: TextStyle(fontSize: 16, color: Colors.grey),)
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(2.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.flash_on, color: Colors.white, size: 16),
                                    SizedBox(width: 4),
                                    Text('31', style: TextStyle(color: Colors.white)),
                                    SizedBox(width: 2),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                                color: Color(getColorHexFromStr('#459c9b')),
                                borderRadius: BorderRadius.circular(2.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              child: Text('Leo', style: TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 2,
                    shadowColor: Color(getColorHexFromStr('#ff4f8e')),
                    color: Color(getColorHexFromStr('#ff4f8e')),
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                      width: 70,
                        height: 70,
                        child: Icon(Icons.close, color: Colors.white,size: 36)),
                  ),

                  Material(
                    elevation: 2,
                    shadowColor: Color(getColorHexFromStr('#8f00ce')),
                    color: Color(getColorHexFromStr('#8f00ce')),
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                        width: 55,
                        height: 55,
                        child: Icon(Icons.menu, color: Colors.white,size: 30)),
                  ),

                  Material(
                    elevation: 2,
                    shadowColor: Color(getColorHexFromStr('#00c8b6')),
                    color: Color(getColorHexFromStr('#00c8b6')),
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                        width: 70,
                        height: 70,
                        child: Icon(Icons.favorite, color: Colors.white,size: 36)),
                  )
                ],
              )

            ],
          ),
        ],
      ),
    );
  }
}
