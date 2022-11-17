import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantResponse model;

    RestaurantCard({  required this.model,  })  ;

  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    CameraPosition ca = CameraPosition(target: LatLng(model.location!.latitude , model.location!.longitude),zoom: 15);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
//              spreadRadius: 8,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(model.name ?? '',style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(model.createdAt ?? '', ),
                      ],
                    ),
                    Text(model.details ?? ''),
                  ],),
                ),

                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 85,

                    child: GoogleMap(
                      onMapCreated: (controller) {
                        // setState(() {
                        //   mapController = controller;
                        // });
                      },
                      markers: {
                        Marker(
                            markerId:
                            MarkerId(Random().nextInt(100).toString()),
                            position: LatLng(model.location!.latitude , model.location!.longitude))
                      },
                      initialCameraPosition: ca,
                      zoomControlsEnabled: false,
                      myLocationEnabled: false,
                      zoomGesturesEnabled: false,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
