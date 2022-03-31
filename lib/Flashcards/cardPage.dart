import 'package:flutter/material.dart';
import 'package:monstermind/Flashcards/cardContent.dart';
import 'package:monstermind/Flashcards/flashCard.dart';
import 'package:monstermind/avatar.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

class CardPage extends StatefulWidget {
  const CardPage({
    Key? key,
    required this.from,
  }) : super(key: key);

  final String from;

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List list = [];
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = CardContent(from: widget.from).list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD3BDF4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AvatarAppbar(),
            ColumnSuper(
              children: [
                FlashCard(
                  content: list[index],
                  from: widget.from,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(
                        height: 200,
                        image: AssetImage('assets/images/remi.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Row(
                        children: [
                          //back arrow
                          Visibility(
                            visible: index != 0,
                            child: IconButton(
                              onPressed: () {
                                index--;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Color(0xff946DDF),
                                size: 50,
                              ),
                            ),
                          ),
                          //space
                          const SizedBox(width: 20),
                          //front arrow
                          IconButton(
                            onPressed: () {
                              index == list.length - 1 ? index = 0 : index++;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xff946DDF),
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              innerDistance: -50.0,
            ),
          ],
        ),
      ),
    );
  }
}
