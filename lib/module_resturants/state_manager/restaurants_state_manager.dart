import 'package:sales_beeorder_app/abstracts/states/error_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/module_resturants/request/create_restaurant_request.dart';
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

    List<RestaurantResponse> historyOrd = [
      RestaurantResponse(
          createdAt: "2022-03-01",
          costumerName: 'KeNaN Boss',
          price: '20000',
          id: 'CA31533',
          isDone: true,
          finishOrder: true,
          details: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,'),
      RestaurantResponse(
          createdAt: "2022-03-01",
          costumerName: 'KeNaN Boss',
          price: '20000',
          id: 'CA31533',
          isDone: true,
          finishOrder: true,
          details: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,'),
      RestaurantResponse(
          createdAt: "2022-03-01",
          costumerName: 'KeNaN Boss',
          price: '20000',
          id: 'CA31533',
          isDone: true,
          finishOrder: true,
          details: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,'),


    ];

    List<RestaurantResponse> currentOr = [

      RestaurantResponse(
          isDone: false,
          finishOrder: false,
          createdAt: "2022-05-04",
          costumerName: 'Rahaf Tan',
          price: '20500',
          id: 'CA31663',
          details: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,'),
      RestaurantResponse(
          isDone: false,
          finishOrder: false,
          createdAt: "2022-05-04",
          costumerName: 'Rahaf Tan',
          price: '20500',
          id: 'CA31663',
          details: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,'),
      RestaurantResponse(
          isDone: false,
          finishOrder: false,
          createdAt: "2022-05-04",
          costumerName: 'Rahaf Tan',
          price: '20500',
          id: 'CA31663',
          details: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,'),
    ];

    emit(RestaurantsListSuccess(screenState: screenState,currentOrders: currentOr,historyOrders: historyOrd));
  }

  createRestaurant(
      RestaurantsScreenState screenState, CreateRestaurantRequest request) {
    emit(LoadingState());
    _occasionsRepository.addNewRestaurant(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getRestaurant(screenState,true);
            }));
      } else if (value.codeInt == 200) {
        getRestaurant(screenState,true);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage ?? '',
            retry: () {
              getRestaurant(screenState,true);
            }));
      }
    });
  }
}
