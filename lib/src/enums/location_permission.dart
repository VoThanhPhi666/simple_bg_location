import '../errors/location_permission_exception.dart';

/// Represent the possible location permissions.
enum LocationPermission {
  /// Permission to access the device's location is denied, the App should try
  /// to request permission using the `SimpleBgLocation.requestPermission()` method.
  denied,

  /// Permission to access the device's location is permanently denied. When
  /// requesting permissions the permission dialog will not been shown until
  /// the user updates the permission in the App settings.
  deniedForever,

  /// Permission to access the device's location is allowed only while
  /// the App is in use.
  whileInUse,

  /// Permission to access the device's location is allowed even when the
  /// App is running in the background.
  always,

  /// Permission status is cannot be determined.
  unableToDetermine
}

extension LocationPermissionXonInt on int {
  LocationPermission toLocationPermission() {
    if (this == LocationPermission.denied.index) {
      return LocationPermission.denied;
    } else if (this == LocationPermission.deniedForever.index) {
      return LocationPermission.deniedForever;
    } else if (this == LocationPermission.whileInUse.index) {
      return LocationPermission.whileInUse;
    } else if (this == LocationPermission.always.index) {
      return LocationPermission.always;
    } else {
      throw InvalidPermissionException(this);
    }
  }
}
