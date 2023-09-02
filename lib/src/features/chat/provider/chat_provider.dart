// chat provider.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentals_app/src/features/chat/controller/chat_controller.dart';

final chatProvider = Provider((ref) => ChatController());
