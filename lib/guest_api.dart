import 'package:bukit_vista_assessment/guest.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class guestapi{
  static Future<List<guestData>> getUserLocally(BuildContext context) async{
  final AssetBundle = DefaultAssetBundle.of(context);
  final data = await AssetBundle.loadString('assets/data.json');
  final body = json.decode(data);

  return body.map<guestData>(guestData.fromJson).toList();
  }
}