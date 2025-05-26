import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final timeString = DateFormat('hh:mm a').format(message.timestamp);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Texto del mensaje
        Container(
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),

        const SizedBox(height: 5),

        // Imagen (si existe)
        if (message.imageUrl != null)
          _ImageBubble(message.imageUrl!),

        const SizedBox(height: 3),

        // Hora del mensaje
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            timeString,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: ClipRRect(
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
              alignment: Alignment.center,
              child: const Text("Enviando imagen..."),
            );
          },
        ),
      ),
    );
  }
}
