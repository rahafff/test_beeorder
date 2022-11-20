import 'package:flutter/material.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/view_resturant_sheet.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantResponse model;
    RestaurantCard({  required this.model,  })  ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return ViewRestaurantDetails(model: model,);
            },
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(15))),
            isScrollControlled: true,
            elevation: 5);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
//              spreadRadius: 8,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                          Text(model.name ?? '',style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(model.createdAt ?? '', ),
                        ],
                      ),
                      Text(model.details ?? ''),
                    ],),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
