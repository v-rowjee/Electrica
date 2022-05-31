import 'package:flutter/material.dart';

class SideNavText extends StatelessWidget {
  String title;
  Widget path;
  SideNavText({Key? key, required this.title, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        title: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            child: Text(title,
                style: const TextStyle(color: Colors.white70, fontSize: 20)),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => path)),
              ),
        ),
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => path)),
      ),
    );
  }
}
