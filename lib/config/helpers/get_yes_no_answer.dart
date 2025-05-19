import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {

  //Instancia de la clase dio para manejar peticion HTTP
  final _dio = Dio();

  Future<Message> getAnswer () async{
    //Almacenar el resultado de la peticion
    final response = await _dio.get('https://yesno.wtf/api');

    //Almacenar la data de la respuesta
    final yesNoModel = YesNoModel.fromJson(response.data);

    //retornar la instancia de Message
    return yesNoModel.toMessageEntity();
  }

}