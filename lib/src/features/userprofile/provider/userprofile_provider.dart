import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentals_app/src/features/userprofile/controller/user_controller.dart';
import 'package:rentals_app/src/features/userprofile/model/user_model.dart';

final userProfileProvider = Provider((ref) => UserProfileController());

//
//Async version as ad hook
final useUserProfile = FutureProvider((ref) {
  return ref.watch(userProfileProvider).getUserProfile();
});

///Update the user with the given data.
final useUpdateTenant =
    FutureProvider.family<UserProfile, Map<String, Object?>>((ref, toUpdate) {
  return ref.watch(userProfileProvider).updateUser(toUpdate);
});
