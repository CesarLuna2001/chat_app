import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  //Controlador que maneja la posicion del scroll 
  final ScrollController chatScrollController = ScrollController();
  List<Message> messageList = [
    Message(text: 'Hola, Salazar', fromWho: FromWho.me), 
    Message(text: 'Por haberte ido, te vas a especial directo', fromWho: FromWho.me), 
    Message(text: 'Por haberte ido, te vas a especial directo', fromWho: FromWho.me), 
    Message(text: 'Por haberte ido, te vas a especial directo', fromWho: FromWho.hers), 
  ];

  //send message 
  Future<void> sendMessage(String text) async {
    //si el mensaje es vacio no hace nada
    if (text.trim().isEmpty) return;

    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //Agregar el nuevo mensaje a la lista 
    messageList.add(newMessage);

    print('total mensajes: ${messageList.length}');

    //notica a provider que algo cambio
    notifyListeners();
    moveScrollToBottom();
  }
  //Mover el scroll hasta abajo 
  Future<void>moveScrollToBottom() async {
    //Animacion
    await Future.delayed(const Duration(milliseconds: 100)); 
    chatScrollController.animateTo(
      //offset poscion 
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );

  }
}

