import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(
      text: "Hello, I'm a bot. I'm here to help you. Ask me anything.",
      fromWho: FromWho.me,
    ),
    Message(text: 'A message ', fromWho: FromWho.me)
  ];


  Future<void> sendMessage(String text) async {
    
      final newMessage = Message(text: text, fromWho: FromWho.me);
      if(text.isEmpty) return;

      if( text.endsWith('?')){
        await herReply();
      }
      messageList.add(newMessage);


      notifyListeners();
      scrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
  }

 Future<void> scrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }


}
