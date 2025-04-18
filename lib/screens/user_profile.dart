import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_mobile_app/providers/user_profile_provider.dart';
import 'package:health_mobile_app/screens/change_password.dart';
import 'package:health_mobile_app/screens/change_username.dart';

import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 130,
              padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                style: IconButton.styleFrom(overlayColor: Colors.transparent),
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20)
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                // padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13)
                  ),
                  color: Color(0xFFFAFAFA)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: 50, 
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider()),
                    ExpansionTile(
                      shape: Border(),
                      tilePadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      backgroundColor: Colors.white,
                      childrenPadding: EdgeInsets.fromLTRB(20, 3, 20, 3),
                      title: Row(
                        children: [
                          Icon(Icons.account_circle_outlined, color: Colors.black,),
                          SizedBox(width: 7),
                          Text("Account information", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600))
                        ],
                      ),
                      children: [
                        ListTile(
                          title: Text("Username", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
                          subtitle: Text("${context.watch<UserProfileProvider>().username}", style: GoogleFonts.poppins(color: Colors.grey)),
                          trailing: GestureDetector(
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUsername()));},
                            child: Text("Edit username", style: GoogleFonts.poppins(),),
                          )
                        ),
                        ListTile(
                          title: Text("Email", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
                          subtitle: Text("${context.watch<UserProfileProvider>().email}", style: GoogleFonts.poppins(color: Colors.grey)),
                        ),
                        ListTile(
                          title: Text("Username", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
                          subtitle: Row(
                            children: List.generate(10, (index) {
                              return Container(width: 8, height: 8, 
                                margin: EdgeInsets.fromLTRB(0, 5, 3, 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                              );
                            }),
                          ),
                          trailing: GestureDetector(
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));},
                            child: Text("Change Password", style: GoogleFonts.poppins(),),
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }
}