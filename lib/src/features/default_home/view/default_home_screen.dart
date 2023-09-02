import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentals_app/src/features/login/provider/auth_provider.dart';

import '../components/dashboard_comp.dart';

class DefaultHome extends ConsumerStatefulWidget {
  const DefaultHome({Key? key}) : super(key: key);

  @override
  ConsumerState<DefaultHome> createState() => _DefaultHomeState();
}

class _DefaultHomeState extends ConsumerState<DefaultHome> {
  //Build the controller
  @override
  Widget build(BuildContext context) {
    //Get the current looged in server user.

    //Get all the data retaed to the current user for the dahsboard.
    final statement = ref.watch(useServerUser);

    return statement.when(
        data: (statement) => DashoardUi(statement.uid),
        error: (err, stat) => Text("Err $err"),
        loading: () => const Text("Loading... "));
  }
}
