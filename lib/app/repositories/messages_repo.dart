import 'package:Bareeq/app/models/message.dart';
import 'package:Bareeq/app/providers/api_client/messages_api.dart';

class MessagesRepo {
  Future<List<MessageModel>> getMessagesForRecord(
      {required String regardingId}) async {
    return MessagesApi.getMessagesForRecord(regardingId: regardingId);
  }

  Future<List<MessageModel>> getAllMessages({required bool isInbox, required String type}) async {
    return MessagesApi.getAllMessages(isInbox: isInbox,type:"");
  }
}
