import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatApp {
  // create a property called store
  final FirebaseFirestore store = FirebaseFirestore.instance;
  // create a method that will return all active tickets.
  Stream getActiveChatsStream() {
    Stream querySnapshot = store.collection('ticket').snapshots();
    return querySnapshot;
  }
  // create a method that
  // Stream  createTicket(){
  //   Stream querySnapshot =store.collection('ticket').
  // }
}
