import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xff023e8a),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight:FontWeight.bold,
              color: Colors.white,
            ),
          
          ),
        ),
      ),
    );
  }
}
