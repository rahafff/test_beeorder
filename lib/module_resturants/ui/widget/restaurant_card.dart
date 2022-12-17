import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/custom_text_widget.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/view_resturant_sheet.dart';
import 'package:sales_beeorder_app/utils/components/custom_alert_dialog.dart';
import 'package:sales_beeorder_app/utils/helpers/date_converter.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';

class RestaurantCard extends StatefulWidget {
  final OrderResponse model;
  final Function orderCompleted;
  final Function orderReject;
  RestaurantCard({
    required this.model,
    required this.orderCompleted,
    required this.orderReject,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  var createDate;
  @override
  void initState() {
    createDate = DateFormat.jm()
            .format(DateHelper.convert(widget.model.createdAt?.timestamp)) +
        DateFormat.Md()
            .format(DateHelper.convert(widget.model.createdAt?.timestamp));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("#" + '${widget.model.id}' ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(createDate,style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Divider(thickness: 1,height: 1,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            fieldName: S.of(context).restName,
                            title: widget.model.fromStoreName ?? '',
                            imageName: ImageAsset.STORE,
                          ),
                          CustomText(imageName: ImageAsset.CASH, title: widget.model.payment == 1
                              ? S.of(context).cash
                              : S.of(context).creditCard ?? '', fieldName: S.of(context).payment)

                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            fieldName: S.of(context).clientName,
                            title: widget.model.clientName ?? '',
                            imageName: ImageAsset.IDEN,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          widget.model.type == 1
                              ? CustomText(
                                showDetails: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return ViewRestaurantDetails(
                                          model: widget.model,
                                        );
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.vertical(
                                                  top:
                                                      Radius.circular(15))),
                                      isScrollControlled: true,
                                      elevation: 5);
                                },
                                title: S.of(context).cart ?? '',
                                imageName: ImageAsset.CART,
                            fieldName: S.of(context).orderType,
                              )
                              : CustomText(
                                showDetails: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return ViewRestaurantDetails(
                                          model: widget.model,
                                        );
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.vertical(
                                                  top:
                                                      Radius.circular(15))),
                                      isScrollControlled: true,
                                      elevation: 5);
                                },
                                title: S.of(context).hand ?? '',
                                imageName: ImageAsset.CART,
                              fieldName: S.of(context).orderType
                              ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            fieldName: S.of(context).clientNumber,
                            title: widget.model.clientNumber ?? '',
                            imageName: ImageAsset.WHATSAPP,
                          ),
                          CustomText(
                            fieldName: '',
                            title: 'C4D',
                            copyTitle: widget.model.clientLocationStr,
                            imageName: ImageAsset.LOCA,
                          ),
                          // Column(children: [
                          //   Row(
                          //     children: [
                          //       Icon(Icons.keyboard_double_arrow_right,color: Colors.red.shade700),
                          //       Text(S.of(context).reject,style: TextStyle(color: Colors.red.shade700),)
                          //     ],
                          //   ),
                          //   Row(
                          //     children: [
                          //       Icon(Icons.keyboard_double_arrow_left,color: Colors.green.shade700),
                          //       Text(S.of(context).accept,style: TextStyle(color: Colors.green.shade700),)
                          //     ],
                          //   ),
                          // ],),

                        ],
                      ),
                      CustomText(
                        fieldName: S.of(context).deliveryDate,
                        title: widget.model.deliveryTime ?? '',
                        imageName: ImageAsset.TIME,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      widget.model.status != 1 ? Container() :
                      Column(children: [
                        Divider(height: 1,thickness: 1,),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                child: Container(
                                  child:  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(30, 5, 30, 5),
                                    child: Text(S.of(context).accept,style: TextStyle(color: Colors.white)),
                                  ),
                                  decoration: BoxDecoration(color: Colors.green , borderRadius: BorderRadius.circular(12)),
                                ),
                                onTap: (){
                                  widget.orderCompleted();
                                },
                              ),

                              SizedBox(width: 25,),
                              InkWell(
                                child: Container(
                                  child:  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(30, 5, 30, 5),
                                    child: Text(S.of(context).reject,style: TextStyle(color: Colors.white)),
                                  ),
                                  decoration: BoxDecoration(color: Colors.red , borderRadius: BorderRadius.circular(12)),
                                ),
                                onTap: (){
                                  widget.orderReject();
                                },
                              ),

                              SizedBox(width: 5,),
                            ],),
                        ),
                      ],)


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // widget.model.status == 2 ? Container():   Align(
        //      alignment: AlignmentDirectional.centerEnd,
        //      heightFactor: 4,
        //      child: Container(decoration: BoxDecoration(
        //        shape: BoxShape.circle,
        //        color:widget.model.finishOrder ? Colors.green.shade800 : Colors.grey
        //      ),child: InkWell(
        //        onTap: (){
        //          showConfirmAlert();
        //        },
        //        child: Padding(
        //          padding: const EdgeInsets.all(8.0),
        //          child: Icon(Icons.check,size: 30,),
        //        ),
        //      ),),
        //    ),
      ],
    );
  }


}
