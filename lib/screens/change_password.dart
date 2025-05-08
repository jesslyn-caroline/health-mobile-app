import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_mobile_app/components/change_user_info_field.dart';
import 'package:health_mobile_app/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  context.read<ProfileProvider>().clearController();
                  context.read<ProfileProvider>().resetErrorMessage();
                  Navigator.pop(context);
                },
                style: IconButton.styleFrom(overlayColor: Colors.transparent),
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 20)
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Change Password", style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w700)),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ChangeUserInfoField(
                    inputType: "password",
                    inputTitle: "Current password",
                    controller: context.watch<ProfileProvider>().passwordC, 
                    errorMessage: context.watch<ProfileProvider>().passwordErrorMessage
                )
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ChangeUserInfoField(
                    inputType: "password",
                    inputTitle: "New password",
                    controller: context.watch<ProfileProvider>().newPasswordC, 
                    errorMessage: context.watch<ProfileProvider>().newPasswordErrorMessage
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ChangeUserInfoField(
                    inputType: "password",
                    inputTitle: "Confirm new password",
                    controller: context.watch<ProfileProvider>().confirmNewPasswordC, 
                    errorMessage: context.watch<ProfileProvider>().confirmPasswordErrorMessage
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () { 
                    context.read<ProfileProvider>().confirmCurrentPassword();
                    context.read<ProfileProvider>().checkNewPassword(); 
                    bool isChanged = context.read<ProfileProvider>().changePassword();
                    if (isChanged) {
                      Navigator.pop(context);
                    }
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(16, 15, 18, 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  child: Text("Change", style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600))
                )
              )
            ]
          )
        )
      )
    );
  }
}