import 'package:flutter/material.dart';
import 'package:mdash/models/car.dart';
import 'package:mdash/widgets/modal_bottomsheet.dart';

class DetailPage extends StatelessWidget {
  final Car car;
  DetailPage({Key? key,required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 18, top: 20),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_rounded)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Tesla",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33, right: 100, top: 10),
              child: Container(
                color: Colors.black87,
                height: 5,
                width: 60,
              ),
            ),
            Image.asset('images/car_1.jpeg'),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Today, Tesla builds not only all-electric vehicles but also '
                'infinitely scalable clean energy generation and storage '
                'products. Tesla believes the faster the world stops relying'
                ' on fossil fuels and moves towards a zero-emission future, '
                'the better.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30,bottom: 10),
              child: Text("Plate Number: NR2001",style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text("Price: 450 per day",style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (context) => ModalBottomSheet()
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(18),
                    child: Text(
                      'LOAN',
                      style: TextStyle(fontSize: 18, letterSpacing: 5),
                    ),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )))),
            )
          ],
        ),
      ),
    );
  }
}
