
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/home_controller.dart';

final homeProvider = Provider((ref) => HomeController());

///Asnc version to handle asyc data
///

final useHomePageData = FutureProvider((ref) {
  return ref.watch(homeProvider).getHomePageData();
});
