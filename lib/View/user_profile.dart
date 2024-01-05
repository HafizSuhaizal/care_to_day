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
        child: Container(
          child: Center(
            child: Column(
              children: [

                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
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

                const SizedBox(height: 10),

                ElevatedButton(
                
                  onPressed: (){}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Text("Edit profile", style: GoogleFonts.poppins(
                          fontSize: 18
                        ), 
                      ),

                      Spacer(),

                      Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ), style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(180.0, 50.0)),
                    backgroundColor: MaterialStatePropertyAll(Color(0xFFF85989)),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    
                  ),
                )
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}