class CreateEmployerRequest {
  CreateEmployerRequest({
    required this.profession,
    required this.organizationName,
    required this.yearsOnJob,
    required this.employerAddress,
    required this.city,
    required this.country,
    required this.monthlySalary,
  });
  late final String profession;
  late final String organizationName;
  late final int yearsOnJob;
  late final String employerAddress;
  late final String city;
  late final String country;
  late final int monthlySalary;
  
  CreateEmployerRequest.fromJson(Map<String, dynamic> json){
    profession = json['profession'];
    organizationName = json['organizationName'];
    yearsOnJob = json['yearsOnJob'];
    employerAddress = json['employerAddress'];
    city = json['city'];
    country = json['country'];
    monthlySalary = json['monthlySalary'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['profession'] = profession;
    _data['organizationName'] = organizationName;
    _data['yearsOnJob'] = yearsOnJob;
    _data['employerAddress'] = employerAddress;
    _data['city'] = city;
    _data['country'] = country;
    _data['monthlySalary'] = monthlySalary;
    return _data;
  }
}