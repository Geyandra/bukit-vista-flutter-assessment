import 'package:meta/meta.dart';

class guestData{
  final String photo;
  final String name;
  final String address;
  final String email;
  final String guest;
  final String checkin;
  final String checkin_time;
  final String checkout;
  final String checkout_time;
  final String booking_id;
  final String booking_status;
  final String number_guest;
  final String booking_value;
  final String phone;
  final String hotel;
  final String host;
  final String profile_name;
  final String property;
  final String listing;

  const guestData({
  required this.photo,
  required this.name,
  required this.address,
  required this.email,
  required this.guest,
  required this.checkin,
  required this.checkin_time,
  required this.checkout,
  required this.checkout_time,
  required this.booking_id,
  required this.booking_status,
  required this.number_guest,
  required this.booking_value,
  required this.phone,
  required this.hotel,
  required this.host,
  required this.profile_name,
  required this.property,
  required this.listing,
  });

  static guestData fromJson(json) => guestData(
  photo: json['photo'],
  name: json['name'],
  address: json['address'],
  email: json['email'],
  guest: json['guest'],
  checkin: json['checkin'],
  checkin_time: json['checkin_time'],
  checkout: json['checkout'],
  checkout_time: json['checkout_time'],
  booking_id: json['booking_id'],
  booking_status: json['booking_status'],
  number_guest: json['number_guest'],
  booking_value: json['booking_value'],
  phone: json['phone'],
  hotel: json['hotel'],
  host: json['host'],
  profile_name: json['profile_name'],
  property: json['property'],
  listing: json['listing'],
  );
}



