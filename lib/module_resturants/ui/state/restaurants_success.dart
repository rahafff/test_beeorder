import 'package:flutter/material.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import 'package:sales_beeorder_app/module_resturants/ui/screens/restaurant_screen.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/restaurant_card.dart';
import '../../../abstracts/states/state.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class RestaurantsListSuccess extends States {
  final List<RestaurantResponse> currentOrders;
  final List<RestaurantResponse> historyOrders;
  RestaurantsScreenState screenState;

  RestaurantsListSuccess(
      {required this.currentOrders,required this.historyOrders, required this.screenState});
  String? search;
  @override
  Widget getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // give the tab bar a height [can change hheight to preferred height]
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: TabBar(
              controller: screenState.tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: Theme.of(context).primaryColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Current Order',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'History Order',
                ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: screenState.tabController,
              children: [
                // first tab bar view widget
               ListView.builder(itemBuilder: (context, index) =>
                   RestaurantCard(model: currentOrders[index]),shrinkWrap: true,itemCount: currentOrders.length,),
               ListView.builder(itemBuilder: (context, index) =>
                   RestaurantCard(model: historyOrders[index]),shrinkWrap: true,itemCount: historyOrders.length,),



              ],
            ),
          ),
        ],
      ),
    );
  }
}
