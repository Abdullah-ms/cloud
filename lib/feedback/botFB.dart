import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';
import 'chatbot.dart';

class BotFB extends StatefulWidget {
  final Color FBAppbarbackgroundColor ;
   BotFB({Key? key, required this.FBAppbarbackgroundColor}) : super(key: key);

  @override
  State<BotFB> createState() => _BotFBState();
}

class _BotFBState extends State<BotFB> {
  final _formKey = GlobalKey<FormState>();
  final messageController = TextEditingController();

  //******************** chatbot

  final TelegramClient telegramClient = TelegramClient(
    chatId: "@qcsupport",
    botToken: "5857300801:AAFjiBN6KOELO9958Dss-_zj640YNXiZyhc",
  );

  Future<void> _mybot() async {
    setState(() {
      telegramClient;
    });
    final response = await telegramClient.sendMessage(
        messageController.value.text +
            "\n ----------------- " +
            "\n Sent by : " +
            "\n user ID : $idShow , username : $usernameShow , tag : $tagShow"
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100], //const Color(0xfff5f5fd),
      appBar: AppBar(
       backgroundColor: widget.FBAppbarbackgroundColor,
        ),
      body: Center(
        child: Container(
          height: 450,
          width: 400,
          margin: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: Colors.grey[300]!)
              ]),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Feedback Us, ',
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      /*TextSpan(
                        text: '$usernameShow',
                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),*/
                    ],
                  ),
                ),
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(hintText: 'type here ...'.tr),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 45,
                  width: 110,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff151534),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () async {
                      _mybot();
                      messageController.clear();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Thank you, your message sent successfully'),
                            content: const Text('Know that your opinion is important to us'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Close the dialog and delete the item
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child:
                    Text('Send'.tr, style: const TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
