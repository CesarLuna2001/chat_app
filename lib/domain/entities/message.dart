enum FromWho {me, hers} //quien envia el mensaje
//Enum: es un tipo de dato que puede tener un conjunto limitado de valores

//Identidad atomica: la unidad mas pequeña 
class Message {
  final String text; 
  final String? imageUrl; //? significa que es opcional
  final FromWho fromWho;

  Message({
    required this.text, 
    this.imageUrl, 
    required this.fromWho}); 
}