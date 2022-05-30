// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

// class Customer{
//   late int id;
//   late String email;
//   late String phone;
//   late String name;
//   late String token;

//   User({this.id, this.email, this.phone, this.name, this.token});

//   factory Customer.fromReqBody(String body) {
//     Map<String, dynamic> json = jsonDecode(body);

//     return Customer(
//       id: json['id'],
//       email: json['email'],
//       name: json['name'],
//       phone: json['phone'],
//       token: json['token'],
//     );

//   }

//   void printAttributes() {
//     print("id: $id\n");
//     print("email: $email\n");
//     print("phone: $phone\n");
//     print("name: $name\n");
//     print("token: $token\n");
//   }

// }

// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);


Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String welcomeToJson(Auth data) => json.encode(data.toJson());

class Auth {
    Auth({
        required this.success,
        required this.message,
        required this.payload,
    });

    bool success;
    String message;
    Payload payload;

    factory Auth.fromJson(Map<String, dynamic> json) => Auth(
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
