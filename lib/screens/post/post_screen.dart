import 'package:flutter/material.dart';
import 'package:ricciwawa/constants.dart';

class PostScreeen extends StatelessWidget {
  const PostScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Post",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Post",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(primary: kDarkRed),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "Add Title in Post",
                fillColor: kTextFieldBackGround,
                filled: true,
                hintStyle: TextStyle(color: kLightGreyColor)),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            minLines: 10,
            maxLines: 12,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: "Description with #hashtag or @Friends",
                fillColor: kTextFieldBackGround,
                filled: true,
                hintStyle: TextStyle(color: kLightGreyColor)),
          ),
          SizedBox(
            height: 20,
          ),
          PostOptions(
            text: "Add to Playlist",
            icon: Icons.navigate_next,
          ),
          SizedBox(
            height: 10,
          ),
          PostOptions(
            text: "Who can view this post?",
            icon: Icons.navigate_next,
            textWithIcon: "Subscribers",
          ),
          SizedBox(
            height: 10,
          ),
          PostOptions(
            text: "Add Quiz",
            icon: Icons.attachment,
          ),
        ],
      ),
    );
  }
}

class PostOptions extends StatelessWidget {
  final String text;
  final IconData icon;
  final String? textWithIcon;
  const PostOptions(
      {Key? key, required this.text, required this.icon, this.textWithIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.white, fontSize: 15),
          ),
          if (textWithIcon != null) ...[
            Spacer(),
            Text(textWithIcon ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.white, fontSize: 15)),
          ],
          Icon(icon, color: Colors.white)
        ],
      ),
    );
  }
}
