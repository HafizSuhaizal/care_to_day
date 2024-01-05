import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("My Profile", style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold
          )
          ),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            


          ],
        ),
      ),
    );
  }
}