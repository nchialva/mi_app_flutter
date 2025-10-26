import 'comment.dart';

class PetMoment {
  final String id;
  final String photoUrl;
  final String caption;
  final String petName;
  final String ownerName;
  final DateTime timestamp;
  int likes;
  List<Comment> comments;

  PetMoment({
    required this.id,
    required this.photoUrl,
    required this.caption,
    required this.petName,
    required this.ownerName,
    required this.timestamp,
    this.likes = 0,
    this.comments = const [],
  });

  void addLike() {
    likes++;
  }

  void removeLike() {
    if (likes > 0) {
      likes--;
    }
  }

  void addComment(Comment comment) {
    comments.add(comment);
  }
}
