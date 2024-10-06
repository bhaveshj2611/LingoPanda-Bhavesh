import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/comment_model.dart';
import '../utils/api_error_handler.dart';
import '../utils/firebase_config_service.dart';

class CommentController with ChangeNotifier {
  List<Comment> _comments = [];
  bool _isLoading = false;
  final FirebaseConfigService _configService;

  CommentController(this._configService);

  List<Comment> get comments => _comments;
  bool get isLoading => _isLoading;

  Future<void> fetchComments() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      handleApiError(response);

      final List<dynamic> jsonData = json.decode(response.body);
      _comments = jsonData.map((json) => Comment.fromJson(json)).toList();

      _comments = _comments
          .map((comment) => Comment(
                postId: comment.postId,
                id: comment.id,
                name: comment.name,
                email: _configService.maskEmail(comment.email),
                body: comment.body,
              ))
          .toList();
    } on ApiException catch (e) {
      print('Error fetching comments: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
