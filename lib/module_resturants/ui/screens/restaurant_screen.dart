import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/module_resturants/request/create_restaurant_request.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/create_occa_sheet.dart';
import 'package:sales_beeorder_app/module_settings/setting_routes.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/restaurants_state_manager.dart';

@injectable
class RestaurantsScreen extends StatefulWidget {
  final RestaurantCubit cubit;

  const RestaurantsScreen(
    this.cubit,
  );

  @override
  State<RestaurantsScreen> createState() => RestaurantsScreenState();
}

class RestaurantsScreenState extends State<RestaurantsScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getRestaurant(this);
  }

  getRestaurant() {
    widget.cubit.getRestaurant(this);
  }
  createRestaurant(CreateRestaurantRequest restaurantRequest) {
    widget.cubit.createRestaurant(this , restaurantRequest);
  }


  @override
  void dispose() {
    super.dispose();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).restaurant),
        actions: [

          InkWell(
            onTap: () {
              Navigator.pushNamed(context, SettingRoutes.ROUTE_SETTINGS);
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 25),
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return CreateRestaurantSheet(createRes: (req){
                Navigator.pop(context);
                createRestaurant(req);
              },isUpdated: false,);
            },
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(15))),
            isScrollControlled: true,
            elevation: 5);
      },child: Icon(Icons.add , color: Colors.white,),backgroundColor: Theme.of(context).primaryColor),
      body: BlocBuilder<RestaurantCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
