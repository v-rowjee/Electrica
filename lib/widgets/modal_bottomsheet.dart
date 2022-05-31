import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  ModalBottomSheet({Key? key}) : super(key: key);

  final TextEditingController dateFromController = TextEditingController();
  final TextEditingController dateToController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Loan Car',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: dateFromController,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Date From", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,30,30),
              child: TextField(
                controller: dateToController,
                textInputAction: TextInputAction.go,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Date To", border: OutlineInputBorder()),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: const Text('Close BottomSheet'),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
