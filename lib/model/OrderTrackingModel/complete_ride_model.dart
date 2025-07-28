class CompleteRideModel {
  final List<Ride> ride;
  final Meta meta;

  CompleteRideModel({
    this.ride = const [],
    this.meta = const Meta(),
  });

  factory CompleteRideModel.fromJson(Map<String, dynamic> json) {
    return CompleteRideModel(
      ride: (json['ride'] as List).map((e) => Ride.fromJson(e)).toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Ride {
  final String id;
  final Driver driverId;
  final Location pickupLocation;
  final Location dropofLocation;
  final String endTime;
  final DriverRating driverRating;
  final double netFare;

  Ride({
    this.id = '',
    this.driverId = const Driver(),
    this.pickupLocation = const Location(),
    this.dropofLocation = const Location(),
    this.endTime = '',
    this.driverRating = const DriverRating(),
    this.netFare = 0.0,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['_id'] ?? '',
      driverId: Driver.fromJson(json['driverId']),
      pickupLocation: Location.fromJson(json['pickupLocation']),
      dropofLocation: Location.fromJson(json['dropofLocation']),
      endTime: json['endTime'] ?? '',
      driverRating: DriverRating.fromJson(json['driverRating']),
      netFare: (json['netFare'] as num).toDouble(),
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
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}

class Location {
  final String address;

  const Location({this.address = ''});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'] ?? '',
    );
  }
}

class DriverRating {
  final String id;
  final int rating;

  const DriverRating({
    this.id = '',
    this.rating = 0,
  });

  factory DriverRating.fromJson(Map<String, dynamic> json) {
    return DriverRating(
      id: json['_id'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }
}

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  const Meta({
    this.page = 1,
    this.limit = 10,
    this.total = 0,
    this.totalPage = 1,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
      total: json['total'] ?? 0,
      totalPage: json['totalPage'] ?? 1,
    );
  }
}
