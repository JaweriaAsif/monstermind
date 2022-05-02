import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/googleSignIn.dart';
import 'package:monstermind/controllers/userController.dart';
import 'package:monstermind/views/Points&Profile/userInfo.dart';
import 'package:monstermind/views/button.dart';
import 'package:monstermind/views/mainPage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        //custom back button
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: halkaBlue,
            ),
          ),
        ),
        //logout icon
        actions: [
          InkWell(
            onTap: () {
              UserController().setLoggedIn(false);
              _handleSignOut();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.power_settings_new, size: 25, color: halkaBlue),
                  Text(
                    "Log Out",
                    style: TextStyle(
                        fontSize: 11,
                        color: halkaBlue,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //monsters image
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Image(
                image: AssetImage('assets/images/Profile.png'),
                fit: BoxFit.fill,
              ),
            ),

            //info
            const UserInfo(),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignOut() => googleSignIn.disconnect();
}
