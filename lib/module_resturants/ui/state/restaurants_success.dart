import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import 'package:sales_beeorder_app/module_resturants/ui/screens/restaurant_screen.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/restaurant_card.dart';
import 'package:sales_beeorder_app/utils/components/custom_alert_dialog.dart';
import 'package:sales_beeorder_app/utils/images/images.dart';
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
                     // Slidable(
                     //   key: const ValueKey(0),
                     //   endActionPane: ActionPane(
                     //     motion: const ScrollMotion(),
                     //
                     //     dismissible: DismissiblePane(onDismissed: (){
                     //       screenState.changeStatus('2');
                     //   },confirmDismiss: () async {
                     //       return await showDialog(
                     //         context: context,
                     //         builder: (BuildContext context) {
                     //           return AlertDialog(
                     //             title: const Text("Confirm"),
                     //             content: const Text("Are you sure you wish to delete this item?"),
                     //             actions: <Widget>[
                     //               TextButton(
                     //                   onPressed: () => Navigator.of(context).pop(true),
                     //                   child: const Text("DELETE")
                     //               ),
                     //               TextButton(
                     //                 onPressed: () => Navigator.of(context).pop(false),
                     //                 child: const Text("CANCEL"),
                     //               ),
                     //             ],
                     //           );
                     //         },
                     //       );
                     //     },
                     //
                     //         motion: ScrollMotion()),
                     //     children: [
                     //       SlidableAction(
                     //         onPressed: (value) {
                     //         },
                     //         backgroundColor: Colors.green,
                     //         foregroundColor: Colors.white,
                     //         icon: Icons.check,
                     //         label: S.of(context).accept,
                     //       ),
                     //
                     //     ],
                     //   ),
                     //   startActionPane:  ActionPane(
                     //     children: [
                     //       SlidableAction(
                     //         onPressed: (value) {
                     //         },
                     //         backgroundColor: Colors.red,
                     //         foregroundColor: Colors.white,
                     //         icon: Icons.delete,
                     //         label: S.of(context).reject,
                     //       ),
                     //
                     //     ],
                     //     motion: const ScrollMotion(),
                     //     dismissible: DismissiblePane(onDismissed: () {
                     //       showConfirmAlert(context ,'3');
                     //     }),
                     //   ),
                     //   child: RestaurantCard(model: currentOrders[index],orderCompleted: (){
                     //     screenState.changeStatus(currentOrders[index].id.toString());
                     //   }),
                     // ),
                 Dismissible(
                   key: Key(index.toString()),
                   background: Container(
                     color: Colors.green,
                   ),
                   secondaryBackground:Container(
                     color: Colors.red,
                   ) ,
                   onDismissed: (dir){
                     dir.index == 3 ?
                         screenState.changeStatus('2'):
                     screenState.changeStatus('3');
                   },
                   confirmDismiss: (dir) async{
                     print(dir);
                     return await showDialog(
                                 context: context,
                                 builder: (BuildContext context) {
                                   return Dialog(
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(12),
                                     ),
                                     elevation: 0,
                                     backgroundColor: Colors.transparent,
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(left: 12, right: 12, top: 40),
                                            margin: EdgeInsets.only(top: 40),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context).cardColor,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.circular(12),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
                                                ]
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                   dir.index == 3 ? S.of(context).confirmMessage:
                                                   S.of(context).confirmCancelMessage,
                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    TextButton(onPressed: (){
                                                      Navigator.of(context).pop(false);
                                                    }, child: Text(S.of(context).cancel,style: TextStyle(color: Colors.red),)),
                                                    TextButton(onPressed: (){
                                                      Navigator.of(context).pop(true);
                                                    }, child: Text(S.of(context).confirm,style: TextStyle(color: Colors.green)))
                                                  ],)

                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: 5,
                                            right: 5,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.transparent,
                                              radius: 40,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                                  child: Image.asset(ImageAsset.STOP)),
                                            ),
                                          ),
                                        ],
                                      ),
                                   );
                                 },
                               );
                   },
                   child: RestaurantCard(model: currentOrders[index],orderCompleted: (){
                     screenState.changeStatus(currentOrders[index].id.toString());
                   }),
                 ),
                   shrinkWrap: true,itemCount: currentOrders.length,),
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
  showConfirmAlert(BuildContext context,String type) async {
  return await   showDialog(
        context: context,
        builder: (context) => CustomDialogBox(
          onCancelTap: (){
            Navigator.of(context).pop(false);
          },
            title: S.of(context).confirmMessage,
            onConfirmTap: () {
              Navigator.of(context).pop(true);
            }));
  }
  showConfirm2Alert(BuildContext context,String type) async {
  return await   showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm"),
        content: const Text("Are you sure you wish to delete this item?"),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("DELETE")
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("CANCEL"),
          ),
        ],
      );
    },
  );
  }
}
