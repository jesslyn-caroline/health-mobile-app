import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:health_mobile_app/providers/user_profile_provider.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                style: IconButton.styleFrom(overlayColor: Colors.transparent),
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 20)
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Change password", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Current password", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),
                      TextField(
                        controller: context.watch<UserProfileProvider>().currentpasswordC,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 3, 5, 3),
                          hintStyle: GoogleFonts.poppins(color: Color(0xFF898989), fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.poppins(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFF1E1E1E))
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFFC8C8C8))
                          ),
                          hintText: "Enter current password",
                          errorText: context.watch<UserProfileProvider>().isPassword ? null: "Password not match!"
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () { context.read<UserProfileProvider>().confirmCurrentPassword(); }, 
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(18, 15, 18, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                  ),
                  child: Text("Change", style: GoogleFonts.poppins(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),)
                )
              )
            ],
          ),
        )
      ),
    );
  }
}