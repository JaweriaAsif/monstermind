import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:monstermind/controllers/colors.dart';
import 'package:monstermind/controllers/ssController.dart';
import 'package:scribble/scribble.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_digital_ink_recognition/learning_digital_ink_recognition.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;
import 'package:screenshot/screenshot.dart';

class DrawMain extends StatefulWidget {
  const DrawMain({Key? key}) : super(key: key);

  //  final String title;

  @override
  State<DrawMain> createState() => _DrawMainState();
}

class _DrawMainState extends State<DrawMain> {
  late ScribbleNotifier notifier;
  ScreenshotController screenshotController = ScreenshotController();
  SSController _ssController = SSController();

  // String _model = 'en-US';
  // DigitalInkRecognition recognition = DigitalInkRecognition(model: _model);
  // late DigitalInkRecognition _recognition;
  // List<RecognitionCandidate> data = [];
  // bool isProcessing = false;

  // @override
  // void dispose() {
  //   _recognition.dispose();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  void initState() {
    notifier = ScribbleNotifier();
    // _recognition = DigitalInkRecognition(model: _model);
    // _init();

    super.initState();
  }

  // Future<void> _checkModel() async {
  //   bool isDownloaded = await DigitalInkModelManager.isDownloaded(_model);

  //   if (!isDownloaded) {
  //     await DigitalInkModelManager.download(_model);
  //   }
  // }

  // Future<void> _init() async {
  //   //print('Writing Area: ($_width, $_height)');
  //   await _recognition.start(
  //       writingArea: Size(MediaQuery.of(context).size.width,
  //           MediaQuery.of(context).size.height));
  //   // always check the availability of model before being used for recognition
  //   await _checkModel();
  // }

  // Future<void> _startRecognition() async {
  //   if (!isProcessing) {
  //     //   state.startProcessing();
  //     isProcessing = true;
  //     // always check the availability of model before being used for recognition
  //     await _checkModel();
  //     data = await _recognition.process();
  //     // state.stopProcessing();
  //     isProcessing = false;
  //   }
  // }

  // Future<void> _actionDown(Offset point) async {
  //   await _recognition.actionDown(point);
  // }

  // Future<void> _actionMove(Offset point) async {
  //   await _recognition.actionMove(point);
  // }

  // Future<void> _actionUp() async {
  //   await _recognition.actionUp();
  // }

  // GlobalKey _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    // _recognition
    //     .actionDown(notifier.currentSketch.lines.first.points.first.asOffset);
    // notifier.addListener((state) {
    //   if (state.active) {
    //     _recognition.actionMove(state.pointerPosition!.asOffset);
    //   } else {
    //     _recognition.actionUp();
    //   }
    //   _startRecognition();
    // });

    // _startRecognition();
    // _recognition.actionMove();
    // if (data.isNotEmpty) {
    //   print("Data list index 0 ${data.first}");
    // }

    return Scaffold(
      backgroundColor: const Color(0xffFFF6D8),
      body: Stack(
        children: [
          //canvas
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                // Builder(builder: (_) {

                //   _init();
                //   return GestureDetector(
                //     onTap: () => print("tapped"),
                //     onScaleStart: (details) async {
                //       await _recognition.actionDown(details.localFocalPoint);
                //       setState(() {});
                //       print("Scale started");
                //       if (data.isNotEmpty) {
                //         print("Data list index 0 ${data.first}");
                //       }
                //     },
                //     onScaleUpdate: (details) async {
                //       await _recognition.actionDown(details.localFocalPoint);
                //       setState(() {});
                //       print("Scale updated");
                //       if (data.isNotEmpty) {
                //         print("Data list index 0 ${data.first}");
                //       }
                //     },
                //     onScaleEnd: (details) async {
                //       await _recognition.actionUp();
                //       _startRecognition();
                //       print("Scale ended");
                //       if (data.isNotEmpty) {
                //         print("Data list index 0 ${data.first}");
                //       }
                //     },
                //   );
                // }),
                Screenshot(
                  controller: _ssController.screenshotController,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: const Color(0xffFFF6D8),
                      ),
                      Scribble(
                        notifier: notifier,
                        drawPen: true,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildColorToolbar(context),
                      const Divider(
                        height: 32,
                      ),
                      _buildStrokeToolbar(context),
                    ],
                  ),
                )
              ],
            ),
          ),

          //monster brocolli
          const Align(
            alignment: Alignment.bottomLeft,
            child: Image(
              height: 180,
              image: AssetImage('assets/images/brocolli crop.png'),
              fit: BoxFit.fill,
            ),
          ),

          //back icon button
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff1D9EA6),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _saveImage(BuildContext context) async {
    final image = await notifier.renderImage(format: ui.ImageByteFormat.png);
    screenshotDialog(image, context);
  }

  screenshotDialog(ByteData image, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Your Image"),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.cancel,
                color: btnBlue,
              ),
            ),
          ],
        ),
        //image+button
        content: Column(
          children: [
            Image.memory(image.buffer.asUint8List()),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(btnBlue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: btnBlue),
                  ),
                ),
              ),
              child: const Text("Save to Gallery"),
              onPressed: () {
                //ss
                _ssController.takeScreenshot(context);
              },
            )
          ],
        ),
      ),
    );
  }

  // void takeScreenshot() {
  //   screenshotController
  //       .capture(delay: Duration(milliseconds: 10))
  //       .then((capturedImage) async {
  //     final result = await ImageGallerySaver.saveImage(capturedImage!);
  //     print(result);
  //     Navigator.of(context).pop();
  //     Fluttertoast.showToast(
  //         msg: "Saved image to Gallery", toastLength: Toast.LENGTH_LONG);
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  // }

  Widget _buildStrokeToolbar(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: notifier,
      builder: (context, state, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (final w in notifier.widths)
            _buildStrokeButton(
              context,
              strokeWidth: w,
              state: state,
            ),
        ],
      ),
    );
  }

  Widget _buildStrokeButton(
    BuildContext context, {
    required double strokeWidth,
    required ScribbleState state,
  }) {
    final selected = state.selectedWidth == strokeWidth / 2;

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        elevation: selected ? 4 : 0,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () => notifier.setStrokeWidth(strokeWidth / 2),
          customBorder: const CircleBorder(),
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            width: strokeWidth * 2.7,
            height: strokeWidth * 2.7,
            decoration: BoxDecoration(
                color: state.map(
                  drawing: (s) => Color(s.selectedColor),
                  erasing: (_) => Colors.transparent,
                ),
                border: state.map(
                  drawing: (_) => selected
                      ? Border.all(width: 3, color: Colors.white)
                      : null,
                  erasing: (_) => Border.all(width: 1),
                ),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildColorToolbar(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: notifier,
      builder: (context, state, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildUndoButton(context),
              _buildRedoButton(context),
            ],
          ),
          const Divider(
            height: 15.0,
          ),
          _buildSaveButton(context),
          const Divider(
            height: 2.0,
          ),
          _buildEraserButton(context, isSelected: state is Erasing),
          const Divider(
            height: 2.0,
          ),
          _buildClearButton(context),
          const Divider(
            height: 15.0,
          ),
          Column(
            children: [
              _buildColorButton(context, color: Colors.black, state: state),
              _buildColorButton(context, color: Colors.red, state: state),
              _buildColorButton(context,
                  color: const Color(0xff42bf08), state: state),
              _buildColorButton(context,
                  color: const Color(0xff087fbf), state: state),
              _buildColorButton(context, color: Colors.yellow, state: state),
              _buildColorButton(context,
                  color: const Color(0xff8808bf), state: state),
              _buildColorButton(context,
                  color: const Color(0xfff56e00), state: state),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
        heroTag: null,
        tooltip: "Save image",
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.save_alt_rounded,
          color: Colors.black,
        ),
        onPressed: () => _saveImage(context),
      ),
    );
  }

  Widget _buildEraserButton(BuildContext context, {required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
        heroTag: null,
        tooltip: "Erase",
        backgroundColor: Colors.white,
        elevation: isSelected ? 10 : 2,
        shape: !isSelected
            ? const CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
        child: const FaIcon(FontAwesomeIcons.eraser, size: 20),
        //const Icon(Icons.remove, color: Colors.blueGrey),
        onPressed: notifier.setEraser,
      ),
    );
  }

  Widget _buildColorButton(
    BuildContext context, {
    required Color color,
    required ScribbleState state,
  }) {
    final isSelected = state is Drawing && state.selectedColor == color.value;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
          heroTag: null,
          backgroundColor: color,
          elevation: isSelected ? 10 : 2,
          shape: !isSelected
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
          child: Container(),
          onPressed: () => notifier.setColor(color)),
    );
  }

  Widget _buildUndoButton(
    BuildContext context,
  ) {
    return FloatingActionButton.small(
      heroTag: null,
      tooltip: "Undo",
      onPressed: notifier.canUndo ? notifier.undo : null,
      disabledElevation: 0,
      backgroundColor: notifier.canUndo ? const Color(0xff1D9EA6) : Colors.grey,
      child: const Icon(
        Icons.undo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildRedoButton(
    BuildContext context,
  ) {
    return FloatingActionButton.small(
      heroTag: null,
      tooltip: "Redo",
      onPressed: notifier.canRedo ? notifier.redo : null,
      disabledElevation: 0,
      backgroundColor: notifier.canRedo ? const Color(0xff1D9EA6) : Colors.grey,
      child: const Icon(
        Icons.redo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
        heroTag: null,
        tooltip: "Clear",
        onPressed: notifier.clear,
        disabledElevation: 0,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.delete_forever,
          color: Color(0xffb51818),
        ),
      ),
    );
  }
}
