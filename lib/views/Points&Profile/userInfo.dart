import 'package:flutter/material.dart';
import 'package:monstermind/controllers/userController.dart';

import 'package:monstermind/views/Points&Profile/infoWidgets.dart';
import 'package:provider/provider.dart';

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
            info: context.watch<UserController>().calculateAge(),
          ),
        ],
      ),
    );
  }
}
