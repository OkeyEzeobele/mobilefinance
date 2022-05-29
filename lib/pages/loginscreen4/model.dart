// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        required this.success,
        required this.message,
        required this.payload,
    });

    bool success;
    String message;
    Payload payload;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        success: json["success"],
        message: json["message"],
        payload: Payload.fromJson(json["payload"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "payload": payload.toJson(),
    };
}

class Payload {
    Payload({
        required this.user,
        required this.token,
        required this.isVerified,
        required this.isBvnVerified,
        required this.cf,
    });

    User user;
    String token;
    bool isVerified;
    bool isBvnVerified;
    Cf cf;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        user: User.fromJson(json["user"]),
        token: json["token"],
        isVerified: json["isVerified"],
        isBvnVerified: json["isBvnVerified"],
        cf: Cf.fromJson(json["cf"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
        "isVerified": isVerified,
        "isBvnVerified": isBvnVerified,
        "cf": cf.toJson(),
    };
}

class Cf {
    Cf({
        required this.lct,
    });

    String lct;

    factory Cf.fromJson(Map<String, dynamic> json) => Cf(
        lct: json["lct"],
    );

    Map<String, dynamic> toJson() => {
        "lct": lct,
    };
}

class User {
    User({
        required this.id,
        required this.fullName,
    });

    int id;
    String fullName;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["fullName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
    };
}
