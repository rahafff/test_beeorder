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
  RestaurantCard({
    required this.model,
    required this.orderCompleted,
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
        ' 📅 ' +
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
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey.shade700,
                            Colors.grey.shade900,
                            Colors.black,
                          ]),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("#" + '${widget.model.id}' ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(createDate),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: widget.model.fromStoreName ?? '',
                            imageName: ImageAsset.STORE,
                          ),
                          CustomText(
                            title: widget.model.payment == 1
                                ? S.of(context).cash
                                : S.of(context).creditCard ?? '',
                            imageName: ImageAsset.CASH,
                          ),
                          CustomText(
                            title: 'C4D',
                            copyTitle: widget.model.clientLocationStr,
                            imageName: ImageAsset.LOCA,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Flexible(
                              flex: 3,
                              child: CustomText(
                                title: widget.model.clientName ?? '',
                                imageName: ImageAsset.IDEN,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          widget.model.type == 1
                              ? Flexible(
                                  flex: 2,
                                  child: CustomText(
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
                                  ))
                              : Flexible(
                                  flex: 1,
                                  child: CustomText(
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
                                  )),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: widget.model.clientNumber ?? '',
                            imageName: ImageAsset.WHATSAPP,
                          ),
                          CustomText(
                            title: widget.model.deliveryTime ?? '',
                            imageName: ImageAsset.TIME,
                          ),
                          Column(children: [
                            Row(
                              children: [
                                Icon(Icons.keyboard_double_arrow_right,color: Colors.red.shade700),
                                Text(S.of(context).reject,style: TextStyle(color: Colors.red.shade700),)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.keyboard_double_arrow_left,color: Colors.green.shade700),
                                Text(S.of(context).accept,style: TextStyle(color: Colors.green.shade700),)
                              ],
                            ),
                          ],),

                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
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
