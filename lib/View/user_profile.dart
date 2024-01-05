import 'package:care_to_day/View/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  final TextEditingController usernameCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("My Profile", style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold
          )
          ),
        ),
        actions: [
          TextButton(onPressed: null, 
            child: Text("Log out", style: GoogleFonts.poppins(

            )),
          )
        ],
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: const EdgeInsets.only(bottom: 70),
            child: Center(
              child: Column(
                children: [
            
                  Container(
                    width: 150,
                    height: 150,
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
            
                  const SizedBox(height: 10),
            
                  ElevatedButton(
                  
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ProfilePage())
                    ),
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
                  ),
            
                  const SizedBox(height: 10),
                  
                  const Divider(
                    thickness: 2.0,
                    color: Colors.black,
                  ),
            
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name", style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18
                          ), 
                      ),
            
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xB3C9C9C9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
              
                        ),
                        style: GoogleFonts.poppins(
            
                        ),
                      ),
            
                      const SizedBox(height: 5),
            
                      Text("Phone", style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18
                          ), 
                      ),
            
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xB3C9C9C9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
              
                        ),
                        style: GoogleFonts.poppins(
            
                        ),
                      ),
            
                       const SizedBox(height: 5),
            
                      Text("Email", style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18
                          ), 
                      ),
            
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xB3C9C9C9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
              
                        ),
                        style: GoogleFonts.poppins(
            
                        ),
                      ),
            
                      const SizedBox(height: 5),
            
                      Text("Password", style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18
                          ), 
                      ),
            
                      TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xB3C9C9C9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
              
                        ),
                        style: GoogleFonts.poppins(
            
                        ),
                      ),
            
                      const SizedBox(height: 5),
            
                      Text("Birthday", style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18
                          ), 
                      ),
            
                      TextField(
                        enabled: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xB3C9C9C9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
              
                        ),
                        style: GoogleFonts.poppins(
            
                        ),
                      ),
            
                      const SizedBox(height: 5),
            
            
                  
                    ],
                  ),
            
            
                  
            
                  
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}