import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://assets.codmunity.gg/profiles/39fe0980-6d17-11ef-92e0-45607784a4f5.webp'),
          ),
        ),
        title: Text("Chat Screen"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Le pide que este pendiente de cambios
    final chatProvider = context.watch<ChatProvider>(); 

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: 
              ListView.builder(
                //Enlaza el controlador creado en ChatProvider
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  //instacia que sabra de quien es el mensaje
                  final message = chatProvider.messageList[index];
                  //si es par es mensaje de ella, si no, es mio
                  //return (index % 2 == 0)
                  return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
                },

              )
            ),
            ///Caja de texto de mensajes
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),  
          ],
        ),
      ),
    );
  }
}