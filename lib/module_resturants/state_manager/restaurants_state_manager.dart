import 'package:geolocator/geolocator.dart';
import 'package:sales_beeorder_app/abstracts/states/error_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sales_beeorder_app/module_resturants/request/create_restaurant_request.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../../module_deep_links/service/deep_links_service.dart';
import '../repository/resturant_repository.dart';
import '../response/restaurant_response.dart';
import '../ui/screens/restaurant_screen.dart';
import '../ui/state/restaurants_success.dart';

@injectable
class RestaurantCubit extends Cubit<States> {
  final RestaurantRepository _occasionsRepository;

  RestaurantCubit(this._occasionsRepository) : super(LoadingState());

  getRestaurant(RestaurantsScreenState screenState) {
    emit(LoadingState());
    _occasionsRepository.getRestaurant().then((resturans) {
      if (resturans == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getRestaurant(screenState);
            }));
      } else if (resturans.data != null) {
        List<RestaurantResponse> occList = [];
        DeepLinksService.defaultLocation().then((currentLocation) async {
          if (currentLocation != null) {
            for (var item in resturans.data) {
              RestaurantResponse restv = RestaurantResponse.fromJson(item);
              restv.distance = await Geolocator.distanceBetween(
                      currentLocation.latitude,
                      currentLocation.longitude,
                      restv.location!.latitude,
                      restv.location!.longitude) /
                  1000;
              occList.add(restv);
            }
            occList.sort((a, b) => a.distance!.compareTo(b.distance!));
            emit(RestaurantsListSuccess(
                screenState: screenState, restaurantResponse: occList));
          }
        });
      } else {
        emit(ErrorState(
            errMsg: resturans.errorMessage ?? '',
            retry: () {
              getRestaurant(screenState);
            }));
      }
    });
  }

  createRestaurant(
      RestaurantsScreenState screenState, CreateRestaurantRequest request) {
    emit(LoadingState());
    _occasionsRepository.addNewRestaurant(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getRestaurant(screenState);
            }));
      } else if (value.codeInt == 200) {
        getRestaurant(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage ?? '',
            retry: () {
              getRestaurant(screenState);
            }));
      }
    });
  }
}
