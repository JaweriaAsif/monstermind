import 'package:flutter/material.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/pointsProvider.dart';
import 'package:monstermind/controllers/userController.dart';
import 'package:provider/provider.dart';

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
          style: TextStyle(
            color: tezBlue,
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
    return Container(
      constraints: BoxConstraints(minWidth: 110),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
          child: Text(
            "${context.watch<PointsProvider>().points} points",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        color: halkaBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

//Row general widget for gender + age
class infoRow extends StatelessWidget {
  const infoRow({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title + ": ",
          style: TextStyle(
            color: tezBlue,
            fontSize: 20,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            color: grey,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
