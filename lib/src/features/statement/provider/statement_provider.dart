import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentals_app/src/features/login/model/user_model.dart';
import 'package:rentals_app/src/features/statement/model/statement_model.dart';

import '../controller/statement_controller.dart';

final statmentProvider = Provider((ref) => StatementController());

final useStatements = FutureProvider.family<List<dynamic>, String>((ref, uid) {
  return ref.watch(statmentProvider).getReports();
});
