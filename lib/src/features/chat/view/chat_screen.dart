import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentals_app/src/constants/colors.dart';
import 'package:rentals_app/src/features/chat/view/selection_page.dart';
import 'package:rentals_app/src/features/chat/controller/chat_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController chatController = ChatController();

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> chatStream =
        chatController.getActiveChatsStream();
    return StreamBuilder<QuerySnapshot>(
      stream: chatStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot,
      ) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text(
              'loading...',
              style: TextStyle(
                  color: tSecondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          );
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.to(const SelectionPage());
            },
            backgroundColor: tPrimaryColor,
            foregroundColor: tWhiteColor,
            icon: const Icon(Icons.chat_bubble_rounded),
            label: const Text('New Ticket'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['category']),
                      subtitle: Text(data['description']),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
