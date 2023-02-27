import 'dart:convert';
/// success : true
/// data : [{"id":3,"residentid":3,"subadminid":2,"country":"🇵🇰    Pakistan","state":"Punjab","city":"Rawalpindi","societyname":"Rawat Enlcave","phasename":"Phase 2","blockname":"Block 1","streetname":"Street 1","houseid":39,"houseaddress":"House no 1","vechileno":"","residenttype":"Owner","propertytype":"House","committeemember":0,"status":1,"created_at":"2023-01-12T10:58:46.000000Z","updated_at":"2023-01-14T06:35:58.000000Z","firstname":"haadi","lastname":"ibrar","cnic":"37605","address":"House no 1","mobileno":"03215550979","password":"$2y$10$.X3KHUaBNPUSipJ6CBwXsO.Z0RunDsaDqbx25Nb3SkSjnsTpNBT7e","roleid":3,"rolename":"resident","image":"1673503126.jpg","fcmtoken":"d5Nm3RymTG6s8nWthDcPQw:APA91bHgcRSniM_wzn7wx3T5RI_W7D_deCEuEqsBcPEzfNw00_oC0MFrWkHaM16fjS-dbT7jHkIcTlzp8fECE4-uL9XADFKG4Nm4YpXqji3g4f74rg-RXNE22T3kr254oQOkdRvtH5pf"}]

ChatNeighbours chatNeighboursFromJson(String str) => ChatNeighbours.fromJson(json.decode(str));
String chatNeighboursToJson(ChatNeighbours data) => json.encode(data.toJson());
class ChatNeighbours {
  ChatNeighbours({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  ChatNeighbours.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Data>? _data;
ChatNeighbours copyWith({  bool? success,
  List<Data>? data,
}) => ChatNeighbours(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// residentid : 3
/// subadminid : 2
/// country : "🇵🇰    Pakistan"
/// state : "Punjab"
/// city : "Rawalpindi"
/// societyname : "Rawat Enlcave"
/// phasename : "Phase 2"
/// blockname : "Block 1"
/// streetname : "Street 1"
/// houseid : 39
/// houseaddress : "House no 1"
/// vechileno : ""
/// residenttype : "Owner"
/// propertytype : "House"
/// committeemember : 0
/// status : 1
/// created_at : "2023-01-12T10:58:46.000000Z"
/// updated_at : "2023-01-14T06:35:58.000000Z"
/// firstname : "haadi"
/// lastname : "ibrar"
/// cnic : "37605"
/// address : "House no 1"
/// mobileno : "03215550979"
/// password : "$2y$10$.X3KHUaBNPUSipJ6CBwXsO.Z0RunDsaDqbx25Nb3SkSjnsTpNBT7e"
/// roleid : 3
/// rolename : "resident"
/// image : "1673503126.jpg"
/// fcmtoken : "d5Nm3RymTG6s8nWthDcPQw:APA91bHgcRSniM_wzn7wx3T5RI_W7D_deCEuEqsBcPEzfNw00_oC0MFrWkHaM16fjS-dbT7jHkIcTlzp8fECE4-uL9XADFKG4Nm4YpXqji3g4f74rg-RXNE22T3kr254oQOkdRvtH5pf"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? residentid, 
      int? subadminid, 
      String? country, 
      String? state, 
      String? city, 
      String? societyname, 
      String? phasename, 
      String? blockname, 
      String? streetname, 
      int? houseid, 
      String? houseaddress, 
      String? vechileno, 
      String? residenttype, 
      String? propertytype, 
      int? committeemember, 
      int? status, 
      String? createdAt, 
      String? updatedAt, 
      String? firstname, 
      String? lastname, 
      String? cnic, 
      String? address, 
      String? mobileno, 
      String? password, 
      int? roleid, 
      String? rolename, 
      String? image, 
      String? fcmtoken,}){
    _id = id;
    _residentid = residentid;
    _subadminid = subadminid;
    _country = country;
    _state = state;
    _city = city;
    _societyname = societyname;
    _phasename = phasename;
    _blockname = blockname;
    _streetname = streetname;
    _houseid = houseid;
    _houseaddress = houseaddress;
    _vechileno = vechileno;
    _residenttype = residenttype;
    _propertytype = propertytype;
    _committeemember = committeemember;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _firstname = firstname;
    _lastname = lastname;
    _cnic = cnic;
    _address = address;
    _mobileno = mobileno;
    _password = password;
    _roleid = roleid;
    _rolename = rolename;
    _image = image;
    _fcmtoken = fcmtoken;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _residentid = json['residentid'];
    _subadminid = json['subadminid'];
    _country = json['country'];
    _state = json['state'];
    _city = json['city'];
    _societyname = json['societyname'];
    _phasename = json['phasename'];
    _blockname = json['blockname'];
    _streetname = json['streetname'];
    _houseid = json['houseid'];
    _houseaddress = json['houseaddress'];
    _vechileno = json['vechileno'];
    _residenttype = json['residenttype'];
    _propertytype = json['propertytype'];
    _committeemember = json['committeemember'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _cnic = json['cnic'];
    _address = json['address'];
    _mobileno = json['mobileno'];
    _password = json['password'];
    _roleid = json['roleid'];
    _rolename = json['rolename'];
    _image = json['image'];
    _fcmtoken = json['fcmtoken'];
  }
  int? _id;
  int? _residentid;
  int? _subadminid;
  String? _country;
  String? _state;
  String? _city;
  String? _societyname;
  String? _phasename;
  String? _blockname;
  String? _streetname;
  int? _houseid;
  String? _houseaddress;
  String? _vechileno;
  String? _residenttype;
  String? _propertytype;
  int? _committeemember;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _firstname;
  String? _lastname;
  String? _cnic;
  String? _address;
  String? _mobileno;
  String? _password;
  int? _roleid;
  String? _rolename;
  String? _image;
  String? _fcmtoken;
Data copyWith({  int? id,
  int? residentid,
  int? subadminid,
  String? country,
  String? state,
  String? city,
  String? societyname,
  String? phasename,
  String? blockname,
  String? streetname,
  int? houseid,
  String? houseaddress,
  String? vechileno,
  String? residenttype,
  String? propertytype,
  int? committeemember,
  int? status,
  String? createdAt,
  String? updatedAt,
  String? firstname,
  String? lastname,
  String? cnic,
  String? address,
  String? mobileno,
  String? password,
  int? roleid,
  String? rolename,
  String? image,
  String? fcmtoken,
}) => Data(  id: id ?? _id,
  residentid: residentid ?? _residentid,
  subadminid: subadminid ?? _subadminid,
  country: country ?? _country,
  state: state ?? _state,
  city: city ?? _city,
  societyname: societyname ?? _societyname,
  phasename: phasename ?? _phasename,
  blockname: blockname ?? _blockname,
  streetname: streetname ?? _streetname,
  houseid: houseid ?? _houseid,
  houseaddress: houseaddress ?? _houseaddress,
  vechileno: vechileno ?? _vechileno,
  residenttype: residenttype ?? _residenttype,
  propertytype: propertytype ?? _propertytype,
  committeemember: committeemember ?? _committeemember,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  cnic: cnic ?? _cnic,
  address: address ?? _address,
  mobileno: mobileno ?? _mobileno,
  password: password ?? _password,
  roleid: roleid ?? _roleid,
  rolename: rolename ?? _rolename,
  image: image ?? _image,
  fcmtoken: fcmtoken ?? _fcmtoken,
);
  int? get id => _id;
  int? get residentid => _residentid;
  int? get subadminid => _subadminid;
  String? get country => _country;
  String? get state => _state;
  String? get city => _city;
  String? get societyname => _societyname;
  String? get phasename => _phasename;
  String? get blockname => _blockname;
  String? get streetname => _streetname;
  int? get houseid => _houseid;
  String? get houseaddress => _houseaddress;
  String? get vechileno => _vechileno;
  String? get residenttype => _residenttype;
  String? get propertytype => _propertytype;
  int? get committeemember => _committeemember;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get cnic => _cnic;
  String? get address => _address;
  String? get mobileno => _mobileno;
  String? get password => _password;
  int? get roleid => _roleid;
  String? get rolename => _rolename;
  String? get image => _image;
  String? get fcmtoken => _fcmtoken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['residentid'] = _residentid;
    map['subadminid'] = _subadminid;
    map['country'] = _country;
    map['state'] = _state;
    map['city'] = _city;
    map['societyname'] = _societyname;
    map['phasename'] = _phasename;
    map['blockname'] = _blockname;
    map['streetname'] = _streetname;
    map['houseid'] = _houseid;
    map['houseaddress'] = _houseaddress;
    map['vechileno'] = _vechileno;
    map['residenttype'] = _residenttype;
    map['propertytype'] = _propertytype;
    map['committeemember'] = _committeemember;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['cnic'] = _cnic;
    map['address'] = _address;
    map['mobileno'] = _mobileno;
    map['password'] = _password;
    map['roleid'] = _roleid;
    map['rolename'] = _rolename;
    map['image'] = _image;
    map['fcmtoken'] = _fcmtoken;
    return map;
  }

}