import 'package:bhavesh_lingopanda/model/comment_model.dart';
import 'package:bhavesh_lingopanda/routes/route_name.dart';
import 'package:bhavesh_lingopanda/utils/app_color.dart';
import 'package:bhavesh_lingopanda/widgets/comment_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/comment_controller.dart';
import '../controller/auth_controller.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CommentController>().fetchComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text(
          'Comments',
          style:
              TextStyle(color: AppColor.bgColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: AppColor.bgColor,
            ),
            onPressed: () {
              context.read<AuthController>().signOut();
              Navigator.pushReplacementNamed(context, RouteName.signIn);
            },
          ),
        ],
      ),
      body: Consumer<CommentController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.comments.length,
            itemBuilder: (context, index) {
              final comment = controller.comments[index];
              return CommentCard(comment: comment);
            },
          );
        },
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final Comment comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.componentColor,
              radius: 24,
              child: Center(
                child: Text(
                  comment.name[0].toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCommentRow('Name: ', comment.name),
                  const SizedBox(height: 4),
                  buildCommentRow('Email: ', comment.email),
                  const SizedBox(height: 8),
                  Text(
                    comment.body,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


