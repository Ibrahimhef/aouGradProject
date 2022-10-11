import 'package:saudi_toursim_guide/constants.dart';
import 'package:flutter/material.dart';
import 'package:saudi_toursim_guide/models/comments.dart';
import 'package:saudi_toursim_guide/resources/auth_methods.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);
  static String id = 'Comment_screen';

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<CommentModel> comments = [];

  var msgController = TextEditingController();
  String username = AuthMethods().getUsername().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: username,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                          text: msgController.text,
                          style: TextStyle(color: Colors.black)),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            ///to save data after press done after writing the comment
            textInputAction: TextInputAction.done,
            decoration: kTextfeldDecor.copyWith(hintText: 'Enter your comment'),
            ///store input in local variable using onChange
            onChanged: (text){
              setState(() {
                msgController.text = text;
              });
              print("onChanged ==> "+ text);
            },
            controller: msgController,
            onSubmitted: (String val){
              print("onSubmitted ==> "+ val);
              setState(() {
                ///add item to the list
                comments.add(CommentModel(msgController.text, username));
                ///redeclare variable
                msgController.clear();
              });
             comments.forEach((element) {
               print("onSubmitted ==> ${element.comment}");
               print("comments length ==> "+ comments.length.toString());
            });
            },
          ),
        ],
      ),
    );
  }
}
