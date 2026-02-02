import 'package:submeowsions/data/database.dart';
import 'package:submeowsions/models/comment_model.dart';

abstract class ICommentRepo {
  Future<bool> get();
}

class CommentRepo implements ICommentRepo {
  final AppDatabase db;
  const CommentRepo(this.db);

  @override
  Future<bool> get() async {
    // CommentModel comment = CommentModel(id: 1, body: "", type: Type.work, parentID: 0);
    // db.into(db.commentsTable).insert(CommentsTableData(id: comment.id, body: comment.body));
    return false;
  }
}
