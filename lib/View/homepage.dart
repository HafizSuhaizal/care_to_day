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
        title: Row(
          children: [
            Text("Caring",style: GoogleFonts.epilogue(
              fontSize: 25, color: const Color(0xEDFF4848), fontWeight: FontWeight.bold
            ),),

            Text("Hub",style: GoogleFonts.epilogue(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold
            ),),
          ],
        ),

        actions: [
                Container(
                  padding: EdgeInsets.all(10),
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "https://i.mydramalist.com/xYozyc.jpg",
                        ),
                        repeat: ImageRepeat.noRepeat
                      ),
                      
                      color: Colors.blue
                    ),
          ),
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          
        ),
        child: Container(
          
        ),
      ),
    );
  }
}
