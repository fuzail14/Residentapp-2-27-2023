class MarketPlace {
  MarketPlace({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;

  MarketPlace.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.residentid,
    required this.societyid,
    required this.subadminid,
    required this.productname,
    required this.description,
    required this.productprice,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.resident,
    required this.residentdata,
  });
  late final int id;
  late final int residentid;
  late final int societyid;
  late final int subadminid;
  late final String productname;
  late final String description;
  late final String productprice;
  late final String images;
  late final String createdAt;
  late final String updatedAt;
  late final List<Resident> resident;
  late final List<Residentdata> residentdata;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    residentid = json['residentid'];
    societyid = json['societyid'];
    subadminid = json['subadminid'];
    productname = json['productname'];
    description = json['description'];
    productprice = json['productprice'];
    images = json['images'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    resident =
        List.from(json['resident']).map((e) => Resident.fromJson(e)).toList();
    residentdata = List.from(json['residentdata'])
        .map((e) => Residentdata.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['residentid'] = residentid;
    _data['societyid'] = societyid;
    _data['subadminid'] = subadminid;
    _data['productname'] = productname;
    _data['description'] = description;
    _data['productprice'] = productprice;
    _data['images'] = images;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['resident'] = resident.map((e) => e.toJson()).toList();
    _data['residentdata'] = residentdata.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Resident {
  Resident({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.cnic,
    required this.address,
    required this.mobileno,
    required this.password,
    required this.roleid,
    required this.rolename,
    required this.image,
    this.fcmtoken,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String firstname;
  late final String lastname;
  late final String cnic;
  late final String address;
  late final String mobileno;
  late final String password;
  late final int roleid;
  late final String rolename;
  late final String image;
  late final Null fcmtoken;
  late final String createdAt;
  late final String updatedAt;

  Resident.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    cnic = json['cnic'];
    address = json['address'];
    mobileno = json['mobileno'];
    password = json['password'];
    roleid = json['roleid'];
    rolename = json['rolename'];
    image = json['image'];
    fcmtoken = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    _data['cnic'] = cnic;
    _data['address'] = address;
    _data['mobileno'] = mobileno;
    _data['password'] = password;
    _data['roleid'] = roleid;
    _data['rolename'] = rolename;
    _data['image'] = image;
    _data['fcmtoken'] = fcmtoken;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Residentdata {
  Residentdata({
    required this.id,
    required this.residentid,
    required this.subadminid,
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
  late final int id;
  late final int residentid;
  late final int subadminid;
  late final String country;
  late final String state;
  late final String city;
  late final String houseaddress;
  late final String vechileno;
  late final String residenttype;
  late final String propertytype;
  late final int committeemember;
  late final int status;
  late final String createdAt;
  late final String updatedAt;

  Residentdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    residentid = json['residentid'];
    subadminid = json['subadminid'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    houseaddress = json['houseaddress'];
    vechileno = json['vechileno'];
    residenttype = json['residenttype'];
    propertytype = json['propertytype'];
    committeemember = json['committeemember'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['residentid'] = residentid;
    _data['subadminid'] = subadminid;
    _data['country'] = country;
    _data['state'] = state;
    _data['city'] = city;
    _data['houseaddress'] = houseaddress;
    _data['vechileno'] = vechileno;
    _data['residenttype'] = residenttype;
    _data['propertytype'] = propertytype;
    _data['committeemember'] = committeemember;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
