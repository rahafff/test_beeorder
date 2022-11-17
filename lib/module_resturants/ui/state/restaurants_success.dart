import 'package:flutter/material.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import 'package:sales_beeorder_app/module_resturants/ui/screens/restaurant_screen.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/restaurant_card.dart';
import 'package:sales_beeorder_app/utils/components/costom_search.dart';
import 'package:sales_beeorder_app/utils/components/custom_list_view.dart';
import '../../../abstracts/states/state.dart';
import '../../../generated/l10n.dart';

class RestaurantsListSuccess extends States {
  final List<RestaurantResponse> restaurantResponse;
  RestaurantsScreenState screenState;

  RestaurantsListSuccess(
      {required this.restaurantResponse, required this.screenState});
  String? search;
  @override
  Widget getUI(BuildContext context) {
    return    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomDeliverySearch(
            hintText: S.current.searchForName,
            onChanged: (s) {
              if (s == '' || s.isEmpty) {
                search = null;
                screenState.refresh();
              } else {
                search = s;
                screenState.refresh();
              }
            },
          ),
        ),

        Divider(),
        CustomListView.custom(children: getRest(context))
      ]),
    );
  }

  List<Widget> getRest(BuildContext context) {
    List<Widget> widgets = [];
    for (RestaurantResponse element in restaurantResponse  ) {
      if (!element.name!.toLowerCase().contains(search?.toLowerCase() ?? '') && search != null) {
        continue;
      }
      widgets.add(
          RestaurantCard(
            model: element,
          ));
    }
    return widgets;
  }
}
