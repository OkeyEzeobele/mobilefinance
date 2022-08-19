class SignupRequest {
  SignupRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.pushToken,
    required this.deviceId,
    required this.dob,
    required this.tandc,
  });
  late final String fullName;
  late final String email;
  late final String password;
  late final String phone;
  late final String pushToken;
  late final String deviceId;
  late final String dob;
  late final String tandc;
  
  SignupRequest.fromJson(Map<String, dynamic> json){
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    pushToken = json['pushToken'];
    deviceId = json['deviceId'];
    dob = json['dob'];
    tandc = json['tandc'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['pushToken'] = pushToken;
    _data['deviceId'] = deviceId;
    _data['dob'] = dob;
    _data['tandc'] = tandc;
    return _data;
  }
}