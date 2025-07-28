class HistoryDetailsModel {
  final String id;
  final User passengerId;
  final User driverId;
  final String vehicleType;
  final String status;
  final String ridePaymentMethod;
  final Location pickupLocation;
  final Location dropofLocation;
  final String startTime;
  final String endTime;
  final String rideTotalTime;
  final Payment payment;
  final double fare;
  final double distance;
  final Rating driverRating;
  final Rating passengerRating;
  final String fullAddress;
  final bool roundTrip;
  final int timeInMilliseconds;
  final double safetyFee;
  final double discount;
  final double netFare;
  final bool isScheduled;
  final String createdAt;
  final String updatedAt;
  final int v;
  final double subTotal;

  HistoryDetailsModel({
    this.id = '',
    this.passengerId = const User(),
    this.driverId = const User(),
    this.vehicleType = '',
    this.status = '',
    this.ridePaymentMethod = '',
    this.pickupLocation = const Location(),
    this.dropofLocation = const Location(),
    this.startTime = '',
    this.endTime = '',
    this.rideTotalTime = '',
    this.payment = const Payment(),
    this.fare = 0.0,
    this.distance = 0.0,
    this.driverRating = const Rating(),
    this.passengerRating = const Rating(),
    this.fullAddress = '',
    this.roundTrip = false,
    this.timeInMilliseconds = 0,
    this.safetyFee = 0.0,
    this.discount = 0.0,
    this.netFare = 0.0,
    this.isScheduled = false,
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
    this.subTotal = 0.0,
  });

  factory HistoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return HistoryDetailsModel(
      id: json['_id'] ?? '',
      passengerId: User.fromJson(json['passengerId']),
      driverId: User.fromJson(json['driverId']),
      vehicleType: json['vehicle_type'] ?? '',
      status: json['status'] ?? '',
      ridePaymentMethod: json['ride_payment_method'] ?? '',
      pickupLocation: Location.fromJson(json['pickupLocation']),
      dropofLocation: Location.fromJson(json['dropofLocation']),
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      rideTotalTime: json['rideTotalTime'] ?? '',
      payment: Payment.fromJson(json['payment']),
      fare: (json['fare'] ?? 0).toDouble(),
      distance: (json['distance'] ?? 0).toDouble(),
      driverRating: Rating.fromJson(json['driverRating']),
      passengerRating: Rating.fromJson(json['passengerRating']),
      fullAddress: json['fullAddress'] ?? '',
      roundTrip: json['roundTrip'] ?? false,
      timeInMilliseconds: json['timeInMilliseconds'] ?? 0,
      safetyFee: (json['safetyFee'] ?? 0).toDouble(),
      discount: (json['discount'] ?? 0).toDouble(),
      netFare: (json['netFare'] ?? 0).toDouble(),
      isScheduled: json['isScheduled'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      subTotal: (json['subTotal'] ?? 0).toDouble(),
    );
  }
}

class User {
  final String id;
  final String fullName;
  final String profileImage;

  const User({
    this.id = '',
    this.fullName = '',
    this.profileImage = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}

class Location {
  final String address;
  final LocationPoint location;

  const Location({
    this.address = '',
    this.location = const LocationPoint(),
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'] ?? '',
      location: LocationPoint.fromJson(json['location']),
    );
  }
}

class LocationPoint {
  final String type;
  final List<double> coordinates;

  const LocationPoint({
    this.type = '',
    this.coordinates = const [0.0, 0.0],
  });

  factory LocationPoint.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const LocationPoint();
    return LocationPoint(
      type: json['type'] ?? '',
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
          [0.0, 0.0],
    );
  }
}

class Rating {
  final String id;
  final int rating;

  const Rating({
    this.id = '',
    this.rating = 0,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['_id'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }
}

class Payment {
  const Payment();

  factory Payment.fromJson(dynamic json) {
    return const Payment(); // Currently payment is null in the JSON
  }
}
