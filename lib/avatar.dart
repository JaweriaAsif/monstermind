import 'package:flutter/material.dart';
import 'package:monstermind/signup2.dart';

class Avatar extends StatefulWidget {
  Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => AvatarState();
}

class AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  color: Color(0xff1D9EA6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 70,
              height: 70,
              child: Image(
                image: (user.gender == "Male")
                    ? (const AssetImage('assets/images/boy avatar.png'))
                    : (const AssetImage('assets/images/girl avatar.png')),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
