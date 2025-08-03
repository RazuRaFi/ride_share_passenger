class RentCarModel {
  final List<VehicleData> vehicleData;
  final Meta meta;

  RentCarModel({
    required this.vehicleData,
    required this.meta,
  });

  factory RentCarModel.fromJson(Map<String, dynamic> json) {
    return RentCarModel(
      vehicleData: json['vehicleData'] != null
          ? List<VehicleData>.from(
          (json['vehicleData'] as List).map((e) => VehicleData.fromJson(e)))
          : [],
      meta: json['meta'] != null
          ? Meta.fromJson(json['meta'])
          : Meta(page: 1, limit: 10, total: 0, totalPage: 1),
    );
  }
}

class VehicleData {
  final String id;
  final String vehicleType;
  final int totalSit;
  final String brandName;
  final String model;
  final String vehicleNumber;
  final String ownerCompanyId;
  final String ownerCompanyLocation;
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

  VehicleData({
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

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
      id: json['_id'] ?? '',
      vehicleType: json['vehicle_type'] ?? '',
      totalSit: json['totalSit'] ?? 0,
      brandName: json['brandName'] ?? '',
      model: json['model'] ?? '',
      vehicleNumber: json['vehicle_number'] ?? '',
      ownerCompanyId: json['ownerCompanyId'] ?? '',
      ownerCompanyLocation: json['ownerCompanyLocation'] ?? '',
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

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
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
