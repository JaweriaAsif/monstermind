import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/views/Points&Profile/userInfo.dart';

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
}
