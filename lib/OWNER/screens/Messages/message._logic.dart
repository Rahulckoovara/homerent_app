import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/list/mymessage_list.dart';
import 'package:tappal_app/OWNER/screens/Messages/message_view.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MessageLogic());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: MyMessageList(logic.messageData, onTap: (string) {
        print("message id: $string");
      }),
    );
  }
}
