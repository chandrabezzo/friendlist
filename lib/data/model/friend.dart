import 'package:friendlist/data/model/person_response.dart';

class Friend {
  String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String picture;
  String alamat;
  String latitude;
  String longitude;
  String birthday;

  Friend({this.email, this.firstName, this.lastName, this.phoneNumber, this.picture, this.alamat, this.latitude, this.longitude, this.birthday});

  static Map<String, dynamic> toMap(final Friend friend) {
    Map<String, dynamic> data = new Map();
    if (friend != null) {
      data.putIfAbsent('email', () => friend.email);
      data.putIfAbsent('first', () => friend.firstName);
      data.putIfAbsent('last', () => friend.lastName);
      data.putIfAbsent('phone_number', () => friend.phoneNumber);
      data.putIfAbsent('picture', () => friend.picture);
      data.putIfAbsent('alamat', () => friend.alamat);
      data.putIfAbsent('latitude', () => friend.latitude);
      data.putIfAbsent('longitude', () => friend.longitude);
      data.putIfAbsent('birthday', () => friend.birthday);
    }

    return data;
  }

  static Friend fromMap(final Map<String, dynamic> data) {
    Friend friend;
    if (data.isNotEmpty) {
       friend = Friend(
         alamat: data['alamat'],
         birthday: data['birthday'],
         email: data['email'],
         firstName: data['first'],
         lastName: data['last'],
         latitude: data['latitude'],
         longitude: data['longitude'],
         phoneNumber: data['phone_number'],
         picture: data['picture']
       );
    }

    return friend;
  }
}