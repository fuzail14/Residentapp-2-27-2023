/// success : true
/// data : [{"id":1,"gatekeeperid":14,"userid":13,"visitortype":"Guest","name":"hhhj","description":"ggh","cnic":"666","mobileno":"55","vechileno":"gv","arrivaldate":"2023-03-15","arrivaltime":"13:21:00","status":0,"statusdescription":"unapproved","created_at":"2023-03-15T08:21:23.000000Z","updated_at":"2023-03-15T08:21:23.000000Z"}]

class PreApproveEntry {
  PreApproveEntry({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  PreApproveEntry.fromJson(dynamic json) {
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
PreApproveEntry copyWith({  bool? success,
  List<Data>? data,
}) => PreApproveEntry(  success: success ?? _success,
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

/// id : 1
/// gatekeeperid : 14
/// userid : 13
/// visitortype : "Guest"
/// name : "hhhj"
/// description : "ggh"
/// cnic : "666"
/// mobileno : "55"
/// vechileno : "gv"
/// arrivaldate : "2023-03-15"
/// arrivaltime : "13:21:00"
/// status : 0
/// statusdescription : "unapproved"
/// created_at : "2023-03-15T08:21:23.000000Z"
/// updated_at : "2023-03-15T08:21:23.000000Z"

class Data {
  Data({
      num? id, 
      num? gatekeeperid, 
      num? userid, 
      String? visitortype, 
      String? name, 
      String? description, 
      String? cnic, 
      String? mobileno, 
      String? vechileno, 
      String? arrivaldate, 
      String? arrivaltime, 
      num? status, 
      String? statusdescription, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _gatekeeperid = gatekeeperid;
    _userid = userid;
    _visitortype = visitortype;
    _name = name;
    _description = description;
    _cnic = cnic;
    _mobileno = mobileno;
    _vechileno = vechileno;
    _arrivaldate = arrivaldate;
    _arrivaltime = arrivaltime;
    _status = status;
    _statusdescription = statusdescription;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _gatekeeperid = json['gatekeeperid'];
    _userid = json['userid'];
    _visitortype = json['visitortype'];
    _name = json['name'];
    _description = json['description'];
    _cnic = json['cnic'];
    _mobileno = json['mobileno'];
    _vechileno = json['vechileno'];
    _arrivaldate = json['arrivaldate'];
    _arrivaltime = json['arrivaltime'];
    _status = json['status'];
    _statusdescription = json['statusdescription'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _gatekeeperid;
  num? _userid;
  String? _visitortype;
  String? _name;
  String? _description;
  String? _cnic;
  String? _mobileno;
  String? _vechileno;
  String? _arrivaldate;
  String? _arrivaltime;
  num? _status;
  String? _statusdescription;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? gatekeeperid,
  num? userid,
  String? visitortype,
  String? name,
  String? description,
  String? cnic,
  String? mobileno,
  String? vechileno,
  String? arrivaldate,
  String? arrivaltime,
  num? status,
  String? statusdescription,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  gatekeeperid: gatekeeperid ?? _gatekeeperid,
  userid: userid ?? _userid,
  visitortype: visitortype ?? _visitortype,
  name: name ?? _name,
  description: description ?? _description,
  cnic: cnic ?? _cnic,
  mobileno: mobileno ?? _mobileno,
  vechileno: vechileno ?? _vechileno,
  arrivaldate: arrivaldate ?? _arrivaldate,
  arrivaltime: arrivaltime ?? _arrivaltime,
  status: status ?? _status,
  statusdescription: statusdescription ?? _statusdescription,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get gatekeeperid => _gatekeeperid;
  num? get userid => _userid;
  String? get visitortype => _visitortype;
  String? get name => _name;
  String? get description => _description;
  String? get cnic => _cnic;
  String? get mobileno => _mobileno;
  String? get vechileno => _vechileno;
  String? get arrivaldate => _arrivaldate;
  String? get arrivaltime => _arrivaltime;
  num? get status => _status;
  String? get statusdescription => _statusdescription;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['gatekeeperid'] = _gatekeeperid;
    map['userid'] = _userid;
    map['visitortype'] = _visitortype;
    map['name'] = _name;
    map['description'] = _description;
    map['cnic'] = _cnic;
    map['mobileno'] = _mobileno;
    map['vechileno'] = _vechileno;
    map['arrivaldate'] = _arrivaldate;
    map['arrivaltime'] = _arrivaltime;
    map['status'] = _status;
    map['statusdescription'] = _statusdescription;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}