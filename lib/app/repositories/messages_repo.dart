import 'package:bareeq/app/models/message.dart';
import 'package:bareeq/app/providers/api_client/messages_api.dart';

class MessagesRepo {
  Future<List<MessageModel>> getMessagesForRecord(
      {required String regardingId}) async {
    return MessagesApi.getMessagesForRecord(regardingId: regardingId);
  }

  Future<List<MessageModel>> getAllMessages(
      {required bool isInbox, required String type}) async {
    return MessagesApi.getAllMessages(isInbox: isInbox, type: "");
  }

  Future<String> replyMessage({required MessageModel request}) async {
   return await MessagesApi.replyMessage(request: request);
  }
}
