# angular_google_maps

An Angular component for Google maps

## Usage

A simple usage example:

```dart
import 'package:angular/angular.dart';
import 'package:angular_google_maps/angular_google_maps.dart';

main() async {
  await loadGoogleMaps("API_KEY");
  bootstrap(AppComponent);
}

```
```html
<google-map
           style="width: 100%; height: 100%;"
           lat="48.8651651" 
           lng="2.3451825" 
           zoom="3" 
           (load)="onMapLoad(\$event)"></google-map>                  
``` 

```dart
void onMapLoaded(GMap map) {
  ...
}
```

    