import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';

class CustomText extends StatelessWidget {
  final String imageName;
  final String title;
  final String fieldName;
  final String? copyTitle;
  final VoidCallback? showDetails;
  const CustomText({required this.imageName, required this.title, this.showDetails , this.copyTitle, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(imageName.compareTo(ImageAsset.CART) == 0){
          showDetails!();
        }
      else {
          Clipboard.setData(ClipboardData(text:copyTitle != null ? copyTitle : title)).then((_){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).copied,style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,));
          });
        }

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imageName,height: 25 ,width: 25,),
            SizedBox(width: 10,),
            Text(title,style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
