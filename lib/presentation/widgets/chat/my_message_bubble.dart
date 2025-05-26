import 'package:chat_app/infrastructure/models/yes_no_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:chat_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final timeString = DateFormat('hh:mm a').format(message.timestamp);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),

        if (message.imageUrl != null) ...[
          const SizedBox(height: 5),
          _ImageBubble(message.imageUrl!)
        ],

        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                timeString,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const SizedBox(width: 4),
              _buildStatusIcon(message.status),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return const Icon(Icons.done_all, size: 16, color: Colors.blue);
      case MessageStatus.delivered:
        return const Icon(Icons.done_all, size: 16, color: Colors.grey);
      case MessageStatus.seen:
        return const Icon(Icons.done_all, size: 16, color: Colors.blue);
      default:
        return const SizedBox.shrink();
    }
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: const Text("Cargando imagen..."),
          );
        },
      ),
    );
  }
}