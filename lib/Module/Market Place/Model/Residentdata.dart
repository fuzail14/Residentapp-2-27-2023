class ResidentData {
  final int id;
  final int residentId;
  final int subadminId;
  final String country;
  final String state;
  final String city;
  final String houseAddress;
  final String vehicleNo;
  final String residentType;
  final String propertyType;
  final int committeeMember;
  final int status;
  final String createdAt;
  final String updatedAt;

  ResidentData({
    required this.id,
    required this.residentId,
    required this.subadminId,
    required this.country,
    required this.state,
    required this.city,
    required this.houseAddress,
    required this.vehicleNo,
    required this.residentType,
    required this.propertyType,
    required this.committeeMember,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ResidentData.fromJson(Map<String, dynamic> json) {
    return ResidentData(
      id: json['id'],
      residentId: json['residentid'],
      subadminId: json['subadminid'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      houseAddress: json['houseaddress'],
      vehicleNo: json['vechileno'],
      residentType: json['residenttype'],
      propertyType: json['propertytype'],
      committeeMember: json['committeemember'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
