import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_deep_links/service/deep_links_service.dart';

class ChooseLocationWidget extends StatefulWidget {
  LatLng? previousLocation;
  ChooseLocationWidget({this.previousLocation});

  @override
  State<StatefulWidget> createState() => ChooseLocationWidgetState();
}

class ChooseLocationWidgetState extends State<ChooseLocationWidget> {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(-33.852, 151.211),
    zoom: 15.0,
  );

  CameraPosition _position = _kInitialPosition;
  bool _isMapCreated = false;
  final bool _isMoving = false;
  bool _compassEnabled = true;
  bool _mapToolbarEnabled = true;
  CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
  MapType _mapType = MapType.normal;
  bool _rotateGesturesEnabled = true;
  bool _scrollGesturesEnabled = true;
  bool _tiltGesturesEnabled = true;
  bool _zoomControlsEnabled = false;
  bool _zoomGesturesEnabled = true;
  bool _indoorViewEnabled = true;
  bool _myLocationEnabled = true;
  bool _myTrafficEnabled = false;
  bool _myLocationButtonEnabled = true;
  // late GoogleMapController _controller;/
  late CustomInfoWindowController customInfoWindowController;
  bool _nightMode = false;
  Set<Marker> markers = {};
  // Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    // _controller = GoogleMapController.init(id, _position);
    _position = widget.previousLocation != null ? CameraPosition(
      target: LatLng(widget.previousLocation!.latitude, widget.previousLocation!.longitude),
      zoom: 15.0,
    )  :_kInitialPosition;
    customInfoWindowController = CustomInfoWindowController();
    getDefualtLocation(widget.previousLocation);
  }

  getDefualtLocation([LatLng? previous]) async {
    print('in loocc');
    late LatLng POS;
    if (previous == null || previous.latitude == 0.0) {
      var myLocation = await DeepLinksService.defaultLocation();
      POS = LatLng(myLocation?.latitude ?? 0, myLocation?.longitude ?? 0);
      print(POS);
      print('ddddddddddddddddddddddddddd');
    } else {
     await Future.delayed(Duration(milliseconds: 30));
      print('innnnnnnnelllssseeeee');
      print(previous);
      POS = previous;
    }
    customInfoWindowController.googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: POS, zoom: 15)));
    markers.add(
        Marker(markerId: MarkerId(POS.latitude.toString()), position: POS));
    setState(() {
      print('ssssssssss');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GoogleMap googleMap = GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: _position,
      compassEnabled: _compassEnabled,
      mapToolbarEnabled: _mapToolbarEnabled,
      cameraTargetBounds: _cameraTargetBounds,
      minMaxZoomPreference: _minMaxZoomPreference,
      mapType: _mapType,
      rotateGesturesEnabled: _rotateGesturesEnabled,
      scrollGesturesEnabled: _scrollGesturesEnabled,
      tiltGesturesEnabled: _tiltGesturesEnabled,
      zoomGesturesEnabled: _zoomGesturesEnabled,
      zoomControlsEnabled: _zoomControlsEnabled,
      indoorViewEnabled: _indoorViewEnabled,
      myLocationEnabled: _myLocationEnabled,
      myLocationButtonEnabled: _myLocationButtonEnabled,
      trafficEnabled: _myTrafficEnabled,
      // onCameraMove: _updateCameraPosition,
      markers: markers,
      onTap: (v) {
        markers.clear();
        markers.add(
            Marker(markerId: MarkerId(v.latitude.toString()), position: v));
        setState(() {});
      },

    );

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).markRestLocation),
      ),
      body: Container(child: googleMap),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, markers.first.position);
        },
        child: Icon(
          FontAwesomeIcons.checkDouble,
          color: Colors.white,
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      customInfoWindowController.googleMapController = controller;
      // _isMapCreated = true;
    });
  }
}
