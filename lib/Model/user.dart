class UserModel {
  String? name;
  String? email;
  String? role;
  String? address;
  String? phoneNo;
  //PatrolSchedule? patrolSchedule; // tambahan

  UserModel({this.name, this.email, this.role, this.address, this.phoneNo});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'address': address,
      'phoneNo': phoneNo,
    };
  }
}