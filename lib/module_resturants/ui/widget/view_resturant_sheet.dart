import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sales_beeorder_app/module_resturants/response/restaurant_response.dart';
import '../../../generated/l10n.dart';

class ViewRestaurantDetails extends StatelessWidget {
  final RestaurantResponse model;
  ViewRestaurantDetails({required this.model});

  @override
  Widget build(BuildContext context) {
    CameraPosition ca = CameraPosition(
        target: LatLng(model.location!.latitude, model.location!.longitude),
        zoom: 15);
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
                  model.name ?? '',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                leading: Icon(Icons.location_city, color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(S.of(context).name),
              subtitle: Text(model.name ?? ''),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text(S.of(context).details),
              subtitle: Text(model.details ?? ''),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 150,
                child: GoogleMap(
                  onMapCreated: (controller) {
                    // setState(() {
                    //   mapController = controller;
                    // });
                  },
                  markers: {
                    Marker(
                        markerId: MarkerId(Random().nextInt(100).toString()),
                        position: LatLng(model.location!.latitude,
                            model.location!.longitude))
                  },
                  initialCameraPosition: ca,
                  zoomControlsEnabled: false,
                  myLocationEnabled: false,
                  zoomGesturesEnabled: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
