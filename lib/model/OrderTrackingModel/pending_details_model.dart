class PendingRideDetails {
  final Ride ride;
  final DriverInfo driverInfo;

  PendingRideDetails({
    this.ride = const Ride(),
    this.driverInfo = const DriverInfo(),
  });

  factory PendingRideDetails.fromJson(Map<String, dynamic> json) {
    return PendingRideDetails(
      ride: Ride.fromJson(json['ride']),
      driverInfo: DriverInfo.fromJson(json['driverInfo']),
    );
  }
}

class Ride {
  final String id;
  final User passengerId;
  final User driverId;
  final String vehicleType;
  final String status;
  final String ridePaymentMethod;
  final LocationInfo pickupLocation;
  final LocationInfo dropofLocation;
  final String startTime;
  final String endTime;
  final String rideTotalTime;
  final double payment;
  final double fare;
  final double distance;
  final double driverRating;
  final double passengerRating;
  final String pickupDate;
  final String pickupTime;
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

  const Ride({
    this.id = '',
    this.passengerId = const User(),
    this.driverId = const User(),
    this.vehicleType = '',
    this.status = '',
    this.ridePaymentMethod = '',
    this.pickupLocation = const LocationInfo(),
    this.dropofLocation = const LocationInfo(),
    this.startTime = '',
    this.endTime = '',
    this.rideTotalTime = '',
    this.payment = 0.0,
    this.fare = 0.0,
    this.distance = 0.0,
    this.driverRating = 0.0,
    this.passengerRating = 0.0,
    this.pickupDate = '',
    this.pickupTime = '',
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

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['_id'] ?? '',
      passengerId: User.fromJson(json['passengerId']),
      driverId: User.fromJson(json['driverId']),
      vehicleType: json['vehicle_type'] ?? '',
      status: json['status'] ?? '',
      ridePaymentMethod: json['ride_payment_method'] ?? '',
      pickupLocation: LocationInfo.fromJson(json['pickupLocation']),
      dropofLocation: LocationInfo.fromJson(json['dropofLocation']),
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      rideTotalTime: json['rideTotalTime'] ?? '',
      payment: (json['payment'] ?? 0).toDouble(),
      fare: (json['fare'] ?? 0).toDouble(),
      distance: (json['distance'] ?? 0).toDouble(),
      driverRating: (json['driverRating'] ?? 0).toDouble(),
      passengerRating: (json['passengerRating'] ?? 0).toDouble(),
      pickupDate: json['pickupDate'] ?? '',
      pickupTime: json['pickupTime'] ?? '',
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

class LocationInfo {
  final String address;
  final GeoLocation location;

  const LocationInfo({
    this.address = '',
    this.location = const GeoLocation(),
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      address: json['address'] ?? '',
      location: GeoLocation.fromJson(json['location'] ?? {}),
    );
  }
}

class GeoLocation {
  final String type;
  final List<double> coordinates;

  const GeoLocation({
    this.type = '',
    this.coordinates = const [0.0, 0.0],
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      type: json['type'] ?? '',
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
          [0.0, 0.0],
    );
  }
}

class DriverInfo {
  final Rating rating;
  final int totalRide;
  final String driverProfession;

  const DriverInfo({
    this.rating = const Rating(),
    this.totalRide = 0,
    this.driverProfession = '',
  });

  factory DriverInfo.fromJson(Map<String, dynamic> json) {
    return DriverInfo(
      rating: Rating.fromJson(json['rating'] ?? {}),
      totalRide: json['totalRide'] ?? 0,
      driverProfession: json['driverProfession'] ?? '',
    );
  }
}

class Rating {
  final int totalRatings;
  final double averageRating;

  const Rating({
    this.totalRatings = 0,
    this.averageRating = 0.0,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      totalRatings: json['totalRatings'] ?? 0,
      averageRating: (json['averageRating'] ?? 0).toDouble(),
    );
  }
}
