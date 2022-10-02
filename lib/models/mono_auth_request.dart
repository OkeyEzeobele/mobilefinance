class RequestMonoAuth {
  RequestMonoAuth({
    required this.code,
  });
  late final String code;

  RequestMonoAuth.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    return _data;
  }
}
