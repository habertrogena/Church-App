//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rentals_app/src/features/dashboard/screens/dashboard_screen.dart';

//import '../../screens/welcome/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  //variables
  // instance of auth
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  // instance of firestore
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => '') : Get.offAll(() => const Dashboard());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => '');
    } on FirebaseException catch (e) {
      //final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // print('FIREBASE AUTH EXEPTION - ${ex.message}');
      //throw ex;
    } catch (_) {
      // const ex = SignUpWithEmailAndPasswordFailure();
      // print('EXCEPTION - ${ex.message}');
      //throw ex;
    }
  }
  // SIGN USER IN

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      //  UserCredential userCredential=
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // after creating the user ,create a new document for the users in the users collection
      // _firestore.collection('users').doc(userCredential.user!.uid).set(
      //   //'uid':user
      // );

      //catch errors
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    } catch (_) {}
  }

  //SIGN OUT USER
  Future<void> logout() async => await _auth.signOut();
}
