import 'package:flutter/material.dart';

class CustomDeliverySearch extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  @override
  _CustomDeliverySearchState createState() => _CustomDeliverySearchState();

  CustomDeliverySearch(
      {this.height = 50,
      this.contentPadding = const EdgeInsets.fromLTRB(0, 13.5, 0, 0),
      required this.hintText,
      this.onChanged,
      this.controller});
}

class _CustomDeliverySearchState extends State<CustomDeliverySearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12,end: 12,top: 12),
      child: Container(
        height: widget.height,
        decoration: new BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
//              spreadRadius: 8,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            prefixIcon: Icon(Icons.search),
//            suffixIcon: Icon(Icons.filter_list),
            enabledBorder: InputBorder.none,
            contentPadding: widget.contentPadding,
            focusedBorder: InputBorder.none,
          ),
//        onSubmitted: widget.onChanged,
        ),
      ),
    );
  }
}
