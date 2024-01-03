import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/donate_item.dart';
class DonateItemController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveDonation(DonateItemModel donation) async {
    await firestore.collection("donations").add(donation.toMap());
  }
}
