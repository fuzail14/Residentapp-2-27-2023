/// success : true
/// data : {"id":1,"charges":"5000.00","chargesafterduedate":"6100.00","appcharges":"100.00","tax":"750.00","balance":"5850.00","payableamount":"5850.00","subadminid":2,"residentid":4,"propertyid":1,"measurementid":1,"duedate":"2023-04-28","billstartdate":"2023-04-28","billenddate":"2023-04-28","month":"April 2023","status":0,"noofappusers":1,"created_at":"2023-04-28T14:44:32.000000Z","updated_at":"2023-04-28T14:44:32.000000Z"}

class BillModel {
  BillModel({
      this.success, 
      this.data,});

  BillModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  Data? data;
BillModel copyWith({  bool? success,
  Data? data,
}) => BillModel(  success: success ?? this.success,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 1
/// charges : "5000.00"
/// chargesafterduedate : "6100.00"
/// appcharges : "100.00"
/// tax : "750.00"
/// balance : "5850.00"
/// payableamount : "5850.00"
/// subadminid : 2
/// residentid : 4
/// propertyid : 1
/// measurementid : 1
/// duedate : "2023-04-28"
/// billstartdate : "2023-04-28"
/// billenddate : "2023-04-28"
/// month : "April 2023"
/// status : 0
/// noofappusers : 1
/// created_at : "2023-04-28T14:44:32.000000Z"
/// updated_at : "2023-04-28T14:44:32.000000Z"

class Data {
  Data({
      this.id, 
      this.charges, 
      this.chargesafterduedate, 
      this.appcharges, 
      this.tax, 
      this.balance, 
      this.payableamount, 
      this.subadminid, 
      this.residentid, 
      this.propertyid, 
      this.measurementid, 
      this.duedate, 
      this.billstartdate, 
      this.billenddate, 
      this.month, 
      this.status, 
      this.noofappusers, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    charges = json['charges'];
    chargesafterduedate = json['chargesafterduedate'];
    appcharges = json['appcharges'];
    tax = json['tax'];
    balance = json['balance'];
    payableamount = json['payableamount'];
    subadminid = json['subadminid'];
    residentid = json['residentid'];
    propertyid = json['propertyid'];
    measurementid = json['measurementid'];
    duedate = json['duedate'];
    billstartdate = json['billstartdate'];
    billenddate = json['billenddate'];
    month = json['month'];
    status = json['status'];
    noofappusers = json['noofappusers'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? charges;
  String? chargesafterduedate;
  String? appcharges;
  String? tax;
  String? balance;
  String? payableamount;
  int? subadminid;
  int? residentid;
  int? propertyid;
  int? measurementid;
  String? duedate;
  String? billstartdate;
  String? billenddate;
  String? month;
  int? status;
  int? noofappusers;
  String? createdAt;
  String? updatedAt;
Data copyWith({  int? id,
  String? charges,
  String? chargesafterduedate,
  String? appcharges,
  String? tax,
  String? balance,
  String? payableamount,
  int? subadminid,
  int? residentid,
  int? propertyid,
  int? measurementid,
  String? duedate,
  String? billstartdate,
  String? billenddate,
  String? month,
  int? status,
  int? noofappusers,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? this.id,
  charges: charges ?? this.charges,
  chargesafterduedate: chargesafterduedate ?? this.chargesafterduedate,
  appcharges: appcharges ?? this.appcharges,
  tax: tax ?? this.tax,
  balance: balance ?? this.balance,
  payableamount: payableamount ?? this.payableamount,
  subadminid: subadminid ?? this.subadminid,
  residentid: residentid ?? this.residentid,
  propertyid: propertyid ?? this.propertyid,
  measurementid: measurementid ?? this.measurementid,
  duedate: duedate ?? this.duedate,
  billstartdate: billstartdate ?? this.billstartdate,
  billenddate: billenddate ?? this.billenddate,
  month: month ?? this.month,
  status: status ?? this.status,
  noofappusers: noofappusers ?? this.noofappusers,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['charges'] = charges;
    map['chargesafterduedate'] = chargesafterduedate;
    map['appcharges'] = appcharges;
    map['tax'] = tax;
    map['balance'] = balance;
    map['payableamount'] = payableamount;
    map['subadminid'] = subadminid;
    map['residentid'] = residentid;
    map['propertyid'] = propertyid;
    map['measurementid'] = measurementid;
    map['duedate'] = duedate;
    map['billstartdate'] = billstartdate;
    map['billenddate'] = billenddate;
    map['month'] = month;
    map['status'] = status;
    map['noofappusers'] = noofappusers;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}