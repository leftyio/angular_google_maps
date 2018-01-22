import 'package:angular/angular.dart';
import 'package:angular_google_maps/angular_google_maps.dart';

main() async {
  await loadGoogleMaps("API_KEY");
  bootstrap(AppComponent);
}

@Component(
    selector: 'showcase-google-map',
    template: '''<google-map
        style="width: 100%; height: 100%;"
        lat="-28.024" lng="140.887" zoom="3" (load)="onMapLoad(\$event)"></google-map>
                 ''',
    directives: const [GoogleMapComponent],
    pipes: const [COMMON_PIPES])
class AppComponent {
  List<LatLng> locations = [
    new LatLng(-31.563910, 147.154312),
    new LatLng(-33.718234, 150.363181),
    new LatLng(-33.727111, 150.371124),
    new LatLng(-33.848588, 151.209834),
    new LatLng(-33.851702, 151.216968),
    new LatLng(-34.671264, 150.863657),
    new LatLng(-35.304724, 148.662905),
    new LatLng(-36.817685, 175.699196),
    new LatLng(-36.828611, 175.790222),
    new LatLng(-37.750000, 145.116667),
    new LatLng(-37.759859, 145.128708),
    new LatLng(-37.765015, 145.133858),
    new LatLng(-37.770104, 145.143299),
    new LatLng(-37.773700, 145.145187),
    new LatLng(-37.774785, 145.137978),
    new LatLng(-37.819616, 144.968119),
    new LatLng(-38.330766, 144.695692),
    new LatLng(-39.927193, 175.053218),
    new LatLng(-41.330162, 174.865694),
    new LatLng(-42.734358, 147.439506),
    new LatLng(-42.734358, 147.501315),
    new LatLng(-42.735258, 147.438000),
    new LatLng(-43.999792, 170.463352)
  ];

  void onMapLoad(GMap map) {
    Iterable<Marker> markers = locations
        .map((l) => new Marker(new MarkerOptions()
          ..position = l
          ..map = map))
        .toList();
    loadMarkerClusterer().then((_) {
      new MarkerClusterer(map, markers);
    });
  }
}

