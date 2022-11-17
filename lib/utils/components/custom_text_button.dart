import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  const CustomTextButton(
      {Key? key, required this.onPressed, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.maxFinite,
      child: TextButton(
          style: TextButton.styleFrom(shape: StadiumBorder(),primary: Colors.grey.shade100,onSurface:Colors.grey.shade100 ),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(color: Colors.black,fontSize: 16),
          )),
    );
  }
}
