import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/login_controller.dart';

///Build the provied that haldes all authentication data
///
///
///The provdider will hold both the firebase user na server side user
///
final authProvider = Provider<LoginController>((ref) => LoginController());

///Async useAuthProvider Hook that handles the state shared.

final useServerUser = FutureProvider((ref) async {
  return ref.watch(authProvider).getServerUser();
});

final useFirebaseuser = FutureProvider((ref) {
  return ref.watch(authProvider).getFirebaseUser();
});
