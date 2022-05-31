import 'package:carousel_slider/carousel_slider.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:drawer_swipe/drawer_swipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdash/models/car.dart';
import 'package:mdash/pages/detail_page.dart';
import 'package:mdash/widgets/sidenav_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var drawerKey = GlobalKey<SwipeDrawerState>();

  List<Car> cars = [
    Car(image: 'car_1.jpeg', model: 'Tesla', plateNumber: 'NR2001', color: 'White', price: 'Rs 500/day', owner: 'Electrica Ltd')
  ];
  int tag = 0;
  List<String> options = [
    'Ford',
    'Tesla',
    'Honda',
    'Mustang',
    'Nissan',
    'Porche',
    'Ferrari'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfffeefdc),
        body: SwipeDrawer(
          radius: 20,
          key: drawerKey,
          hasClone: true,
          bodyBackgroundPeekSize: 30,
          backgroundColor: Colors.black87,
          // pass drawer widget
          drawer: buildDrawer(),
          // pass body widget
          child: buildBody(),
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SideNavText(title: 'Home', path: HomePage()),
        SideNavText(title: 'Trade', path: HomePage()),
        SideNavText(title: 'Profile', path: HomePage()),
        SideNavText(title: 'Setting', path: HomePage()),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              title: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: const Text('Log Out',
                      style: TextStyle(color: Colors.white70, fontSize: 20)),
                ),
              ),
            ))
      ],
    );
  }

  Widget buildBody() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Electrica",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 35,
                  ),
                  onPressed: () {
                    if (drawerKey.currentState!.isOpened()) {
                      drawerKey.currentState!.closeDrawer();
                    } else {
                      drawerKey.currentState!.openDrawer();
                    }
                  },
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(left: 33, right: 250,top: 10 ),
          child: Container(
            color: Colors.black87,
            height: 4,
            width: 20,
          ),
        ),
        SizedBox(
            height: 300.0,
            child: CarouselSlider(
              items: [
                'images/car_1.jpeg',
                'images/car_1.jpeg',
                'images/car_1.jpeg',
                'images/car_1.jpeg',
              ].map((i) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(i, fit: BoxFit.cover)));
                });
              }).toList(),
              options: CarouselOptions(),
            )),
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 5),
          child: Text("Category",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        ChipsChoice<int>.single(
          value: tag,
          onChanged: (val) => setState(() => tag = val),
          choiceActiveStyle: const C2ChoiceStyle(
            showCheckmark: false
          ),
          choiceItems: C2Choice.listFrom<int, String>(
            source: options,
            value: (i, v) => i,
            label: (i, v) => v,
          ),
        ),
        GestureDetector(
          child: Image.asset('images/car_1.jpeg'),
          onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage(car: cars[0])))
        ),
      ],
    );
  }
}
