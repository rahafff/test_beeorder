import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';

class CustomText extends StatelessWidget {
  final String imageName;
  final String title;
  final String? copyTitle;
  final VoidCallback? showDetails;
  const CustomText({required this.imageName, required this.title, this.showDetails , this.copyTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(imageName.compareTo(ImageAsset.CART) == 0){
          showDetails!();
        }
      else {
          Clipboard.setData(ClipboardData(text:copyTitle != null ? copyTitle : title)).then((_){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).copied),backgroundColor: Colors.black,));
          });
        }

      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) ,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.red.shade900,
            Colors.black,
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(imageName,height: 25 ,width: 25,),
              SizedBox(width: 10,),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
