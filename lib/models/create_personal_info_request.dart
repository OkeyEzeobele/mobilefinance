class PersonalDetailsRequest {
  PersonalDetailsRequest({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.maritalStatus,
    required this.monthlyIncome,
    required this.dob,
    required this.bvn,
  });
  late final String? firstName;
  late final dynamic middleName;
  late final String? lastName;
  late final dynamic gender;
  late final dynamic maritalStatus;
  late final int? monthlyIncome;
  late final String? dob;
  late final dynamic bvn;

  PersonalDetailsRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    monthlyIncome = json['monthlyIncome'];
    dob = json['dob'];
    bvn = json['bvn'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName;
    _data['middleName'] = middleName;
    _data['lastName'] = lastName;
    _data['gender'] = gender;
    _data['maritalStatus'] = maritalStatus;
    _data['monthlyIncome'] = monthlyIncome;
    _data['dob'] = dob;
    _data['bvn'] = bvn;
    return _data;
  }
}
