import 'package:flutter/material.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import '../../../generated/l10n.dart';

class ViewRestaurantDetails extends StatelessWidget {
  final RestaurantResponse model;
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
                  model.costumerName ?? '',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                leading: Icon(Icons.location_city, color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(S.of(context).name),
              subtitle: Text(model.costumerName ?? ''),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text(S.of(context).details),
              subtitle: Text(model.details ?? ''),
            ),


          ],
        ),
      ),
    );
  }
}
