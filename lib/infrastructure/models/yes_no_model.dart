
import 'package:chat_app/domain/entities/message.dart';
import 'dart:math';

class YesNoModel {
    String answer;
    bool forced;
    String image;
    DateTime timestamp;
    MessageStatus status;

    YesNoModel({
      required this.answer,
      required this.forced,
      required this.image,
      required this.timestamp,
      required this.status
    });

    factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
      answer: json["answer"],
      forced: json["forced"],
      image: json["image"], 
      timestamp: DateTime.now(), // usar hora local actual
      status: MessageStatus.seen
    );

    Message toMessageEntity() {
      final random = Random();
      // Opciones para respuesta afirmativa
      final affirmativeOptions = [
        'Sí',
        'Efectivamente',
        'Lo más probable',
        'Claro que sí',
        'Por supuesto',
      ];

      // Opciones para respuesta negativa
      final negativeOptions = [
        'Probablemente no',
        'Tal vez no',
        'Puede que no',
        'No creo',
        'Es poco probable',
      ];

      String mappedText;

      if (answer.toLowerCase() == 'yes') {
        mappedText = affirmativeOptions[random.nextInt(affirmativeOptions.length)];
      } else if (answer.toLowerCase() == 'no') {
        mappedText = negativeOptions[random.nextInt(negativeOptions.length)];
      } else {
        mappedText = 'Quizás';
      }

      return Message(
        text: mappedText,
        fromWho: FromWho.hers,
        imageUrl: image,
        timestamp: timestamp,
        status: status,
      );
    }

      @override
      String toString() {
        return 'YesNoModel(answer: $answer, forced: $forced, image: $image, timestamp: $timestamp, status: $status)';
      }
}

    enum MessageStatus {
      sent,      // una palomita
      delivered, // dos palomitas grises
      seen       // dos palomitas azules
    }
