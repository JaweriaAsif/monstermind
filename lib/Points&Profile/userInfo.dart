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
      padding: const EdgeInsets.only(bottom: 60),
      child: Column(
        children: [
          const PicAndName(),
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 25),
            child: Points(),
          ),
          infoRow(title: "Gender", info: user.gender),
          const SizedBox(height: 5),
          infoRow(
            title: "Age",
            info: calculateAge(),
          ),
        ],
      ),
    );
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

  //age in months
  if (age == 0) {
    int months = 0;

    //born this year
    if (currentDate.year == birthDate.year) {
      months = month1 - month2;
      if (day2 > day1) months--;
      return months.toString() + " months";
    }

    //born last year
    months = 12 - month2 + month1;
    if (day2 > day1) months--;
    return months.toString() + " months";
  }

  //age in years
  return age.toString() + " years";
}
