class NearbyDriversModel {
  String userId;
  double latitude;
  double longitude;
  String vehicleType;
  num distanceInMeters;
  int totalSit;

  NearbyDriversModel({
    this.userId = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.vehicleType = '',
    this.distanceInMeters = 0,
    this.totalSit = 0,
  });

  factory NearbyDriversModel.fromJson(Map<String, dynamic> json) {
    return NearbyDriversModel(
      userId: json['userId'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      vehicleType: json['vehicle_type'] ?? '',
      distanceInMeters: json['distanceInMeters'] ?? 0,
      totalSit: json['totalSit'] ?? 0,
    );
  }
}

