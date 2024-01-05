import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: GoogleFonts.poppins(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold
        ),),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://img.freepik.com/premium-photo/donation-concept-donation-box-with-clothes-background-wall-vertical-photo_326533-1369.jpg"
            )
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white38
          ),
        ),
      ),
    );
  }
}
