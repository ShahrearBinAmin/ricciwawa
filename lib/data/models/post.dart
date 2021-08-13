import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/data/models/user.dart';

enum PostVisibiltiy { SUBSCRIBER }

class Post {
  User creator;
  String postId;
  String postTitle;
  String postDescription;
  String postVideoUrl;
  List<String> postImages;
  List<String> postTags;
  PostVisibiltiy? postVisibiltiy;
  int postTimeStamp;
  int postLoveCount;
  int postCommentCount;
  int postShareCount;
  Quiz? quiz;
  Post({
    required this.creator,
    required this.postId,
    required this.postTitle,
    required this.postDescription,
    required this.postVideoUrl,
    required this.postImages,
    required this.postTags,
    required this.postTimeStamp,
    required this.postLoveCount,
    required this.postCommentCount,
    required this.postShareCount,
    this.quiz,
  });

  @override
  String toString() {
    return 'Post(creator: $creator, postId: $postId, postTitle: $postTitle, postDescription: $postDescription, postVideoUrl: $postVideoUrl, postImages: $postImages, postTags: $postTags, postTimeStamp: $postTimeStamp, postLoveCount: $postLoveCount, postCommentCount: $postCommentCount, postShareCount: $postShareCount, quiz: $quiz)';
  }

  Post copyWith({
    User? creator,
    String? postId,
    String? postTitle,
    String? postDescription,
    String? postVideoUrl,
    List<String>? postImages,
    List<String>? postTags,
    int? postTimeStamp,
    int? postLoveCount,
    int? postCommentCount,
    int? postShareCount,
    Quiz? quiz,
  }) {
    return Post(
      creator: creator ?? this.creator.copyWith(),
      postId: postId ?? this.postId,
      postTitle: postTitle ?? this.postTitle,
      postDescription: postDescription ?? this.postDescription,
      postVideoUrl: postVideoUrl ?? this.postVideoUrl,
      postImages: postImages ?? []
        ..addAll(this.postImages),
      postTags: postTags ?? []
        ..addAll(this.postTags),
      postTimeStamp: postTimeStamp ?? this.postTimeStamp,
      postLoveCount: postLoveCount ?? this.postLoveCount,
      postCommentCount: postCommentCount ?? this.postCommentCount,
      postShareCount: postShareCount ?? this.postShareCount,
      quiz: quiz ?? this.quiz?.copyWith(),
    );
  }
}
