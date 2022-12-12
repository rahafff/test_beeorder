import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/view_resturant_sheet.dart';
import 'package:sales_beeorder_app/utils/helpers/date_converter.dart';

class RestaurantCard extends StatefulWidget {
  final OrderResponse model;
    RestaurantCard({  required this.model,  });

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
                              Row(children: [
                                Row(
                                  children: [
                                    Text(S.of(context).clientName +" : " , style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text(widget.model.clientName ?? ''),
                                  ],
                                ),
                                SizedBox(height: 12,),
                                Row(
                                  children: [
                                    Text(S.of(context).clientNumber +" : " , style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('${widget.model.clientNumber}'),
                                  ],
                                ),
                              ],)
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
          heightFactor: 3.0,
          child: Container(decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:widget.model.finishOrder ? Colors.green.shade800 : Colors.grey
          ),child: InkWell(
            onTap: (){
              widget.model.finishOrder = true;
              setState(() {

              });
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
}
