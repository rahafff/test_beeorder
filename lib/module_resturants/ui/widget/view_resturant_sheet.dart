import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import '../../../generated/l10n.dart';

class ViewRestaurantDetails extends StatelessWidget {
  final OrderResponse model;
  ViewRestaurantDetails({required this.model});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: ListView(
          controller: scrollController,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: ListTile(
                title: Text(
                  model.clientName ?? '',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                leading: Icon(Icons.location_city, color: Colors.white),
              ),
            ),
            // Row(
            //   children: [
            //     Flexible(
            //       flex: 1,
            //       child: ListTile(
            //         title: Text(S.of(context).clientName),
            //         subtitle: Text(model.clientName ?? ''),
            //       ),
            //     ),
            //     Flexible(
            //       flex: 1,
            //       child: ListTile(
            //         title: Text(S.of(context).clientNumber),
            //         subtitle: Text(model.clientNumber ?? ''),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 5,
            ),
            InkWell(onTap: (){
              Clipboard.setData(ClipboardData(text:model.details)).then((_){
                Fluttertoast.showToast(msg: S.of(context).copied);
               });
            },
              child: ListTile(
                title: Text(S.of(context).details),
                subtitle: Text(model.details ?? ''),
              ),
            ),
            // ListTile(
            //   title: Text(S.of(context).payment),
            //   subtitle: Text(model.payment==1 ? S.of(context).cash :S.of(context).creditCard),
            // ),


          ],
        ),
      ),
    );
  }
}
