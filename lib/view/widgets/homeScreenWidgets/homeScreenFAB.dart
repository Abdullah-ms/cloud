import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/fetchData.dart';
import '../../../constants/my_url_button.dart';
import '../../../constants/variables.dart';
import '../../../feedback/botFB.dart';

class HomeScreenFBA extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color qualityTextLogoColor;
  final Color colorOfFBAIcon;
  final Color colorOFFBAIconBackground;
  final Color FBAppbarbackgroundColor;

  const HomeScreenFBA({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.qualityTextLogoColor,
    required this.colorOfFBAIcon,
    required this.colorOFFBAIconBackground, required this.FBAppbarbackgroundColor,
  }) : super(key: key);

  @override
  State<HomeScreenFBA> createState() => _HomeScreenFBAState();
}

class _HomeScreenFBAState extends State<HomeScreenFBA> {

  bool _showBackToTopButton = false;

// scroll controller
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 200) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  //----------------------------------------

  final bool _isLoading = false; //bool variable created

  void launchTelegram() async {
    String url = "https://telegram.me/<@qcsupportBot>";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // This is our back-to-top button
        Align(
          alignment: Alignment.bottomRight,
          child: Wrap(
            children: <Widget>[
              Column(
                children: [
                  FloatingActionButton.small(
                    tooltip: "Feedback Us",
                    elevation: 10,
                    //hoverColor: Colors.green,
                    hoverElevation: 20,
                    heroTag: "f10",
                    backgroundColor: widget.colorOFFBAIconBackground,
                    // const Color.fromRGBO(42, 171, 238, 1),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            elevation: 0,
                            insetAnimationCurve: Curves.easeInCubic,
                            child: BotFB(FBAppbarbackgroundColor: widget.FBAppbarbackgroundColor,),
                          );
                        },
                      );
                    },
                    // Feedback,
                    child: Icon(
                      Icons.telegram,
                      size: 40,
                      color: widget.colorOfFBAIcon,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  _showBackToTopButton == true
                      ? FloatingActionButton.small(
                          heroTag: "f20",
                          backgroundColor: widget.colorOFFBAIconBackground,
                          onPressed: _scrollToTop,
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 15,
                            color: widget.colorOfFBAIcon,
                          ))
                      : const SizedBox(
                          height: 3,
                        ),
                  SizedBox(
                    height: 28.0,
                    width: 50.0,
                    child: FittedBox(
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 10.0,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText(
                              widget.text1,
                              textStyle: GoogleFonts.pacifico(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: widget.qualityTextLogoColor,
                              ),
                            ),
                            RotateAnimatedText(
                              widget.text2,
                              textStyle: GoogleFonts.pacifico(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: widget.qualityTextLogoColor,
                              ),
                            ),
                            RotateAnimatedText(
                              widget.text3,
                              textStyle: GoogleFonts.pacifico(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: widget.qualityTextLogoColor,
                              ),
                            ),
                          ],
                          repeatForever: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //button first
              // Add more buttons here
            ],
          ),
        ),
      ],
    );
  }
}
