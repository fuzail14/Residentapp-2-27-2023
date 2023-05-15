class Residents {
  int? id;
  int? residentid;
  int? subadminid;
  int? superadminid;
  int? societyid;
  String? country;
  String? state;
  String? city;

  String? houseaddress;
  String? vechileno;
  String? residenttype;
  String? propertytype;
  int? committeemember;
  int? status;
  String? createdAt;
  String? updatedAt;

  Residents({
    required this.id,
    required this.residentid,
    required this.subadminid,
    required this.superadminid,
    required this.societyid,
    
    required this.country,
    required this.state,
    required this.city,
    required this.houseaddress,
    required this.vechileno,
    required this.residenttype,
    required this.propertytype,
    required this.committeemember,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
