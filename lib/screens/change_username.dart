import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:health_mobile_app/components/input_field.dart';
import 'package:health_mobile_app/providers/user_profile_provider.dart';

class ChangeUsername extends StatelessWidget {
  const ChangeUsername({super.key});

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
                onPressed: () { 
                  context.read<UserProfileProvider>().clearController();
                  context.read<UserProfileProvider>().resetinvalidMsg();
                  Navigator.pop(context);
                },
                style: IconButton.styleFrom(overlayColor: Colors.transparent),
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 20)
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Edit username", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputField(
                    inputType: "username",
                    inputTitle: "New username",
                    controller: context.watch<UserProfileProvider>().newusernameC, 
                    invalidMsg: context.watch<UserProfileProvider>().invalidMsgUsername
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputField(
                    inputType: "password",
                    inputTitle: "Current password",
                    controller: context.watch<UserProfileProvider>().currentpasswordC, 
                    invalidMsg: context.watch<UserProfileProvider>().invalidMsgCurrentPassword
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () { 
                    context.read<UserProfileProvider>().confirmCurrentPassword(); 
                    context.read<UserProfileProvider>().checkUsernameValidity();
                    bool isChanged = context.read<UserProfileProvider>().changeUsername();

                    if (isChanged) Navigator.pop(context);
                  }, 
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(18, 15, 18, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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