import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentals_app/src/features/login/controller/login_controller.dart';
import 'package:rentals_app/src/features/statement/components/statements.dart';
import 'package:rentals_app/src/features/statement/controller/statement_controller.dart';
import 'package:rentals_app/src/features/statement/provider/statement_provider.dart';

/// Procedure to follow
/// Fetch data from the graphql api [List<Statement>]
/// Create a Flutter widget that uses the fetched data to build a DataTable.

class Statement extends ConsumerStatefulWidget {
  const Statement({super.key});

  @override
  ConsumerState<Statement> createState() => _StatementState();
}

class _StatementState extends ConsumerState<Statement> {
  // fetch data from the graphql api
  final StatementController statementController = StatementController();
  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final reportsData = ref.watch(useStatements(''));

    //
    return reportsData.when(
        data: (statement) => StatementsPage(data: statement),
        error: (err, _) => Text(' Erro $err'),
        loading: () => const Text('Loading'));
  }
}
