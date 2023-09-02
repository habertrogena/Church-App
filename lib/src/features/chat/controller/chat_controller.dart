import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:rentals_app/src/features/chat/model/chat_model.dart';

class ChatController {
  // create a riference to the chat model class
  // create an instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //

  // create a property called store
  final FirebaseFirestore store = FirebaseFirestore.instance;
  // create a method that will return all active tickets.
  // Create a CollectionReference called tickets that references the firestore collection

  CollectionReference tickets =
      FirebaseFirestore.instance.collection('tickets');
  // method that gets all tickets in the collection and displays it on our UI
  Stream<QuerySnapshot> getActiveChatsStream() {
    Stream<QuerySnapshot> querySnapshot = store
        .collection('tickets')
        // .orderBy("date", descending: true)
        .snapshots();
    return querySnapshot;
  }

  // create a function to return the current user id
  String getCurrentUserUid() {
    final User user = _auth.currentUser!;
    return user.uid;
  }

  // function that will display all the tickets in the collection according to date and time created
  Future getAllTicketsByDateAndTimeCreated({
    DateTime? dateTime,
  }) async {
    var now = DateTime.now();
    // final time = DateTime.parse();
  }

  // function that will fetch data from the form field and send to the server.
  addTicket(
    String category,
    String description,
  ) {
    // Call the tickets CollectionReference to add a new ticket.
    final ChatModel chatModel = ChatModel(
        category: category,
        description: description,
        tenantId: getCurrentUserUid());

    return tickets
        .add(chatModel.toJson())
        .then(
          (value) => print("ticket Added"),
        )
        .catchError((error) => print("Failed to add user: $error"));
  }
}
