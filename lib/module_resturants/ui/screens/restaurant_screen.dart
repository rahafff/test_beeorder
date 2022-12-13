import 'dart:async';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/module_resturants/request/create_restaurant_request.dart';
import 'package:sales_beeorder_app/module_settings/setting_routes.dart';
import 'package:tip_dialog/tip_dialog.dart';
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

class RestaurantsScreenState extends State<RestaurantsScreen>  with SingleTickerProviderStateMixin  {
  TabController?  tabController;

  @override
  void initState() {
    super.initState();
     tabController = TabController(length: 2, vsync: this);

    widget.cubit.getRestaurant(this,true);

  }

  getRestaurant(bool isLoading) {
    widget.cubit.getRestaurant(this,isLoading);
  }
  changeStatus(String id) {
    widget.cubit.changeOrderState(this , id);
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
        title: Text(S.of(context).orders),
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

      body: BlocBuilder<RestaurantCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return Stack(
            children: [
              state.getUI(context),
              TipDialogContainer(
                  duration: const Duration(seconds: 2),
                  outsideTouchable: true,
                  onOutsideTouch: (Widget tipDialog) {
                    if (tipDialog is TipDialog &&
                        tipDialog.type == TipDialogType.LOADING) {
                      TipDialogHelper.dismiss();
                    }
                  })
            ],
          );
        },
      ),
    );
  }
}
