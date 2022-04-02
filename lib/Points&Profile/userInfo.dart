import 'package:flutter/material.dart';
import 'package:monstermind/Points&Profile/infoWidgets.dart';
import 'package:monstermind/signup2.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const PicAndName(),
            const Points(),
            infoRow(info: "Gender", title: user.gender),
            infoRow(
              title: "Age",
              info: calculateAge(),
            ),
          ],
        ));
  }
}

String calculateAge() {
  DateTime currentDate = DateTime.now();
  DateTime birthDate = user.DOB!;

  int age = currentDate.year - birthDate.year;

  int month1 = currentDate.month;
  int month2 = birthDate.month;

  int day1 = currentDate.day;
  int day2 = birthDate.day;

  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    if (day2 > day1) {
      age--;
    }
  }

  if (age == 0) {
    if (day2 > day1) {
      return (11 - month1 + month2).toString() + " months";
    }
    return (12 - month1 + month2).toString() + " months";
  }
  return age.toString() + " years";
}
