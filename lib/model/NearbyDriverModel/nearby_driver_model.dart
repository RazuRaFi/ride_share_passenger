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
    double parseDouble(dynamic value) {
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return NearbyDriversModel(
      userId: json['userId'] ?? '',
      latitude: parseDouble(json['latitude']),
      longitude: parseDouble(json['longitude']),
      vehicleType: json['vehicle_type'] ?? '',
      distanceInMeters: json['distanceInMeters'] ?? 0,
      totalSit: json['totalSit'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'latitude': latitude,
      'longitude': longitude,
      'vehicle_type': vehicleType,
      'distanceInMeters': distanceInMeters,
      'totalSit': totalSit,
    };
  }
}

