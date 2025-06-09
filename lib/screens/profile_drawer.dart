import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_mobile_app/providers/profile_provider.dart';
import 'package:health_mobile_app/screens/change_password.dart';
import 'package:health_mobile_app/screens/change_username.dart';
import 'package:provider/provider.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 400,
      shape: RoundedRectangleBorder(),
      // backgroundColor: Colors.white,
      child: ListView(
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.all(0)
                    ),
                    icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 23, 
                      backgroundColor: Color(0xFFD9D9D9),
                      child: Text(context.watch<ProfileProvider>().username[0], style: GoogleFonts.poppins(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(width: 13,),
                    Text(context.watch<ProfileProvider>().username, style: GoogleFonts.poppins(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600))
                  ],
                )
              ],                    
            ),
          ),
          ExpansionTile(
            shape: Border(),
            tilePadding: EdgeInsets.symmetric(horizontal: 23, vertical: 5),
            backgroundColor: Color(0xFFFAFAFA),
            title: Row(
              children: [
                Icon(Icons.account_circle_outlined),
                SizedBox(width: 8),
                Text("Account Information", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600))
              ]
            ),
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 23),
                title: Text("Username", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
                subtitle: Text(context.watch<ProfileProvider>().username, style: GoogleFonts.poppins(color: Colors.grey, fontSize: 13)),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUsername()));
                  },
                  child: Text("Edit username", style: GoogleFonts.poppins(fontSize: 12))
                )
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 23),
                title: Text("E-mail", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
                subtitle: Text(context.watch<ProfileProvider>().email, style: GoogleFonts.poppins(color: Colors.grey, fontSize: 13))
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 23),
                title: Text("Password", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
                subtitle: Row(
                  children: List.generate(10, (index) {
                    return Container(width: 8, height: 8, 
                      margin: EdgeInsets.fromLTRB(0, 5, 3, 5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)
                      )
                    );
                  })
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
                  },
                  child: Text("Change password", style: GoogleFonts.poppins(fontSize: 12))
                )
              )
            ]
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 23),
            leading: Icon(Icons.dark_mode_rounded, size: 20),
            title: Text("Dark Mode", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
            trailing: Switch(
              activeColor: Color(0xFF0369A1),
              value: context.watch<ProfileProvider>().isDark,
              onChanged: (bool value) => context.read<ProfileProvider>().switchMode(value),
            )
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 23),
            leading: Icon(Icons.notifications_rounded, size: 20),
            title: Text("Enable Notification", style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
            trailing: Switch(
              activeColor: Color(0xFF0369A1),
              value: context.watch<ProfileProvider>().isNotificationOn,
              onChanged: (bool value) => context.read<ProfileProvider>().switchNotification(value),
            )
          )
        ]
      )
    );
  }
}