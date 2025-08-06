
class LoginProfileModel {
  UserModel user;
  String accessToken;
  String refreshToken;

  LoginProfileModel({
    UserModel? user,
    this.accessToken = '',
    this.refreshToken = '',
  }) : user = user ?? UserModel();

  factory LoginProfileModel.fromJson(Map<dynamic, dynamic> json) {
    return LoginProfileModel(
      user: json['user'] != null ? UserModel.fromJson(json['user']) : UserModel(),
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}

class UserModel {
  String id;
  String fullName;
  String email;
  String phone;
  String profileImage;
  String profile;
  String? driver;
  String role;
  String? category;
  String address;
  String gender;
  String licenseNumber;
  String? stripeCustomerId;
  bool userVerification;
  bool isProfileComplete;
  bool verifyIdentity;
  String? ownerCompanyId;
  String createdByRole;
  bool isBlocked;
  bool isDeleted;
  bool termsAndConditions;
  String createdAt;
  String updatedAt;
  int v;
  DobModel dob;
  bool isVerified;

  UserModel({
    this.id = '',
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.profileImage = '',
    this.profile = '',
    this.driver,
    this.role = '',
    this.category,
    this.address = '',
    this.gender = '',
    this.licenseNumber = '',
    this.stripeCustomerId,
    this.userVerification = false,
    this.isProfileComplete = false,
    this.verifyIdentity = false,
    this.ownerCompanyId,
    this.createdByRole = '',
    this.isBlocked = false,
    this.isDeleted = false,
    this.termsAndConditions = false,
    this.createdAt = '',
    this.updatedAt = '',
    this.v = 0,
    DobModel? dob,
    this.isVerified = false,
  }) : dob = dob ?? DobModel();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profileImage'] ?? '',
      profile: json['profile'] ?? '',
      driver: json['driver'],
      role: json['role'] ?? '',
      category: json['category'],
      address: json['address'] ?? '',
      gender: json['gender'] ?? '',
      licenseNumber: json['licenseNumber'] ?? '',
      stripeCustomerId: json['stripeCustomerId'],
      userVerification: json['userVerification'] ?? false,
      isProfileComplete: json['isProfileComplete'] ?? false,
      verifyIdentity: json['verifyIdentity'] ?? false,
      ownerCompanyId: json['ownerCompanyId'],
      createdByRole: json['createdByRole'] ?? '',
      isBlocked: json['isBlocked'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      termsAndConditions: json['termsAndConditions'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      dob: json['dob'] != null ? DobModel.fromJson(json['dob']) : DobModel(),
      isVerified: json['isVerified'] ?? false,
    );
  }
}

class DobModel {
  String day;
  String month;
  String year;

  DobModel({
    this.day = '',
    this.month = '',
    this.year = '',
  });

  factory DobModel.fromJson(Map<String, dynamic> json) {
    return DobModel(
      day: json['day'] ?? '',
      month: json['month'] ?? '',
      year: json['year'] ?? '',
    );
  }
}
