import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirebaseStorage _storage = FirebaseStorage.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();final TextEditingController _dateController = TextEditingController();
  bool isPasswordVisible = false;
  Color myCustomColor = const Color(0xff111111);
  Uint8List? _image;
  final imagePicker = ImagePicker();

  String profilePictureUrl ='';

  Future<void> uploadImageAndSave() async {
    try {
      final user = _auth.currentUser;
      if (user == null){
        // Handle the case where the user is not signed in
        return;
      }
      final profile = 'profile_pictures/${user.uid}.png';

      // Upload image to cloud storage
      //final UploadTask task = _storage.ref().child(profile).putData(_image!);

      // get download URL of the uploaded image
      //final TaskSnapshot snapshot = await task;
      //final imageUrl = await snapshot.ref.getDownloadURL();

      // Update user's firestore document with the image url
      /* await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'profilePictureUrl': imageUrl}); */

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Profile Picture uploaded and updated'),
        ),
      );
    } catch (e){
      // Handle error
      print('Error uploading image: $e');
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null){
      final imageBytes = await pickedImage.readAsBytes();
      setState(() {
        _image = Uint8List.fromList(imageBytes);
      });
    }
    else {
      print("Image source not found");
    }
  }

  Future<void> fetchUserData() async{
    try{
      // get user's current ID
      final userId = FirebaseAuth.instance.currentUser!.uid;

      // fetch the user's document from firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if(userDoc.exists){
        // Extract and set the user's data to the respective TextEditingController
        setState(() {
          _addressController.text = userDoc['address'] ?? '';
          _emailController.text = userDoc['email'];
          _addressController.text = userDoc['address'] ?? '';
          _passwordController.text = userDoc['password'];
          _phoneController.text = userDoc['phone'];

          // set the profile pictrue URL from firestore
          profilePictureUrl = userDoc['profilePictureUrl'];
        });
        print("this is user name : ${userDoc['username']}");
        print("This is profile picture : ${profilePictureUrl}");
      }
    } catch (e){
      print(e);
    }
  }

  Future<void> _selectDate() async {
    DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime.now(),
    );

    if(selected != null){
      setState(() {
        String formattedDate =
            "${selected.year}-${selected.month.toString().padLeft(2, '0')}"
            "-${selected.day.toString().padLeft(2, '0')}";
        _dateController.text = formattedDate; // Update the dateController
        //dateController.text = selected.toString().split(" ")[0];
      });
    }
  }

  Future<void> updateUserData() async{
    try{
      // get the current users ID
      final userId = FirebaseAuth.instance.currentUser!.uid;
      print("This is image picture : ${_image}");

      // update the user document in firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({
        'address' : _dateController.text,
        'email': _emailController.text,
        'name': _nameController.text,
        'phone' : _phoneController.text,
        //'username' : usernameController.text,
        'profilePictureUrl' : profilePictureUrl,
      });

      // inform the user that the profile has been updated
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile update successfully'),
        ),
      );
    } catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  _image != null
                      ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )
                      : (profilePictureUrl != null && profilePictureUrl.isNotEmpty)
                      ? CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(profilePictureUrl),
                  )
                      : const CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage('assets/logo_MAD.jpeg'),
                  ),
                  Positioned(
                    top: 5,
                    left: 80,
                    child: IconButton(
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Address:",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff292828),
                      ),
                    ),
                    const SizedBox(height: 5), // Add some space between the label and TextField
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Address',
                        prefixIcon: const Icon(
                          Icons.house,
                          color: Colors.black54,
                        ),
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black), // Text color while typing
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email:",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff292828),
                      ),
                    ),
                    const SizedBox(height: 5), // Add some space between the label and TextField
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.local_post_office,
                          color: Colors.black54,
                        ),
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black), // Text color while typing
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name:",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff292828),
                      ),
                    ),
                    const SizedBox(height: 5), // Add some space between the label and TextField
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Name',
                        prefixIcon: const Icon(
                          Icons.person_3_rounded,
                          color: Colors.black54,
                        ),
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black), // Text color while typing
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Phone No:",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff292828),
                      ),
                    ),
                    const SizedBox(height: 5), // Add some space between the label and TextField
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Phone Number',
                        prefixIcon: const Icon(
                          Icons.call,
                          color: Colors.black54,
                        ),
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black), // Text color while typing
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    elevation: 10,
                    shape: const StadiumBorder()),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                      color: Color(0xF6F5F5FF),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  if( _addressController.text.isNotEmpty &&
                      _emailController.text.isNotEmpty &&
                      _nameController.text.isNotEmpty &&
                      _phoneController.text.isNotEmpty) {
                    updateUserData();
                    await uploadImageAndSave();
                    Navigator.pop(context, true);
                  }
                  else{
                    Navigator.pop(context, false);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
