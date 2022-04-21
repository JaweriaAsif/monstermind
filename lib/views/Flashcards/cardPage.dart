import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/models/firebaseFunctions.dart';
import 'package:monstermind/views/Flashcards/flashCard.dart';
import 'package:monstermind/views/avatar.dart';
import 'package:provider/provider.dart';

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
    // print(FirebaseFunctions.getImageUrl("remi"));
    context.watch<CardContent>().list;
    list = context.read<CardContent>().getList(widget.from);

    return Scaffold(
      backgroundColor: const Color(0xffD3BDF4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AvatarAppbar(),
            ColumnSuper(
              children: [
                //card
                FlashCard(
                  content: list[index],
                  from: widget.from,
                ),

                //monster + arrow buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //remi
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(
                        image: FirebaseImage(
                            'gs://monstermind-d1783.appspot.com/assets/images/remi.png'),
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),

                    //arrows
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