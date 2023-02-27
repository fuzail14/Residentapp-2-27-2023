import 'dart:convert';
/// data : {"id":1,"loginuserid":4,"created_at":"2023-01-22T06:58:33.000000Z","updated_at":"2023-01-22T06:58:33.000000Z"}
/// success : true

ChatRoomModel chatRoomModelFromJson(String str) => ChatRoomModel.fromJson(json.decode(str));
String chatRoomModelToJson(ChatRoomModel data) => json.encode(data.toJson());
class ChatRoomModel {
  ChatRoomModel({
      Data? data, 
      bool? success,}){
    _data = data;
    _success = success;
}

  ChatRoomModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
  }
  Data? _data;
  bool? _success;
ChatRoomModel copyWith({  Data? data,
  bool? success,
}) => ChatRoomModel(  data: data ?? _data,
  success: success ?? _success,
);
  Data? get data => _data;
  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    return map;
  }

}

/// id : 1
/// loginuserid : 4
/// created_at : "2023-01-22T06:58:33.000000Z"
/// updated_at : "2023-01-22T06:58:33.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? loginuserid, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _loginuserid = loginuserid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _loginuserid = json['loginuserid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _loginuserid;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  int? loginuserid,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  loginuserid: loginuserid ?? _loginuserid,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get loginuserid => _loginuserid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['loginuserid'] = _loginuserid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}