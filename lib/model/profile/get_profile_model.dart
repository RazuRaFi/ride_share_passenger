class UserProfileModel {
  final String id;
  final String fullName;
  final String firstName;
  final String email;
  final String phone;
  final String profileImage;
  final String role;
  final String address;
  final String licenseNumber;
  final String gender;
  final bool userVerification;
  final bool isProfileComplete;
  final bool verifyIdentity;
  final bool isBlocked;
  final bool isDeleted;
  final bool termsAndConditions;
  final String createdAt;
  final String updatedAt;
  final Dob dob;
  final Profile profile;
  final Rating rating;

  UserProfileModel({
    this.id = '',
    this.fullName = '',
    this.firstName = '',
    this.email = '',
    this.phone = '',
    this.profileImage = '',
    this.role = '',
    this.address = '',
    this.licenseNumber = '',
    this.gender = '',
    this.userVerification = false,
    this.isProfileComplete = false,
    this.verifyIdentity = false,
    this.isBlocked = false,
    this.isDeleted = false,
    this.termsAndConditions = false,
    this.createdAt = '',
    this.updatedAt = '',
    this.dob = const Dob(),
    this.profile = const Profile(),
    this.rating = const Rating(),
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'] ?? {};
    return UserProfileModel(
      id: user['_id'] ?? '',
      fullName: user['fullName'] ?? '',
      firstName: user['firstName'] ?? '',
      email: user['email'] ?? '',
      phone: user['phone'] ?? '',
      profileImage: user['profileImage'] ?? '',
      role: user['role'] ?? '',
      address: user['address'] ?? '',
      licenseNumber: user['licenseNumber'] ?? '',
      gender: user['gender'] ?? '',
      userVerification: user['userVerification'] ?? false,
      isProfileComplete: user['isProfileComplete'] ?? false,
      verifyIdentity: user['verifyIdentity'] ?? false,
      isBlocked: user['isBlocked'] ?? false,
      isDeleted: user['isDeleted'] ?? false,
      termsAndConditions: user['termsAndConditions'] ?? false,
      createdAt: user['createdAt'] ?? '',
      updatedAt: user['updatedAt'] ?? '',
      dob: Dob.fromJson(user['dob'] ?? {}),
      profile: Profile.fromJson(user['profile'] ?? {}),
      rating: Rating.fromJson(json['rating'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "firstName": firstName,
    "email": email,
    "phone": phone,
    "profileImage": profileImage,
    "role": role,
    "address": address,
    "licenseNumber": licenseNumber,
    "gender": gender,
    "userVerification": userVerification,
    "isProfileComplete": isProfileComplete,
    "verifyIdentity": verifyIdentity,
    "isBlocked": isBlocked,
    "isDeleted": isDeleted,
    "termsAndConditions": termsAndConditions,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "dob": dob.toJson(),
    "profile": profile.toJson(),
    "rating": rating.toJson(),
  };
}

class Dob {
  final String day;
  final String month;
  final String year;

  const Dob({
    this.day = '',
    this.month = '',
    this.year = '',
  });

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
    day: json['day'] ?? '',
    month: json['month'] ?? '',
    year: json['year'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'day': day,
    'month': month,
    'year': year,
  };
}

class Profile {
  final String id;
  final String userId;
  final Address homeAddress;
  final Address workAddress;
  final Address currentAddress;
  final String createdAt;
  final String updatedAt;

  const Profile({
    this.id = '',
    this.userId = '',
    this.homeAddress = const Address(),
    this.workAddress = const Address(),
    this.currentAddress = const Address(),
    this.createdAt = '',
    this.updatedAt = '',
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json['_id'] ?? '',
    userId: json['user'] ?? '',
    homeAddress: Address.fromJson(json['homeAddress'] ?? {}),
    workAddress: Address.fromJson(json['workAddress'] ?? {}),
    currentAddress: Address.fromJson(json['currentAddress'] ?? {}),
    createdAt: json['createdAt'] ?? '',
    updatedAt: json['updatedAt'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'user': userId,
    'homeAddress': homeAddress.toJson(),
    'workAddress': workAddress.toJson(),
    'currentAddress': currentAddress.toJson(),
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

class Address {
  final String address;
  final List<double> coordinates;

  const Address({
    this.address = '',
    this.coordinates = const [0.0, 0.0],
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    final location = json['location'] ?? {};
    final coords = location['coordinates'] ?? [0.0, 0.0];
    return Address(
      address: json['address'] ?? '',
      coordinates: List<double>.from(coords.map((e) => e.toDouble())),
    );
  }

  Map<String, dynamic> toJson() => {
    'address': address,
    'location': {
      'type': 'Point',
      'coordinates': coordinates,
    }
  };
}

class Rating {
  final int totalRatings;
  final double averageRating;

  const Rating({
    this.totalRatings = 0,
    this.averageRating = 0.0,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    totalRatings: json['totalRatings'] ?? 0,
    averageRating: (json['averageRating'] ?? 0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'totalRatings': totalRatings,
    'averageRating': averageRating,
  };
}
