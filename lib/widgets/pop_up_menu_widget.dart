import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:flutter/material.dart';

class PopUpMenuWidget extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  const PopUpMenuWidget({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    bool isFavorite = task.isFavorite ?? false;
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? (context) => [
              PopupMenuItem(
                onTap: () => editTaskCallback(),
                child: TextButton.icon(onPressed: null, label: const Text('Edit'), icon: const Icon(Icons.edit_outlined)),
              ),
              PopupMenuItem(
                onTap: () => likeOrDislikeCallback(),
                child: TextButton.icon(
                  onPressed: null,
                  label: Text(isFavorite ? "Remove from Bookmarks" : 'Add to Bookmarks'),
                  icon: Icon(isFavorite ? Icons.bookmark_remove : Icons.bookmark_outline),
                ),
              ),
              PopupMenuItem(
                onTap: () => cancelOrDeleteCallback(),
                child: TextButton.icon(onPressed: null, label: const Text('Delete'), icon: const Icon(Icons.delete_outline)),
              ),
            ]
          : (context) => [
              PopupMenuItem(
                onTap: () => restoreTaskCallback(),
                child: TextButton.icon(onPressed: null, label: const Text('Restore'), icon: const Icon(Icons.restore_outlined)),
              ),
              PopupMenuItem(
                child: TextButton.icon(onPressed: null, label: const Text('Delete Forever'), icon: const Icon(Icons.delete_forever_outlined)),
              ),
            ],
    );
  }
}
