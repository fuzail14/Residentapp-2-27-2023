import 'dart:convert';
/// success : true
/// data : [{"id":4,"gatekeeperid":4,"subadminid":2,"gateno":"1","created_at":"2023-01-12T11:05:17.000000Z","updated_at":"2023-01-12T11:05:17.000000Z","firstname":"chacha","lastname":"g","cnic":"37705","address":"Attock","mobileno":"03215550979","password":"$2y$10$p8xrNg2UqFbulneP2Hy5ouCYWRs6D0ndO5qM1QRfpEGJ26rhe7u3u","roleid":4,"rolename":"gatekeeper","image":"1673503517.jpg","fcmtoken":null}]

ChatGatekeepers chatGatekeepersFromJson(String str) => ChatGatekeepers.fromJson(json.decode(str));
String chatGatekeepersToJson(ChatGatekeepers data) => json.encode(data.toJson());
class ChatGatekeepers {
  ChatGatekeepers({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  ChatGatekeepers.fromJson(dynamic json) {
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
ChatGatekeepers copyWith({  bool? success,
  List<Data>? data,
}) => ChatGatekeepers(  success: success ?? _success,
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

/// id : 4
/// gatekeeperid : 4
/// subadminid : 2
/// gateno : "1"
/// created_at : "2023-01-12T11:05:17.000000Z"
/// updated_at : "2023-01-12T11:05:17.000000Z"
/// firstname : "chacha"
/// lastname : "g"
/// cnic : "37705"
/// address : "Attock"
/// mobileno : "03215550979"
/// password : "$2y$10$p8xrNg2UqFbulneP2Hy5ouCYWRs6D0ndO5qM1QRfpEGJ26rhe7u3u"
/// roleid : 4
/// rolename : "gatekeeper"
/// image : "1673503517.jpg"
/// fcmtoken : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? gatekeeperid, 
      int? subadminid, 
      String? gateno, 
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
      dynamic fcmtoken,}){
    _id = id;
    _gatekeeperid = gatekeeperid;
    _subadminid = subadminid;
    _gateno = gateno;
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
    _gatekeeperid = json['gatekeeperid'];
    _subadminid = json['subadminid'];
    _gateno = json['gateno'];
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
  int? _gatekeeperid;
  int? _subadminid;
  String? _gateno;
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
  dynamic _fcmtoken;
Data copyWith({  int? id,
  int? gatekeeperid,
  int? subadminid,
  String? gateno,
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
  dynamic fcmtoken,
}) => Data(  id: id ?? _id,
  gatekeeperid: gatekeeperid ?? _gatekeeperid,
  subadminid: subadminid ?? _subadminid,
  gateno: gateno ?? _gateno,
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
  int? get gatekeeperid => _gatekeeperid;
  int? get subadminid => _subadminid;
  String? get gateno => _gateno;
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
  dynamic get fcmtoken => _fcmtoken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['gatekeeperid'] = _gatekeeperid;
    map['subadminid'] = _subadminid;
    map['gateno'] = _gateno;
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