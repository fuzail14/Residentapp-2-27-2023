/// success : true
/// data : [{"id":3,"residentid":3,"subadminid":2,"username":"sule","country":"🇵🇰    Pakistan","state":"null","city":"null","houseaddress":"Rawat Enclave, house#1","vechileno":"","residenttype":"Owner","propertytype":"house","committeemember":0,"status":1,"chatstatus":"default","created_at":"2023-07-26T10:02:03.000000Z","updated_at":"2023-07-27T18:01:59.000000Z","firstname":"Hadi","lastname":"Abrar","cnic":"123","address":"Rawat Enclave, house#1","mobileno":"+921111111111","password":"$2y$10$FmbJZBDVcAcfTdY66g0KT.WdqjBq0BmlapTflnk3d6NTiCpEe3USW","roleid":3,"rolename":"resident","image":"images/user.png","fcmtoken":"fWphlTpqQ_2mUg5hVcp2lm:APA91bGYhLYBoIwl7B5BLzwQm32noWc3s0vxPeIaJYHsJN7ZapfhfZ7NDHkLC5CCAbZ7_XUjGCBkUb56sHI9NU2A-Gf4oAXkXKUdMVmKdisw5vek7EEU8vFi7YBlj3-rB5SiJ44Pe3Jv"},{"id":4,"residentid":4,"subadminid":2,"username":"sulee","country":"🇵🇰    Pakistan","state":"null","city":"null","houseaddress":"Rawat Enclave, house#2","vechileno":"","residenttype":"Owner","propertytype":"house","committeemember":0,"status":1,"chatstatus":"default","created_at":"2023-07-26T10:02:46.000000Z","updated_at":"2023-07-27T18:02:33.000000Z","firstname":"Hussnain","lastname":"Abrar","cnic":"1334","address":"Rawat Enclave, house#2","mobileno":"+922222222222","password":"$2y$10$O2AtYPL4BZHHsdoMr0fJeOEb77t4RlwkDapHvnUmLMzizQGjS0192","roleid":3,"rolename":"resident","image":"images/user.png","fcmtoken":"fWphlTpqQ_2mUg5hVcp2lm:APA91bHt6Fj9j3ctV_Y8odjXCdPX1u7t2CsrtKHTVUcCpmiv0_BX4QLOkwwBCvzrcMbWTL-IOJSUuPAU6-9xA1nirFswheE6nsAyQ5jWk4jtcAD9XFjQvYOgAiZwct0Pvgn8yCR9ClbO"},{"id":5,"residentid":5,"subadminid":2,"username":"suleke","country":"🇵🇰    Pakistan","state":"null","city":"null","houseaddress":"Rawat Enclave, house#3","vechileno":"","residenttype":"Owner","propertytype":"house","committeemember":0,"status":1,"chatstatus":"default","created_at":"2023-07-26T10:03:17.000000Z","updated_at":"2023-07-27T05:47:03.000000Z","firstname":"Iqra","lastname":"Naaz","cnic":"4697","address":"Rawat Enclave, house#3","mobileno":"+923333333333","password":"$2y$10$tQlg533vM0klU4ibxn0Q2uzpX09T.9C0jDw8WUnfOyl2M15Thqki2","roleid":3,"rolename":"resident","image":"images/user.png","fcmtoken":"djc2XGzpT0q136SRJq5Soa:APA91bEmROjtT4UUEduB-AODm2wXYOXr_eGHFzwBScgdRmoSKMp_1kdT8F2SuRDaXr4M6n2knTiNpwIimXFVU6qdoRNGKnqQAUqItyJya2AKovjuswe1dIY1F04F5y2GE100GpRwUQjq"},{"id":6,"residentid":6,"subadminid":2,"username":"bbb","country":"🇵🇰    Pakistan","state":"null","city":"null","houseaddress":"Rawat Enclave, house#4","vechileno":"","residenttype":"Owner","propertytype":"house","committeemember":0,"status":1,"chatstatus":"default","created_at":"2023-07-26T10:03:53.000000Z","updated_at":"2023-07-27T18:04:12.000000Z","firstname":"Rabail","lastname":"Bashir","cnic":"466888","address":"Rawat Enclave, house#4","mobileno":"+924444444444","password":"$2y$10$ZTkovAcC0OH/Bu0QuH3CQO8IEhSAqy42snYB0.a2YCenD2XkX47sy","roleid":3,"rolename":"resident","image":"images/user.png","fcmtoken":"fWphlTpqQ_2mUg5hVcp2lm:APA91bFUVJWx4SwPXYnmCfkDtCr0p7bk0wDnBSU3yi1buSjOw38nUqfBvsYFHHW2VZPFOOaCG0d6T-ac-Kdlr7MXk80cHGhxApIooNr790iA-beutqHKithjmL46Rbn4pawjweIcAmKf"}]

class ChatNeighbours {
  ChatNeighbours({
    this.success,
    this.data,
  });

  ChatNeighbours.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  List<Data>? data;
  ChatNeighbours copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      ChatNeighbours(
        success: success ?? this.success,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// residentid : 3
/// subadminid : 2
/// username : "sule"
/// country : "🇵🇰    Pakistan"
/// state : "null"
/// city : "null"
/// houseaddress : "Rawat Enclave, house#1"
/// vechileno : ""
/// residenttype : "Owner"
/// propertytype : "house"
/// committeemember : 0
/// status : 1
/// chatstatus : "default"
/// created_at : "2023-07-26T10:02:03.000000Z"
/// updated_at : "2023-07-27T18:01:59.000000Z"
/// firstname : "Hadi"
/// lastname : "Abrar"
/// cnic : "123"
/// address : "Rawat Enclave, house#1"
/// mobileno : "+921111111111"
/// password : "$2y$10$FmbJZBDVcAcfTdY66g0KT.WdqjBq0BmlapTflnk3d6NTiCpEe3USW"
/// roleid : 3
/// rolename : "resident"
/// image : "images/user.png"
/// fcmtoken : "fWphlTpqQ_2mUg5hVcp2lm:APA91bGYhLYBoIwl7B5BLzwQm32noWc3s0vxPeIaJYHsJN7ZapfhfZ7NDHkLC5CCAbZ7_XUjGCBkUb56sHI9NU2A-Gf4oAXkXKUdMVmKdisw5vek7EEU8vFi7YBlj3-rB5SiJ44Pe3Jv"

class Data {
  Data({
    this.id,
    this.residentid,
    this.subadminid,
    this.username,
    this.country,
    this.state,
    this.city,
    this.houseaddress,
    this.vechileno,
    this.residenttype,
    this.propertytype,
    this.committeemember,
    this.status,
    this.chatstatus,
    this.createdAt,
    this.updatedAt,
    this.firstname,
    this.lastname,
    this.cnic,
    this.address,
    this.mobileno,
    this.password,
    this.roleid,
    this.rolename,
    this.image,
    this.fcmtoken,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    residentid = json['residentid'];
    subadminid = json['subadminid'];
    username = json['username'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    houseaddress = json['houseaddress'];
    vechileno = json['vechileno'];
    residenttype = json['residenttype'];
    propertytype = json['propertytype'];
    committeemember = json['committeemember'];
    status = json['status'];
    chatstatus = json['chatstatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    cnic = json['cnic'];
    address = json['address'];
    mobileno = json['mobileno'];
    password = json['password'];
    roleid = json['roleid'];
    rolename = json['rolename'];
    image = json['image'];
    fcmtoken = json['fcmtoken'];
  }
  int? id;
  int? residentid;
  int? subadminid;
  String? username;
  String? country;
  String? state;
  String? city;
  String? houseaddress;
  String? vechileno;
  String? residenttype;
  String? propertytype;
  int? committeemember;
  int? status;
  String? chatstatus;
  String? createdAt;
  String? updatedAt;
  String? firstname;
  String? lastname;
  String? cnic;
  String? address;
  String? mobileno;
  String? password;
  int? roleid;
  String? rolename;
  String? image;
  String? fcmtoken;
  Data copyWith({
    int? id,
    int? residentid,
    int? subadminid,
    String? username,
    String? country,
    String? state,
    String? city,
    String? houseaddress,
    String? vechileno,
    String? residenttype,
    String? propertytype,
    int? committeemember,
    int? status,
    String? chatstatus,
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
  }) =>
      Data(
        id: id ?? this.id,
        residentid: residentid ?? this.residentid,
        subadminid: subadminid ?? this.subadminid,
        username: username ?? this.username,
        country: country ?? this.country,
        state: state ?? this.state,
        city: city ?? this.city,
        houseaddress: houseaddress ?? this.houseaddress,
        vechileno: vechileno ?? this.vechileno,
        residenttype: residenttype ?? this.residenttype,
        propertytype: propertytype ?? this.propertytype,
        committeemember: committeemember ?? this.committeemember,
        status: status ?? this.status,
        chatstatus: chatstatus ?? this.chatstatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        cnic: cnic ?? this.cnic,
        address: address ?? this.address,
        mobileno: mobileno ?? this.mobileno,
        password: password ?? this.password,
        roleid: roleid ?? this.roleid,
        rolename: rolename ?? this.rolename,
        image: image ?? this.image,
        fcmtoken: fcmtoken ?? this.fcmtoken,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['residentid'] = residentid;
    map['subadminid'] = subadminid;
    map['username'] = username;
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['houseaddress'] = houseaddress;
    map['vechileno'] = vechileno;
    map['residenttype'] = residenttype;
    map['propertytype'] = propertytype;
    map['committeemember'] = committeemember;
    map['status'] = status;
    map['chatstatus'] = chatstatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['cnic'] = cnic;
    map['address'] = address;
    map['mobileno'] = mobileno;
    map['password'] = password;
    map['roleid'] = roleid;
    map['rolename'] = rolename;
    map['image'] = image;
    map['fcmtoken'] = fcmtoken;
    return map;
  }
}
