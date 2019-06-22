import 'dart:convert';

import 'package:core/data/base_response.dart';

class LoginResponse extends BaseResponse {
    DataLogin data;

    LoginResponse({this.data});

    LoginResponse.fromJson(Map<String, dynamic> json): super.fromJson(json) {
      data = DataLogin.fromJson(json["data"]);
    }
}

class DataLogin {
    String noRm;
    String tglLahir;
    String noPhone;
    String token;

    DataLogin({
        this.noRm,
        this.tglLahir,
        this.noPhone,
        this.token,
    });

    factory DataLogin.fromJson(Map<String, dynamic> json) => new DataLogin(
        noRm: json["no_rm"],
        tglLahir: json["tgl_lahir"],
        noPhone: json["no_phone"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "no_rm": noRm,
        "tgl_lahir": tglLahir,
        "no_phone": noPhone,
        "token": token,
    };
}