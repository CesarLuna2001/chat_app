import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola, Salazar', fromWho: FromWho.me), 
    Message(text: 'Por haberte ido, te vas a especial directo', fromWho: FromWho.me), 
  ];
}