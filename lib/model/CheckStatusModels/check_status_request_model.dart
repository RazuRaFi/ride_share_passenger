
class CheckStatusRequestModel {
  String id;
  String passengerId;
  String driverId;
  String vehicleType;
  String status;
  String ridePaymentMethod;
  RideLocationModel pickupLocation;
  RideLocationModel dropofLocation;
  String startTime;
  String endTime;
  String dropOffTime;
  String rideTotalTime;
  dynamic payment;
  double fare;
  num discountPercentage;
  double distance;
  dynamic driverRating;
  dynamic passengerRating;
  String distanceText;
  int durationInSeconds;
  String fullAddress;
  bool roundTrip;
  int timeInMilliseconds;
  num safetyFee;
  num discount;
  num subTotal;
  num netFare;
  List<dynamic> messages;
  bool isScheduled;
  String pickupDate;
  String pickupTime;
  String createdAt;
  String updatedAt;

  CheckStatusRequestModel({
    this.id = '',
    this.passengerId = '',
    this.driverId = '',
    this.vehicleType = '',
    this.status = '',
    this.ridePaymentMethod = '',
    RideLocationModel? pickupLocation,
    RideLocationModel? dropofLocation,
    this.startTime = '',
    this.endTime = '',
    this.dropOffTime = '',
    this.rideTotalTime = '',
    this.payment,
    this.fare = 0.0,
    this.discountPercentage = 0,
    this.distance = 0.0,
    this.driverRating,
    this.passengerRating,
    this.distanceText = '',
    this.durationInSeconds = 0,
    this.fullAddress = '',
    this.roundTrip = false,
    this.timeInMilliseconds = 0,
    this.safetyFee = 0,
    this.discount = 0,
    this.subTotal = 0,
    this.netFare = 0,
    this.messages = const [],
    this.isScheduled = false,
    this.pickupDate = '',
    this.pickupTime = '',
    this.createdAt = '',
    this.updatedAt = '',
  })  : pickupLocation = pickupLocation ?? RideLocationModel(),
        dropofLocation = dropofLocation ?? RideLocationModel();

  factory CheckStatusRequestModel.fromJson(Map<String, dynamic> json) {
    return CheckStatusRequestModel(
      id: json['_id'] ?? '',
      passengerId: json['passengerId'] ?? '',
      driverId: json['driverId'] ?? '',
      vehicleType: json['vehicle_type'] ?? '',
      status: json['status'] ?? '',
      ridePaymentMethod: json['ride_payment_method'] ?? '',
      pickupLocation:
      RideLocationModel.fromJson(json['pickupLocation'] ?? {}),
      dropofLocation:
      RideLocationModel.fromJson(json['dropofLocation'] ?? {}),
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      dropOffTime: json['dropOffTime'] ?? '',
      rideTotalTime: json['rideTotalTime'] ?? '',
      payment: json['payment'],
      fare: (json['fare'] ?? 0).toDouble(),
      discountPercentage: json['discountPercentage'] ?? 0,
      distance: (json['distance'] ?? 0).toDouble(),
      driverRating: json['driverRating'],
      passengerRating: json['passengerRating'],
      distanceText: json['distanceText'] ?? '',
      durationInSeconds: json['durationInSeconds'] ?? 0,
      fullAddress: json['fullAddress'] ?? '',
      roundTrip: json['roundTrip'] ?? false,
      timeInMilliseconds: json['timeInMilliseconds'] ?? 0,
      safetyFee: json['safetyFee'] ?? 0,
      discount: json['discount'] ?? 0,
      subTotal: json['subTotal'] ?? 0,
      netFare: json['netFare'] ?? 0,
      messages: json['messages'] ?? [],
      isScheduled: json['isScheduled'] ?? false,
      pickupDate: json['pickupDate'] ?? '',
      pickupTime: json['pickupTime'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'passengerId': passengerId,
      'driverId': driverId,
      'vehicle_type': vehicleType,
      'status': status,
      'ride_payment_method': ridePaymentMethod,
      'pickupLocation': pickupLocation.toJson(),
      'dropofLocation': dropofLocation.toJson(),
      'startTime': startTime,
      'endTime': endTime,
      'dropOffTime': dropOffTime,
      'rideTotalTime': rideTotalTime,
      'payment': payment,
      'fare': fare,
      'discountPercentage': discountPercentage,
      'distance': distance,
      'driverRating': driverRating,
      'passengerRating': passengerRating,
      'distanceText': distanceText,
      'durationInSeconds': durationInSeconds,
      'fullAddress': fullAddress,
      'roundTrip': roundTrip,
      'timeInMilliseconds': timeInMilliseconds,
      'safetyFee': safetyFee,
      'discount': discount,
      'subTotal': subTotal,
      'netFare': netFare,
      'messages': messages,
      'isScheduled': isScheduled,
      'pickupDate': pickupDate,
      'pickupTime': pickupTime,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class RideLocationModel {
  CoordinatesModel location;
  String address;

  RideLocationModel({
    CoordinatesModel? location,
    this.address = '',
  }) : location = location ?? CoordinatesModel();

  factory RideLocationModel.fromJson(Map<String, dynamic> json) {
    return RideLocationModel(
      location: CoordinatesModel.fromJson(json['location'] ?? {}),
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      'address': address,
    };
  }
}

class CoordinatesModel {
  String type;
  List<double> coordinates;

  CoordinatesModel({
    this.type = 'Point',
    this.coordinates = const [],
  });

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      type: json['type'] ?? 'Point',
      coordinates: (json['coordinates'] != null)
          ? List<double>.from(
        (json['coordinates'] as List).map((e) {
          if (e is num) return e.toDouble();
          if (e is String) return double.tryParse(e) ?? 0.0;
          return 0.0;
        }),
      )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}
