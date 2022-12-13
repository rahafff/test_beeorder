import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/view_resturant_sheet.dart';
import 'package:sales_beeorder_app/utils/components/custom_alert_dialog.dart';
import 'package:sales_beeorder_app/utils/helpers/date_converter.dart';

class RestaurantCard extends StatefulWidget {
  final OrderResponse model;
  final Function orderCompleted;
    RestaurantCard({  required this.model, required this.orderCompleted,  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {

  var createDate;
  @override
  void initState() {
    createDate = DateFormat.jm()
        .format(DateHelper.convert(widget.model.createdAt?.timestamp)) +
        ' 📅 ' +
        DateFormat.Md()
            .format(DateHelper.convert(widget.model.createdAt?.timestamp));

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return ViewRestaurantDetails(model: widget.model,);
                },
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(15))),
                isScrollControlled: true,
                elevation: 5);
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("#"+ '${widget.model.id}'?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                Text(createDate ),
                              ],
                            ),
                            SizedBox(height: 12,),
                              Row(
                                children: [
                                  Text(S.of(context).clientName +" : " , style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(widget.model.clientName ?? ''),
                                ],
                              ) ,
                              SizedBox(height: 12,),
                              Row(
                                children: [
                                  Text(S.of(context).clientNumber +" : " , style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${widget.model.clientNumber}'),
                                ],
                              ),
                              SizedBox(height: 12,),
                              Row(
                                children: [
                                  Text(S.of(context).deliveryDate +' : ',style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text(widget.model.deliveryTime ?? '' ),
                                ],
                              ),
                              SizedBox(height: 12,),
                               Align(
                                 alignment: AlignmentDirectional.bottomEnd,
                                 child: Container(
                                     decoration: BoxDecoration(color:widget.model.payment==1 ? Colors.green.shade800 : Colors.blue.shade800,
                                         borderRadius: BorderRadius.circular(12)),
                                     child:
                                 TextButton.icon(
                                   label:Text(widget.model.payment==1 ? S.of(context).cash :S.of(context).creditCard ,style: TextStyle(color: Colors.white),) ,
                                   icon: Icon(widget.model.payment==1 ? Icons.money :Icons.credit_card,color: Colors.white,), onPressed: () {  },
                                     )),
                               )
                          ],),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
     widget.model.status == 2 ? Container():   Align(
          alignment: AlignmentDirectional.centerEnd,
          heightFactor: 4,
          child: Container(decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:widget.model.finishOrder ? Colors.green.shade800 : Colors.grey
          ),child: InkWell(
            onTap: (){
              showConfirmAlert();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check,size: 30,),
            ),
          ),),
        ),
      ],
    );
  }
  void showConfirmAlert(){
    showDialog(context: context, builder: (context) => CustomDialogBox(title: S.of(context).confirmMessage,onTap: (){
      widget.model.finishOrder = true;
      setState(() {});
      widget.orderCompleted();
    }));
  }
}
