import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class RawChopsHomePage extends StatefulWidget {
  @override
  _RawChopsHomePageState createState() => _RawChopsHomePageState();
}

class _RawChopsHomePageState extends State<RawChopsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Raw Chops"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5.0, right: 6.0),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, top: 5),
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.amber,
                ),
                child: Center(
                  child: Text('1',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                new SizedBox(
                    height: 200.0,
                    child: new Carousel(
                      images: [
                        ExactAssetImage('assets/app_banner1.jpg'),
                        ExactAssetImage('assets/app_banner2.jpg')
                      ],
                      dotBgColor: Colors.transparent,
                      dotSpacing: 20.0,
                      dotSize: 7.0,
                    )),
                SizedBox(height: 20.0),
                GridView.count(
                  primary: false,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 2.1 / 3,
                  shrinkWrap: true,
                  children: <Widget>[
                    _buildCard(
                        'Chicken',
                        'https://firebasestorage.googleapis.com/v0/b/raw-chops.appspot.com/o/product%2F-LSzr3KjJisvEwh6FIFE.jpg?alt=media&token=049f6def-e555-44d2-8508-1a109c22df0a',
                        210,
                        0,
                        true),
                    _buildCard(
                        'Chicken Breast',
                        'https://firebasestorage.googleapis.com/v0/b/raw-chops.appspot.com/o/product%2F-LSzr3KjJisvEwh6FIFE.jpg?alt=media&token=049f6def-e555-44d2-8508-1a109c22df0a',
                        180,
                        1,
                        false),
                    _buildCard(
                        'Chicken Lolipop',
                        'https://firebasestorage.googleapis.com/v0/b/raw-chops.appspot.com/o/product%2F-LSzr3KjJisvEwh6FIFE.jpg?alt=media&token=049f6def-e555-44d2-8508-1a109c22df0a',
                        330,
                        2,
                        false),
                    _buildCard(
                        'Wing',
                        'https://firebasestorage.googleapis.com/v0/b/raw-chops.appspot.com/o/product%2F-LSzr3KjJisvEwh6FIFE.jpg?alt=media&token=049f6def-e555-44d2-8508-1a109c22df0a',
                        330,
                        3,
                        false),
                    _buildCard(
                        'Wing',
                        'https://firebasestorage.googleapis.com/v0/b/raw-chops.appspot.com/o/product%2F-LSzr3KjJisvEwh6FIFE.jpg?alt=media&token=049f6def-e555-44d2-8508-1a109c22df0a',
                        330,
                        3,
                        false)
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.amber),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.shopping_cart, color: Colors.white),
                  SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('₹ 163',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4.0),
                      Text('2 ITEMS', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Spacer(),
                  Text('CONFIRM',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700)),
                  Icon(Icons.keyboard_arrow_right, color: Colors.white)
                ],
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: _buildDrawerWidget(),
      ),
    );
  }

  Widget _buildDrawerWidget() {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 24),
              Text('User Name',
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              SizedBox(height: 8.0),
              Text('58695795',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87)),
              Text('adsf@sfsd.com',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87))
            ],
          ),
        ),
        ListTile(
          title: Text('Home', style: TextStyle(color: Colors.amber)),
          leading: Icon(Icons.home, color: Colors.amber),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SizedBox(
            height: 1,
            child: Container(
              color: Colors.grey[300],
            ),
          ),
        ),
        ListTile(
          title: Text('My Profile'),
          leading: Icon(Icons.person),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SizedBox(
            height: 1,
            child: Container(
              color: Colors.grey[300],
            ),
          ),
        ),
        ListTile(
          title: Text('Orders'),
          leading: Icon(Icons.receipt),
        )
      ],
    );
  }

  Widget _buildCard(
      String name, String image, int price, int index, bool selected) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      margin: index.isOdd
          ? EdgeInsets.only(left: 5.0, right: 16.0, bottom: 10)
          : EdgeInsets.only(left: 16.0, right: 5.0, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
                width: 2.0,
                color: selected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 3.0, right: 3.0, top: 3.0),
              child: Container(
                height: 120.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image))),
              ),
            ),
            SizedBox(height: 6.0),
            Center(child: Text(name, style: TextStyle(fontSize: 16.0))),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text('1 KG', style: TextStyle(fontSize: 12.0)),
            ),
            SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: <Widget>[
                  Text('₹ ${price}',
                      style: TextStyle(color: Theme.of(context).accentColor)),
                  Spacer(),
                  RichText(
                    text: TextSpan(
                        style: new TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: '₹ '),
                          TextSpan(
                              text: '${price}',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough))
                        ]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
              child: SizedBox(
                height: 1,
                child: Container(
                  color: Colors.grey[300],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  !selected
                      ? Center(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 40,
                                child: IconButton(
                                  icon: Icon(Icons.remove, color: Colors.white),
                                  onPressed: () {},
                                ),
                              ),
                              Text('500 gms',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 40,
                                child: IconButton(
                                  icon: Icon(Icons.add, color: Colors.white),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
