import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class StudenPostQuizStatListView extends StatefulWidget {
  final Function onItemClick;
  const StudenPostQuizStatListView({Key? key, required this.onItemClick})
      : super(key: key);

  @override
  _StudenPostQuizStatListViewState createState() =>
      _StudenPostQuizStatListViewState();
}

class _StudenPostQuizStatListViewState
    extends State<StudenPostQuizStatListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return PostQuizStat(
            onItemClick: widget.onItemClick,
          );
        },
        // separatorBuilder: (BuildContext context, int index) => Divider(
        //       height: 10,
        //       color: kDarkGrey,
        //     ),
        itemCount: 10);
  }
}

class PostQuizStat extends StatefulWidget {
  final Function onItemClick;

  const PostQuizStat({Key? key, required this.onItemClick}) : super(key: key);

  @override
  _PostQuizStatState createState() => _PostQuizStatState();
}

class _PostQuizStatState extends State<PostQuizStat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onItemClick();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(color: kDarkGrey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              placeholder: (context, url) =>
                  Image.asset("assets/images/post_placeholder.png"),
              imageUrl: "https://imgur.com/uHZ3Mim.png",
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Future of Labour",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "DanielCraig",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "   5-8-2021",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                "88%",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
