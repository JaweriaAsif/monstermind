import 'package:flutter/material.dart';
import 'package:monstermind/controllers/cardContent.dart';
import 'package:monstermind/controllers/games/gameController.dart';
import 'package:monstermind/controllers/tts.dart';
import 'package:monstermind/views/Games/drawingGame.dart';
import 'package:monstermind/views/Games/game.dart';
import 'package:provider/provider.dart';

List alphabets = [];
late int ques;

// class AlphabetDraw extends StatefulWidget {
//   const AlphabetDraw({Key? key}) : super(key: key);

//   @override
//   State<AlphabetDraw> createState() => _AlphabetDrawState();
// }

// class _AlphabetDrawState extends State<AlphabetDraw> {
//   final String _model = 'en-US';

//   DigitalInkRecognitionState get state => Provider.of(context, listen: false);
//   late DigitalInkRecognition _recognition;

//   double get _width => MediaQuery.of(context).size.width;
//   double _height = 340;

//   @override
//   void initState() {
//     _recognition = DigitalInkRecognition(model: _model);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _recognition.dispose();
//     super.dispose();
//   }

//   // need to call start() at the first time before painting the ink
//   Future<void> _init() async {
//     //print('Writing Area: ($_width, $_height)');
//     await _recognition.start(writingArea: Size(_width, _height));
//     // always check the availability of model before being used for recognition
//     await _checkModel();
//   }

//   // reset the ink recognition
//   Future<void> _reset() async {
//     state.reset();
//     await _recognition.start(writingArea: Size(_width, _height));
//   }

//   Future<void> _checkModel() async {
//     bool isDownloaded = await DigitalInkModelManager.isDownloaded(_model);

//     if (!isDownloaded) {
//       await DigitalInkModelManager.download(_model);
//     }
//   }

//   Future<void> _actionDown(Offset point) async {
//     state.startWriting(point);
//     await _recognition.actionDown(point);
//   }

//   Future<void> _actionMove(Offset point) async {
//     state.writePoint(point);
//     await _recognition.actionMove(point);
//   }

//   Future<void> _actionUp() async {
//     state.stopWriting();
//     await _recognition.actionUp();
//   }

//   Future<void> _startRecognition() async {
//     if (state.isNotProcessing) {
//       state.startProcessing();
//       // always check the availability of model before being used for recognition
//       await _checkModel();
//       state.data = await _recognition.process();
//       // print("list: ${state.data}");
//       state.stopProcessing();
//     }
//   }

//   Widget _buildClearButton() {
//     return Padding(
//       padding: const EdgeInsets.all(4),
//       child: FloatingActionButton.small(
//         heroTag: null,
//         tooltip: "Clear",
//         onPressed: _reset,
//         disabledElevation: 0,
//         backgroundColor: Colors.white,
//         child: const Icon(
//           Icons.delete_forever,
//           color: Color(0xffb51818),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     alphabets = context.watch<CardContent>().alphabetList();
//     ques = GameController().getquest(alphabets);

//     setTtsConfig();
//     flutterTts.speak(
//         "Draw the alphabet ${alphabets[ques].toString().substring(0, 1)}");

//     // _reset();

//     return Column(
//       children: [
//         Stack(
//           children: [
//             //canvas and border
//             Center(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: _width - 20,
//                     height: _height - 20,
//                     color: Color(int.parse(Brown)),
//                   ),

//                   //canvas
//                   Builder(
//                     builder: (_) {
//                       _init();

//                       return GestureDetector(
//                         onScaleStart: (details) async =>
//                             await _actionDown(details.localFocalPoint),
//                         onScaleUpdate: (details) async =>
//                             await _actionMove(details.localFocalPoint),
//                         onScaleEnd: (details) async => await _actionUp(),
//                         child: Consumer<DigitalInkRecognitionState>(
//                           builder: (_, state, __) => CustomPaint(
//                             painter:
//                                 DigitalInkPainter(writings: state.writings),
//                             child: SizedBox(
//                               width: _width - 30,
//                               height: _height - 30,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             //erase button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: _buildClearButton(),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 15),
//         Btn(
//           text: "Done",
//           onPress: () async {
//             await _startRecognition();
//             print("list: ${state.toCompleteString()}");

//             bool isCorrect = GameController().checkDrawing(
//               ques: alphabets[ques].toString().substring(0, 1),
//               ans: state.toCompleteString(),
//               speak:
//                   "Draw the alphabet ${alphabets[ques].toString().substring(0, 1)}",
//               context: context,
//             );
//             if (isCorrect) {
//               _reset();
//               context.read<PointsProvider>().addPoints(10);
//               setState(() {});
//             } else {
//               _reset();
//             }
//           },
//           alignment: Alignment.bottomCenter,
//         ),
//       ],
//     );
//   }
// }

class AlphabetDrawingGame extends StatefulWidget {
  const AlphabetDrawingGame({Key? key}) : super(key: key);

  @override
  State<AlphabetDrawingGame> createState() => Alphabet_DrawingGameState();
}

class Alphabet_DrawingGameState extends State<AlphabetDrawingGame> {
  @override
  Widget build(BuildContext context) {
    alphabets = context.watch<CardContent>().alphabetList();
    ques = GameController().getquest(alphabets);
    return Game(
        question: "Draw the alphabet from the audio",
        list: DrawingGame(
          ques: alphabets[ques].toString().substring(0, 1),
          speak:
              "Draw the alphabet ${alphabets[ques].toString().substring(0, 1)}",
        ),
        onPressed: () {
          flutterTts.speak(
              "Draw the alphabet ${alphabets[ques].toString().substring(0, 1)} ");
        });
  }
}
