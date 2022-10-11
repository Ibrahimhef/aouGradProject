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

  String? comment;
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                          text: comment,
                          style: TextStyle(color: Colors.black)),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: kTextfeldDecor.copyWith(hintText: 'Enter your comment'),
            onSubmitted: (String val){
              comment = val;
              setState(() {
                comments = [CommentModel(val, username)];
              });
             comments.forEach((element) {print(element.comment);
             print(comments.length);});
            },
          ),

        ],
      ),
    );
  }
}