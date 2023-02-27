import 'dart:convert';
/// success : true
/// data : {"id":1,"userid":3,"chatuserid":5,"chatroomid":1,"created_at":"2023-01-24T09:12:07.000000Z","updated_at":"2023-01-24T09:12:07.000000Z"}

ChatRoomUsers chatRoomUsersFromJson(String str) => ChatRoomUsers.fromJson(json.decode(str));
String chatRoomUsersToJson(ChatRoomUsers data) => json.encode(data.toJson());
class ChatRoomUsers {
  ChatRoomUsers({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  ChatRoomUsers.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  Data? _data;
ChatRoomUsers copyWith({  bool? success,
  Data? data,
}) => ChatRoomUsers(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 1
/// userid : 3
/// chatuserid : 5
/// chatroomid : 1
/// created_at : "2023-01-24T09:12:07.000000Z"
/// updated_at : "2023-01-24T09:12:07.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? userid, 
      int? chatuserid, 
      int? chatroomid, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userid = userid;
    _chatuserid = chatuserid;
    _chatroomid = chatroomid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userid = json['userid'];
    _chatuserid = json['chatuserid'];
    _chatroomid = json['chatroomid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _userid;
  int? _chatuserid;
  int? _chatroomid;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  int? userid,
  int? chatuserid,
  int? chatroomid,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userid: userid ?? _userid,
  chatuserid: chatuserid ?? _chatuserid,
  chatroomid: chatroomid ?? _chatroomid,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get userid => _userid;
  int? get chatuserid => _chatuserid;
  int? get chatroomid => _chatroomid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userid'] = _userid;
    map['chatuserid'] = _chatuserid;
    map['chatroomid'] = _chatroomid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}