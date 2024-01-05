import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonateItemModel {
  String? category;
  Uint8List? photo;
  GeoPoint? location;

  DonateItemModel({this.category, this.photo, this.location});

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'photo': photo,
      'location': location,
    };
  }
}