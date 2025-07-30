class RideModel {
  final String id;
  final String passengerId;
  final Driver driver;
  final String vehicleType;
  final String status;
  final String ridePaymentMethod;
  final LocationInfo pickupLocation;
  final LocationInfo dropofLocation;
  final String startTime;  // replaced null with empty string default
  final String endTime;    // replaced null with empty string default
  final String rideTotalTime;
  final String payment;    // replaced null with empty string default
  final double fare;
  final double distance;
  final String driverRating;    // replaced null with empty string default
  final String passengerRating; // replaced null with empty string default
  final String fullAddress;
  final bool roundTrip;
  final int timeInMilliseconds;
  final double safetyFee;
  final double discount;
  final double subTotal;
  final double netFare;
  final List<MessageModel> messages;
  final bool isScheduled;
  final String createdAt;
  final String updatedAt;
  final int v;

  RideModel({
    this.id = '',
    this.passengerId = '',
    this.driver = const Driver(),
    this.vehicleType = '',
    this.status = '',
    this.ridePaymentMethod = '',
    this.pickupLocation = const LocationInfo(),
    this.dropofLocation = const LocationInfo(),
    this.startTime = '',
    this.endTime = '',
    this.rideTotalTime = '',
    this.payment = '',
    this.fare = 0,
    this.distance = 0,
    this.driverRating = '',
    this.passengerRating = '',
    this.fullAddress = '',
    this.roundTrip = false,
    this.timeInMilliseconds = 0,
    this.safetyFee = 0,
    this.discount = 0,
    this.subTotal = 0,
    this.netFare = 0,
    this.messages = const [],
    this.isScheduled = false,
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
  });

  factory RideModel.fromJson(Map<String, dynamic> json) {
    return RideModel(
      id: json["_id"] ?? '',
      passengerId: json["passengerId"] ?? '',
      driver: Driver.fromJson(json["driverId"] ?? {}),
      vehicleType: json["vehicle_type"] ?? '',
      status: json["status"] ?? '',
      ridePaymentMethod: json["ride_payment_method"] ?? '',
      pickupLocation: LocationInfo.fromJson(json["pickupLocation"] ?? {}),
      dropofLocation: LocationInfo.fromJson(json["dropofLocation"] ?? {}),
      startTime: (json["startTime"] ?? '') is String
          ? json["startTime"] ?? ''
          : '', // safeguard for null or unexpected type
      endTime: (json["endTime"] ?? '') is String ? json["endTime"] ?? '' : '',
      rideTotalTime: json["rideTotalTime"] ?? '',
      payment: (json["payment"]?.toString() ?? ''),
      fare: (json["fare"] ?? 0).toDouble(),
      distance: (json["distance"] ?? 0).toDouble(),
      driverRating: (json["driverRating"]?.toString() ?? ''),
      passengerRating: (json["passengerRating"]?.toString() ?? ''),
      fullAddress: json["fullAddress"] ?? '',
      roundTrip: json["roundTrip"] ?? false,
      timeInMilliseconds: json["timeInMilliseconds"] ?? 0,
      safetyFee: (json["safetyFee"] ?? 0).toDouble(),
      discount: (json["discount"] ?? 0).toDouble(),
      subTotal: (json["subTotal"] ?? 0).toDouble(),
      netFare: (json["netFare"] ?? 0).toDouble(),
      messages: (json["messages"] as List<dynamic>? ?? [])
          .map((e) => MessageModel.fromJson(e))
          .toList(),
      isScheduled: json["isScheduled"] ?? false,
      createdAt: json["createdAt"] ?? '',
      updatedAt: json["updatedAt"] ?? '',
      v: json["__v"] ?? 0,
    );
  }
}

class Driver {
  final String id;
  final String fullName;
  final String profileImage;

  const Driver({
    this.id = '',
    this.fullName = '',
    this.profileImage = '',
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json["_id"] ?? '',
      fullName: json["fullName"] ?? '',
      profileImage: json["profileImage"] ?? '',
    );
  }
}

class LocationInfo {
  final GeoLocation location;
  final String address;

  const LocationInfo({
    this.location = const GeoLocation(),
    this.address = '',
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      location: GeoLocation.fromJson(json["location"] ?? {}),
      address: json["address"] ?? '',
    );
  }
}

class GeoLocation {
  final String type;
  final List<double> coordinates;

  const GeoLocation({
    this.type = '',
    this.coordinates = const [],
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      type: json["type"] ?? '',
      coordinates: (json["coordinates"] as List<dynamic>? ?? [])
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }
}

class MessageModel {
  final String sender;
  final String text;
  final String createdAt;
  final List<dynamic> seenBy;

  const MessageModel({
    this.sender = '',
    this.text = '',
    this.createdAt = '',
    this.seenBy = const [],
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sender: json["sender"] ?? '',
      text: json["text"] ?? '',
      createdAt: json["createdAt"] ?? '',
      seenBy: json["seenBy"] ?? [],
    );
  }
}
