import 'package:flutter/material.dart';
import 'detailsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
						child: Row(
							children: <Widget>[
								Text('Cervejas',
									style: TextStyle(
										fontFamily: 'Montserrat',
										color: Colors.white,
										fontWeight: FontWeight.bold,
										fontSize: 25.0
									),
								),
							],
						),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(
                          children: [
                            _buildIten(
                                'assets/heiniken.jpg', 'Heiniken', '\$7.50'),
                            _buildIten(
                                'assets/corona.webp', 'Corona', '\$10.00'),
                            _buildIten('assets/sol.webp', 'Sol', '\$7.50'),
                            _buildIten(
                                'assets/eisenbahn.webp', 'Eisenbahn', '\$7.50'),
                            _buildIten('assets/duvel.webp', 'Duvel', '\$28.50'),
                            _buildIten(
                                'assets/delirium.webp', 'Delirium', '\$18.50'),
                          ],
                        )))
              ],
            ),
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       new Container(
      //         color: Colors.blueAccent,
      //         height: 800,
      //         width: MediaQuery.of(context).size.width,
      //         child: Center(
      //           child: new Text("Potato")
      //           ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildIten(String path, String name, String price) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {
					Navigator.of(context).push(MaterialPageRoute(
						builder: (context) => DetailsPage(heroTag: path, name: name, price: price)
					));
				},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Hero(
                    tag: path,
                    child: Image(
                      image: AssetImage(path),
                      fit: BoxFit.cover,
                      height: 75.0,
                      width: 75.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold)),
                      Text(
                        price,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.add), color: Colors.black, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
