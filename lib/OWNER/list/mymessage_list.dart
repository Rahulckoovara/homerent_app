// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMessageList extends StatelessWidget {
  final RxList<dynamic> messageList;
  final Function(String) onTap;

  MyMessageList(
    this.messageList, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create an RxList to manage expansion state
    final RxList<bool> expandedState =
        List.generate(messageList.length, (index) => false).obs;

    final reversedData = messageList.reversed.toList();

    return Obx(
      () => ListView.builder(
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          final message = reversedData[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Toggle the expansion state
                  expandedState[index] = !expandedState[index];
                  final messageId = message['_id'].toString();
                  onTap(
                      messageId); // Call the onTap function with the message ID
                },
                child: Obx(() {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      bottom: expandedState[index]
                          ? 0
                          : 12, // Add space between non-expanded items
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color.fromRGBO(242, 242, 242, 1),
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.098),
                          blurRadius: 3,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      // leading: ClipRRect(
                      //   borderRadius: BorderRadius.circular(6.0),
                      //   child: Container(
                      //     color: Colors.blue[100],
                      //     height: double.infinity,
                      //     width: 55,
                      //   ),
                      // ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Property ${message['assetId']['assetname'].toString()}', // Properly interpolated
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                      trailing: Obx(() {
                        return Icon(
                          expandedState[index]
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_right,
                        );
                      }),
                    ),
                  );
                }),
              ),
              // Conditionally show content if the expandedState is true
              Obx(() => expandedState[index]
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'The person ',
                            ),
                            TextSpan(
                              text: message['buyerId']['name'], // Buyer name
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' had shown interest on your propery ',
                            ),
                            TextSpan(
                              text: message['assetId']
                                  ['assetname'], // Asset name
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '.',
                            ),
                          ],
                          style: TextStyle(color: Colors.black), // Common style
                        ),
                      ))
                  : SizedBox.shrink()),
            ],
          );
        },
      ),
    );
  }
}
