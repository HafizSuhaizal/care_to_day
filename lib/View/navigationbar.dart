import 'dart:convert';

import 'package:care_to_day/View/events.dart';
import 'package:care_to_day/View/homepage.dart';
import 'package:care_to_day/View/notifications.dart';
import 'package:care_to_day/View/profile_page.dart';
import 'package:care_to_day/View/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:http/http.dart' as http;

/**
 * This is the home navigation bar
 * where user can swipe to other pages
 * based on items on navigation bar
 */


class HomeNavi extends StatefulWidget {
  
  const HomeNavi({Key? key, required this.useremail, required this.tabIndexes}) : super(key: key);
  final String useremail;
  final int tabIndexes;
  // const HomeNavi({required this.username});

  @override
  State<HomeNavi> createState() => _HomeNaviState();
}

class _HomeNaviState extends State<HomeNavi> {
  // set the default initial page
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }
  
  // controller for Page view
  late PageController pageController;

  @override
  void initState() {
    _tabIndex = widget.tabIndexes;

    super.initState();
    // to set the default page to be initiated based on tab index
    pageController = PageController(initialPage: _tabIndex);
    
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      /**
       * Using CircleNavBar as packages
       * setting up in pubspec.yaml for dependencies
       *
       * This will enable to be used as navigation bar
       * which is more dynamic
       */
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          /**
           * icons on navigation bar
           * will be appeared when user is at current page
           */
          Icon(Icons.home, color: Color(0xEDFF4848), size: 35,),
          Icon(Icons.event, color: Color(0xEDFF4848), size: 35,),
          Icon(Icons.notifications, color: Color(0xEDFF4848), size: 35,),
          Icon(Icons.person, color: Color(0xEDFF4848), size: 35,),
        ],

        /**
         * when the other pages are not active
         * the tab will be displayed as text
         */
        inactiveIcons:  [
          Text("Home", style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.bold
          ),),
          Text("Events", style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold
          ),),
          Text("Notification", style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold
          ),),
          Text("Account", style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.bold
          ),),
        ],
        color: Color(0xEDFF4848),
        height: 70,
        circleWidth: 70,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        // the rounded corner for the navigation bar
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.blueGrey,
        elevation: 10,
        /**
         * Background color of the bar
         */
        

        circleColor: Colors.white,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          /**
           * when the user switch the page
           * the index of current page will be assigned to the tabIndex
           */
          tabIndex = v;
        },
        children: [
          /**
           * Here will import the screens
           * based on the navigation bar in sequence
           *
           * The index of the screen starts from 0 in sequence
           * which is related to variable tabIndex later on
           */
          HomePage(),
          Events(),
          NotificationPage(),
          UserProfile(useremail: widget.useremail,),

        ],
      ),
    );
  }
}