class User {
  final int? userid;
  final String? firstName;
  final String? lastName;
  final String? cnic;
  final String? address;
  final int? roleId;
  final int? subadminid;
  final int? familymemberid;
  final int? residentid;
  final String? roleName;
  final String? bearerToken;

  User(
      {this.userid,
      this.subadminid,
      this.firstName,
      this.lastName,
        this.familymemberid,
        this.residentid,
      this.cnic,
      this.roleId,
      this.roleName,
      this.bearerToken,
      this.address,
      });
}
