import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_auth/ui/widget/login_widgets/custem_button.dart';
import 'package:sales_beeorder_app/module_resturants/request/create_restaurant_request.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import 'package:sales_beeorder_app/module_resturants/ui/widget/choose_location_wedgit.dart';
import 'package:sales_beeorder_app/utils/components/custom_feild.dart';
import 'package:flutter/material.dart';

class CreateRestaurantSheet extends StatefulWidget {
  final Function(CreateRestaurantRequest) createRes;
  final RestaurantResponse? response;
  final bool isUpdated;
  const CreateRestaurantSheet(
      {required this.createRes, this.response, required this.isUpdated});

  @override
  State<CreateRestaurantSheet> createState() => _CreateOccasionCardState();
}

class _CreateOccasionCardState extends State<CreateRestaurantSheet> {
  late DateTime _selectedDate;
  var titleController = TextEditingController();
  var detailsController = TextEditingController();
  final GlobalKey<FormState> _addOccasionKey = GlobalKey<FormState>();
  LatLng? addressLoca;
  CameraPosition ca = CameraPosition(target: LatLng(0, 0));
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    if (widget.isUpdated) {}
  }

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
                  S.of(context).addNewRestaurant,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                leading: Icon(Icons.location_city, color: Colors.white),
              ),
            ),
            Form(
              key: _addOccasionKey,
              child: Column(
                children: [
                  CustomFormField(
                    validator: true,
                    preIcon: Icon(
                      Icons.title,
                    ),
                    hintText: S.of(context).restName,
                    controller: titleController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    maxLines: 5,
                    height: 150,
                    validator: true,
                    preIcon: Icon(
                      Icons.description,
                    ),
                    hintText: S.of(context).details,
                    controller: detailsController,
                  ),
                ],
              ),
            ),
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text(
                S.of(context).markRestLocation,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseLocationWidget(
                              previousLocation: addressLoca,
                            ))).then((value) {
                  if (value != null) {
                    addressLoca = value as LatLng;
                    ca = CameraPosition(target: addressLoca!, zoom: 15);
                    mapController
                        ?.animateCamera(CameraUpdate.newCameraPosition(ca));
                    setState(() {});
                  }
                });
              },
            ),
            addressLoca != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
                      child: GoogleMap(
                        onMapCreated: (controller) {
                          setState(() {
                            mapController = controller;
                          });
                        },
                        markers: {
                          Marker(
                              markerId:
                                  MarkerId(Random().nextInt(100).toString()),
                              position: addressLoca!)
                        },
                        initialCameraPosition: ca,
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(50, 5, 50, 5),
              child: CustomButton(
                  bgColor: Theme.of(context).primaryColor,
                  text: S.of(context).addNewRestaurant,
                  textColor: Colors.white,
                  loading: false,
                  buttonTab: () {
                    if (_addOccasionKey.currentState!.validate() &&
                        addressLoca != null)
                      widget.createRes(CreateRestaurantRequest(
                          longitude: addressLoca?.longitude,
                          name: titleController.text,
                          details: detailsController.text,
                          latitude: addressLoca?.latitude));
                    else {
                      Fluttertoast.showToast(
                          msg: S.of(context).markRestLocation);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
