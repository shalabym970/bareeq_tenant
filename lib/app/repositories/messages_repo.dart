import 'package:Seef/app/models/message.dart';
import 'package:Seef/app/providers/api_client/messages_api.dart';

class MessagesRepo {
  Future<List<MessageModel>> getMessages({String? regardingId}) async {
    return MessagesApi.getMessages(regardingId: regardingId);
  }
}
