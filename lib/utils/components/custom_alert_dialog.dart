import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';

class CustomAlertDialog extends StatelessWidget {
  final VoidCallback? onPressed;
  final String content;
  final String? title;
  CustomAlertDialog(
      {required this.onPressed, required this.content, this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? 'S.current.warning'),
      content: Container(child: Text(content)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        TextButton(onPressed: onPressed, child: Text(S.current.confirm)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
      ],
    );
  }
}

class CustomDialogBox extends StatefulWidget {
  final String title;
  final VoidCallback  onConfirmTap;
  final VoidCallback  onCancelTap;

  const CustomDialogBox({required this.title, required this.onCancelTap ,required this.onConfirmTap});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 12, right: 12, top: 40),
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                TextButton(onPressed: (){
                  widget.onCancelTap();
                }, child: Text(S.of(context).cancel,style: TextStyle(color: Colors.red),)),
                  TextButton(onPressed: (){
                  widget.onConfirmTap();
                }, child: Text(S.of(context).confirm,style: TextStyle(color: Colors.green)))
              ],)

            ],
          ),
        ),
        Positioned(
          left: 5,
          right: 5,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.asset(ImageAsset.STOP)),
          ),
        ),
      ],
    );
  }
}
