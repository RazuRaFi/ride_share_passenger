class RentCarDetails {
  final String id;
  final String vehicleType;
  final int totalSit;
  final String brandName;
  final String model;
  final String vehicleNumber;
  final OwnerCompanyId ownerCompanyId;
  final OwnerCompanyLocation ownerCompanyLocation;
  final String createdByRole;
  final int rentRate;
  final String rentTime;
  final String vehiclePic;
  final String vehicleColor;
  final String assignedUser;
  final bool isAssigned;
  final String createdAt;
  final String updatedAt;
  final int v;

  RentCarDetails({
    required this.id,
    required this.vehicleType,
    required this.totalSit,
    required this.brandName,
    required this.model,
    required this.vehicleNumber,
    required this.ownerCompanyId,
    required this.ownerCompanyLocation,
    required this.createdByRole,
    required this.rentRate,
    required this.rentTime,
    required this.vehiclePic,
    required this.vehicleColor,
    required this.assignedUser,
    required this.isAssigned,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory RentCarDetails.fromJson(Map<String, dynamic> json) {
    return RentCarDetails(
      id: json['_id'] ?? '',
      vehicleType: json['vehicle_type'] ?? '',
      totalSit: json['totalSit'] ?? 0,
      brandName: json['brandName'] ?? '',
      model: json['model'] ?? '',
      vehicleNumber: json['vehicle_number'] ?? '',
      ownerCompanyId: OwnerCompanyId.fromJson(json['ownerCompanyId'] ?? {}),
      ownerCompanyLocation: OwnerCompanyLocation.fromJson(json['ownerCompanyLocation'] ?? {}),
      createdByRole: json['createdByRole'] ?? '',
      rentRate: json['rentRate'] ?? 0,
      rentTime: json['rentTime'] ?? '',
      vehiclePic: json['vehicle_pic'] ?? '',
      vehicleColor: json['vehicle_color'] ?? '',
      assignedUser: json['assignedUser'] ?? '',
      isAssigned: json['isAssigned'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}

class OwnerCompanyId {
  final String id;
  final String phone;

  OwnerCompanyId({
    required this.id,
    required this.phone,
  });

  factory OwnerCompanyId.fromJson(Map<String, dynamic> json) {
    return OwnerCompanyId(
      id: json['_id'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}

class OwnerCompanyLocation {
  final String id;
  final String companyId;
  final List<AddressInfo> addressInfo;
  final String createdAt;
  final String updatedAt;
  final int v;

  OwnerCompanyLocation({
    required this.id,
    required this.companyId,
    required this.addressInfo,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory OwnerCompanyLocation.fromJson(Map<String, dynamic> json) {
    return OwnerCompanyLocation(
      id: json['_id'] ?? '',
      companyId: json['companyId'] ?? '',
      addressInfo: (json['addressInfo'] as List? ?? [])
          .map((e) => AddressInfo.fromJson(e))
          .toList(),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}

class AddressInfo {
  final Location location;
  final String address;

  AddressInfo({
    required this.location,
    required this.address,
  });

  factory AddressInfo.fromJson(Map<String, dynamic> json) {
    return AddressInfo(
      location: Location.fromJson(json['location'] ?? {}),
      address: json['address'] ?? '',
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'] ?? '',
      coordinates: (json['coordinates'] as List? ?? [0.0, 0.0])
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }
}
