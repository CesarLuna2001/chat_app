import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: 
              ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                return Text('Indice: $index');
                },

              )
            ),
            
            Text("Hola"), 
          ],
        ),
      ),
    );
  }
}