import 'package:chat_app/config/helpers/get_yes_no_answer.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/infrastructure/models/yes_no_model.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  //Controlador que maneja la posicion del scroll  
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer(); 
  
  List<Message> messageList = [];

  //send message 
  Future<void> sendMessage(String text) async {
    //si el mensaje es vacio no hace nada
    if (text.trim().isEmpty) return;

    final newMessage = Message(text: text.trim(), fromWho: FromWho.me, timestamp: DateTime.now(), status: MessageStatus.sent);
    //Agregar el nuevo mensaje a la lista 
    messageList.add(newMessage);

    //Detectar si el usuario hizo una pregunta 
    if (text.endsWith('?')) {
      herReply();
    }

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

  //Crear la respuesta de ella 
  Future<void> herReply() async{
    //obetener el mensaje de la peticion http
    final herMessage = await getYesNoAnswer.getAnswer();

    //Añadimos el mensaje de ella a la lista de mensajes
    messageList.add(herMessage); 

    //Notificar a provider los cambios 
    notifyListeners();

    //Mover el scroll hasta el ultimo mensaje
    moveScrollToBottom();
  }
}

