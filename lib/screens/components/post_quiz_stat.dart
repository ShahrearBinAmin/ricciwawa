import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class PostQuizStatListView extends StatefulWidget {
  final Function onItemClick;
  const PostQuizStatListView({Key? key, required this.onItemClick})
      : super(key: key);

  @override
  _PostQuizStatListViewState createState() => _PostQuizStatListViewState();
}

class _PostQuizStatListViewState extends State<PostQuizStatListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return PostQuizStat(
              onItemClick: widget.onItemClick,
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 10,
              ),
          itemCount: 5),
    );
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
        decoration: BoxDecoration(
            border: Border.all(color: kLightGreyColor),
            borderRadius: BorderRadius.circular(15)),
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
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "5 - 8 - 2021     14:30",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "88%",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
