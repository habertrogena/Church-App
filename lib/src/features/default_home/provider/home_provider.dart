import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentals_app/src/features/default_home/controller/dashoard_controller.dart';

import '../../login/model/user_model.dart';
import '../model/dashbaord_model.dart';

final dashbaordProvider = Provider((ref) => DashboardController());

final useDashbaord = FutureProvider.family<DashboardModel, String>((ref, uid) {
  return ref.watch(dashbaordProvider).getDashbaordData(UserModel(uid: uid).uid);
});
