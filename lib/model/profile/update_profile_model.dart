class UpdateProfileModel {
  final String? id;
  final String? fullName;
  final String? firstName;
  final String? email;
  final String? phone;
  final String? profileImage;
  final String? profile;
  final String? role;
  final String? address;
  final String? dob;
  final String? licenseNumber;
  final bool? userVerification;
  final bool? isProfileComplete;
  final bool? verifyIdentity;
  final bool? isBlocked;
  final bool? isDeleted;
  final bool? termsAndConditions;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? gender;

  UpdateProfileModel({
    this.id,
    this.fullName,
    this.firstName,
    this.email,
    this.phone,
    this.profileImage,
    this.profile,
    this.role,
    this.address,
    this.dob,
    this.licenseNumber,
    this.userVerification,
    this.isProfileComplete,
    this.verifyIdentity,
    this.isBlocked,
    this.isDeleted,
    this.termsAndConditions,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.gender,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      id: json['_id'],
      fullName: json['fullName'],
      firstName: json['firstName'],
      email: json['email'],
      phone: json['phone'],
      profileImage: json['profileImage'],
      profile: json['profile'],
      role: json['role'],
      address: json['address'],
      dob: json['dob'],
      licenseNumber: json['licenseNumber'],
      userVerification: json['userVerification'],
      isProfileComplete: json['isProfileComplete'],
      verifyIdentity: json['verifyIdentity'],
      isBlocked: json['isBlocked'],
      isDeleted: json['isDeleted'],
      termsAndConditions: json['termsAndConditions'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      gender: json['gender'],
    );
  }
}
