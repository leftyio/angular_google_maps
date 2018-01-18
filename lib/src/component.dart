import 'dart:async';
import 'dart:html';
import "package:angular/angular.dart";
import 'package:google_maps/google_maps.dart';

@Component(
    selector: "google-map",
    template: "",
    styles: const [":host{display:block;}"])
class GoogleMapComponent implements OnInit, OnDestroy {
  final _loadController = new StreamController<GMap>();
  final HtmlElement element;
  final _mapOptions = new MapOptions()
    ..zoom = 8
    ..center = new LatLng(48.8651651, 2.3451825);
  GMap _map;

  GoogleMapComponent(this.element);

  GMap get map => _map;

  /// Latitude
  @Input("lat")
  void set lat(value) {
    num lng = _mapOptions.center?.lng ?? 0;
    _mapOptions.center = new LatLng(_safeNum(value), lng);
  }

  /// Longitude
  @Input("lng")
  void set lng(value) {
    num lat = _mapOptions.center?.lat ?? 0;
    _mapOptions.center = new LatLng(lat, _safeNum(value));
  }

  /// Zoom
  @Input("zoom")
  void set zoom(value) {
    _mapOptions.zoom = _safeNum(value) ?? 8;
  }

  @Output()
  Stream<GMap> get load => _loadController.stream;

  @override
  Future<Null> ngOnInit() async {
    _map = new GMap(element, _mapOptions);
    _loadController.add(_map);
  }

  @override
  void ngOnDestroy() {
    _loadController.close();
  }

  num _safeNum(value) {
    if (value is String) {
      return num.parse(value, (_) => null);
    } else if (value is num) {
      return value;
    }
    return null;
  }
}
