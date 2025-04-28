import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola, Salazar', fromWho: FromWho.me), 
    Message(text: 'Por haberte ido, te vas a especial directo', fromWho: FromWho.me), 
    Message(text: 'Por haberte ido, te vas a especial directo', fromWho: FromWho.me), 
    Message(text: 'Por haberte ido, te vas a especial directo', fromWho: FromWho.hers), 
  ];

  //send message 
  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agregar el nuevo mensaje a la lista 
    messageList.add(newMessage);

    //notica a provider que algo cambio
    notifyListeners();
  }
}

