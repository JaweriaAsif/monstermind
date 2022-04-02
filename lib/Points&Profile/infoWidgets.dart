import 'package:flutter/material.dart';
import 'package:monstermind/signup2.dart';

//Avatar + username
class PicAndName extends StatelessWidget {
  const PicAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //avatar image
        Image(
          width: 170,
          height: 170,
          image: (user.gender == "Male")
              ? (const AssetImage('assets/images/boy avatar.png'))
              : (const AssetImage('assets/images/girl avatar.png')),
          fit: BoxFit.fill,
        ),

        //username
        Text(
          user.name,
          style: const TextStyle(
            color: Color(0xff12777D),
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}

//points
class Points extends StatefulWidget {
  const Points({Key? key}) : super(key: key);

  @override
  State<Points> createState() => PointsState();
}

class PointsState extends State<Points> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Row general widget for gender + age
class infoRow extends StatelessWidget {
  const infoRow({
    Key? key,
    required this.info,
    required this.title,
  }) : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title + ": "),
        Text(info),
      ],
    );
  }
}
