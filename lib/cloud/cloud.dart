
import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import '../constants/variables.dart';
import '../core/constants/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../search/cloud_search.dart';
import '../view/widgets/mainToAll/appBarNotificationButton.dart';
import '../view/widgets/mainToAll/appbarTitle.dart';
import '../view/widgets/mainToAll/feedBack.dart';
import '../view/widgets/mainToAll/footer.dart';
import 'cloud_helper.dart';
import 'cloud_Notification.dart';
import 'cloud_facebook.dart';
import 'cloud_instagram.dart';
import 'cloud_newFAQ.dart';
import 'cloud_newScript.dart';
import 'dart:async';

class CloudHome extends StatefulWidget {
  const CloudHome({Key? key}) : super(key: key);

  @override
  State<CloudHome> createState() => _CloudHomeState();
}

class _CloudHomeState extends State<CloudHome> {

  @override
  void initState() {
    super.initState();
    getDataMyUpdates();
  }

  bool darkMode() {
    setState(() {
      cloudMainColor = darkappbar;
      lightbackground = darkbackground;
      lightappbartitle = darkappbartitle;
      lighttextandtitle = darktextandtitle;
      iconcolor = darkcolor;
      lightbodycolor = darkbodycolor;
      lightdialogbackground = darkdialogbackground;
      lightsubiconcolor = darksubiconcolor;
      lightFAB = darkFAB;
      lightring = darkring;
      lightdropdownColor = darkdropdownColor;
      mylight = mydark;
    });
    return true;
  }

  bool lightMode() {
    setState(() {
      cloudMainColor = Color.fromRGBO(2, 32, 252, 1);
      lightbackground = Color.fromRGBO(255, 255, 255, 1);
      lightappbartitle = Color.fromRGBO(255, 255, 255, 1);
      lighttextandtitle = Color.fromRGBO(0, 0, 38, 1);
      iconcolor = Color.fromRGBO(244, 26, 32, 1);
      lightbodycolor = Colors.black;
      lightdialogbackground = Colors.white;
      lightMainBackground = Color.fromRGBO(230, 233, 238, 1);
      lightcolorOFFABbackground = Color.fromRGBO(255, 255, 255, 1);
      lightsubiconcolor = Color.fromRGBO(244, 26, 32, 1);
      lightFAB = Color.fromRGBO(0, 128, 128, 0.7);
      lightring = Color.fromRGBO(0, 128, 128, 0.07);
      lightdropdownColor = Colors.white;
      mydropFocusColor = Color.fromRGBO(214, 63, 121, 1);
      lightactionicons = Color.fromRGBO(255, 255, 255, 1);
      mylight = Color.fromRGBO(7, 137, 140, 0.4);
      mylightlight = Color.fromRGBO(7, 137, 140, 0.08);
      lightexpandlistcolor1 = Color.fromRGBO(232, 233, 235, 1);
      lightexpandlistcolor2 = Color.fromRGBO(190, 195, 198, 1);
      lighttextlogo = Color.fromRGBO(40, 55, 71, 1);
    });
    return true;
  }

  List cloudMyUpdates = [];

  Future readDataMyUpdates() async {
    var url = "http://10.4.1.208/myphpcloud/mylinks/myupdates.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      setState(() {
        cloudMyUpdates.addAll(resBody);
      });
    }
  }

  getDataMyUpdates() async {
    await readDataMyUpdates();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightdialogbackground,
      appBar: AppBar(
        backgroundColor: cloudMainColor,
        title: const AppBarTitle(
          title: 'Cloud Knowledge Base',
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const Dialog(
                      elevation: 0,
                      insetAnimationCurve: Curves.easeInCubic,
                      child: AlnukhbaSearchAPI(),
                    );
                  },
                );
              },
              icon: const Icon(Icons.search),
              color: Colors.white),
          cloudMyUpdates.isEmpty
              ? const CircularProgressIndicator(
                  color: Colors.transparent,
                )
              : AppBarNotificationButton(
                  updateBodyText: '${cloudMyUpdates[0]["body"]}',
                ),
          AnimateIcons(
            startIcon: Icons.lightbulb_outline,
            endIcon: Icons.lightbulb_outline,
            size: 20.0,
            controller: AnimateIconController(),
            onStartIconPress: () => darkMode(),
            onEndIconPress: () => lightMode(),
            duration: const Duration(milliseconds: 500),
            startIconColor: Colors.yellowAccent,
            endIconColor: AppColor.grey,
            clockwise: true,
          ),
/*          const VerticalDivider(
            thickness: 1,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          const LogOutButton(),
          const SizedBox(
            width: 5,
          ),*/
        ],
        toolbarHeight: 50,
        leading: Image.asset(
          "assets/images/cloudTrans.png", color: Colors.yellowAccent,
        ),
      ),
      floatingActionButton: FeedBackHome(
        text1: 'Technical',
        text2: 'Support',
        text3: 'Quality',
        qualityTextLogoColor: lighttextandtitle,
        colorOfFBAIcon: Colors.white,
        colorOFFBAIconBackground: cloudMainColor,
        FBAppbarbackgroundColor: cloudMainColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroundLogo.png'),
                fit: BoxFit.fill,
                opacity: 0.1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: lighttextandtitle, width: 1)),
                  child: Row(
                    children: [
                      Spacer(
                        flex: 20,
                      ),
                      CloudFacebook(),
                      SizedBox(
                        width: 10,
                      ),
                      CloudInstagram(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // Expanded(flex: 1, child: CloudCheckList()),
                    Expanded(flex: 1, child: CloudScriptNew()),
                    Expanded(flex: 1, child: CloudFAQsNew()),
                    Expanded(flex: 1, child: CloudHelper()),
                    Expanded(flex: 2, child: CloudNotification()),
                  ],
                ),
                const SizedBox(
                  height: 700,
                ),
                Footer(
                  footerColor: cloudMainColor,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
