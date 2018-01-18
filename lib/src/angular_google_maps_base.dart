import "dart:async";
import "dart:html";
import "package:dart_browser_loader/dart_browser_loader.dart";

Future<ScriptElement> loadGoogleMaps(String apiKey,
    {Iterable<String> libraries = const []}) {
  String url = "http://maps.googleapis.com/maps/api/js?key=$apiKey";
  if (libraries.isNotEmpty) {
    url += "&libraries=${libraries.join(",")}";
  }
  return loadScript(url, id: "jssdk-gmap", isAsync: true, isDefer: true);
}

Future<ScriptElement> loadMarkerClusterer() {
  return loadScript(
      "https://cdnjs.cloudflare.com/ajax/libs/markerclustererplus/2.1.4/markerclusterer.min.js",
      id: "jssdk-markerclusterer",
      isAsync: true,
      isDefer: true);
}
