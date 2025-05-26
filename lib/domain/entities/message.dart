import 'package:chat_app/infrastructure/models/yes_no_model.dart';

enum FromWho {me, hers} //quien envia el mensaje
//Enum: es un tipo de dato que puede tener un conjunto limitado de valores

//Identidad atomica: la unidad mas pequeña 
class Message {
  final String text; 
  final String? imageUrl; //? significa que es opcional
  final FromWho fromWho;
  final DateTime timestamp; //Hora del mensaje
  final MessageStatus status; //estado del mensaje


  Message({
    required this.text, 
    this.imageUrl, 
    required this.fromWho,  
    required this.timestamp, 
    required this.status,}); 
}