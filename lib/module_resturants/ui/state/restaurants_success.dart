import 'package:flutter/material.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import 'package:sales_beeorder_app/module_resturants/ui/screens/restaurant_screen.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/restaurant_card.dart';
import '../../../abstracts/states/state.dart';

class RestaurantsListSuccess extends States {
  final List<OrderResponse> currentOrders;
  final List<OrderResponse> historyOrders;
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
                  text: S.of(context).currentOrder
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                    text: S.of(context).historyOrder
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
               RefreshIndicator(
                 onRefresh: () async{
                   screenState.getRestaurant(true);
                 },
                 child: ListView.builder(itemBuilder: (context, index) =>
                     RestaurantCard(model: currentOrders[index],orderCompleted: (){
                       screenState.changeStatus(currentOrders[index].id.toString());
                     }),shrinkWrap: true,itemCount: currentOrders.length,),
               ),
               RefreshIndicator(
                 onRefresh: () async{
                   screenState.getRestaurant(true);
                 },
                 child: ListView.builder(itemBuilder: (context, index) =>
                     RestaurantCard(model: historyOrders[index],orderCompleted: (){}),shrinkWrap: true,itemCount: historyOrders.length,),
               ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
