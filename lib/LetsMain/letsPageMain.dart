import 'package:flutter/material.dart';
import 'package:monstermind/avatar.dart';

class LetsPageMain extends StatelessWidget {
  const LetsPageMain({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.titleColour,
    required this.list,
  }) : super(key: key);

  final String imgPath;
  final String title;
  final Color titleColour;
  final Widget list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AvatarAppbar(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage(imgPath),
              fit: BoxFit.fill,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: titleColour,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(child: list),
        ],
      ),
    );
  }
}
