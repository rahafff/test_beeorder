import 'package:sales_beeorder_app/abstracts/states/error_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:tip_dialog/tip_dialog.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/resturant_repository.dart';
import '../response/restaurant_response.dart';
import '../ui/screens/restaurant_screen.dart';
import '../ui/state/restaurants_success.dart';

@injectable
class RestaurantCubit extends Cubit<States> {
  final RestaurantRepository _occasionsRepository;

  RestaurantCubit(this._occasionsRepository) : super(LoadingState());

  getRestaurant(RestaurantsScreenState screenState , bool isLoading) {
    if(isLoading)
     emit(LoadingState());
    _occasionsRepository.getAllOrder().then((value) {
      if(value == null){
        emit(ErrorState(errMsg: S.current.networkError, retry: (){}));
      }else if (value.statusCode == '200'){

        List<OrderResponse> currentOr = [];
        List<OrderResponse> historyOrd = [];
        if(value.data != null) {
          for (var item in value.data) {
            OrderResponse re = OrderResponse.fromJson(item);
            if(re.status == 1)
              currentOr.add(OrderResponse.fromJson(item));
            else{
              historyOrd.add(OrderResponse.fromJson(item));
            }
          }
        }

        emit(RestaurantsListSuccess(screenState: screenState,currentOrders: currentOr,historyOrders: historyOrd));
      }

    });

  }

  changeOrderState(
      RestaurantsScreenState screenState, String id, String statusId) {
        TipDialogHelper.loading(S.current.loading);
    // emit(LoadingState());
    _occasionsRepository.changeOrderState(id , statusId).then((value) {
      if(value == null){
        TipDialogHelper.fail(S.current.networkError);
      }else if (value.statusCode == '200'){
        TipDialogHelper.success(S.current.orderDone);
        List<OrderResponse> currentOr = [];
        List<OrderResponse> historyOrd = [];
        if(value.data != null) {
          for (var item in value.data) {
            OrderResponse re = OrderResponse.fromJson(item);
            if(re.status == 1)
              currentOr.add(OrderResponse.fromJson(item));
            else{
              historyOrd.add(OrderResponse.fromJson(item));
            }
          }
        }
        emit(RestaurantsListSuccess(screenState: screenState,currentOrders: currentOr,historyOrders: historyOrd));
      }else {
        TipDialogHelper.fail(value.msg ?? '');
      }
    });
  }
}
