import 'package:flutter/material.dart';
import 'package:monstermind/signup2.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

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
        child: RowSuper(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 100),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 3, 25, 3),
                      child: Text(
                        user.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    color: const Color(0xff1D9EA6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Align(
                    child: Text(
                      "${user.points} points",
                      style: const TextStyle(
                        color: Color(0xff1D9EA6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ],
            ),
            Image(
              width: 70,
              height: 70,
              image: (user.gender == "Male")
                  ? (const AssetImage('assets/images/boy avatar.png'))
                  : (const AssetImage('assets/images/girl avatar.png')),
              fit: BoxFit.fill,
            ),
          ],
          innerDistance: -30.0,
        ),
      ),
    );
  }
}

class AvatarAppbar extends StatelessWidget {
  AvatarAppbar({
    Key? key,
    this.back = true,
    this.onBack,
  }) : super(key: key);

  final bool back;
  Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: back
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //back button

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: onBack,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff1D9EA6),
                    ),
                  ),
                ),

                const Avatar(),
              ],
            )
          : const Avatar(),
    );
  }
}
