
class EstimatePricingModel {
  num distanceInMeters;
  double distanceInKm;
  List<EstimateDetail> estimates;

  EstimatePricingModel({
    this.distanceInMeters = 0,
    this.distanceInKm = 0.0,
    List<EstimateDetail>? estimates,
  }) : estimates = estimates ?? [];

  factory EstimatePricingModel.fromJson(Map<String, dynamic> json) {
    return EstimatePricingModel(
      distanceInMeters: json['distanceInMeters'] ?? 0,
      distanceInKm: (json['distanceInKm'] ?? 0).toDouble(),
      estimates: (json['estimates'] as List<dynamic>?)
          ?.map((e) => EstimateDetail.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class EstimateDetail {
  String vehicleType;
  int totalSit;
  double price;
  num durationInSeconds;
  String distanceInMi;
  String durationInMin;

  EstimateDetail({
    this.vehicleType = '',
    this.totalSit = 0,
    this.price = 0.0,
    this.durationInSeconds = 0,
    this.distanceInMi = '',
    this.durationInMin = ''
  });

  factory EstimateDetail.fromJson(Map<String, dynamic> json) {
    return EstimateDetail(
      vehicleType: json['vehicle_type'] ?? '',
      totalSit: json['totalSit'] ?? 0,
      price: (json['fare'] ?? 0).toDouble(),
      durationInSeconds: json['durationInSeconds'] ?? 0,
      distanceInMi: json['distanceText'] ?? '',
      durationInMin: json['durationText'] ?? ''
    );
  }
}
