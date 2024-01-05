import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Controller/donate_item.dart';
import '../Model/donate_item.dart';

class DonateItemScreen extends StatefulWidget {
  @override
  _DonateItemScreenState createState() => _DonateItemScreenState();
}

class _DonateItemScreenState extends State<DonateItemScreen> {
  final DonateItemController controller = DonateItemController();
  final ImagePicker picker = ImagePicker();
  String? selectedCategory;
  Uint8List? imageBytes;
  LatLng? selectedLocation;

  // Dummy categories
  final List<String> categories = ['Clothes', 'Foods and Drinks', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donate Item')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              hint: const Text('Select Category'),
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: () => pickImage(),
              child: const Text('Take a Picture'),
            ),
            if (imageBytes != null) Image.memory(imageBytes!),
            ElevatedButton(
              onPressed: () => selectLocation(),
              child: const Text('Select Location'),
            ),
            ElevatedButton(
              onPressed: () => submitDonation(),
              child: const Text('Submit Donation'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() async {
        imageBytes = await pickedFile.readAsBytes();
      });
    }
  }

  void selectLocation() {
    // Implement location selection logic
    // For simplicity, this is just a placeholder
    setState(() {
      selectedLocation = const LatLng(0, 0); // Dummy location
    });
  }

  Future<void> submitDonation() async {
    if (selectedCategory != null && imageBytes != null && selectedLocation != null) {
      DonateItemModel donation = DonateItemModel(
        category: selectedCategory,
        photo: imageBytes,
        location: GeoPoint(selectedLocation!.latitude, selectedLocation!.longitude),
      );
      await controller.saveDonation(donation);
      // Handle successful submission
    } else {
      // Handle missing information
    }
  }
}