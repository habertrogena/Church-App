import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentals_app/src/constants/colors.dart';
import 'package:rentals_app/src/constants/sizes.dart';
import 'package:rentals_app/src/constants/text_string.dart';
import 'package:rentals_app/src/features/userprofile/view/profile_menu_widget.dart';
import 'package:rentals_app/src/features/userprofile/view/property_details_screen.dart';
import 'package:rentals_app/src/features/userprofile/view/update_profile_screen.dart';
import 'package:rentals_app/src/features/userprofile/view/user_details_screen.dart';
import 'package:rentals_app/src/reusable_components/modal_sheet/modal_sheet.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // final user = FirebaseAuth.instance.currentUser!;

  // connect to showmodalbottomsheet class .
  ModalSheet modalSheet = ModalSheet();

  // create variables
  User? user;
  String? photoUrl;
  // create a function that will take the two variables
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
    photoUrl = user?.photoURL;
  }
  // function to sign user out

  // sign out method

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  // function to get profile image
  getImage() {
    if (FirebaseAuth.instance.currentUser?.photoURL != null) {
      return Image.network(
        FirebaseAuth.instance.currentUser?.photoURL as String,
        height: 100,
        width: 100,
      );
    } else {
      return const SizedBox(
        width: 120,
        height: 120,
        child: Image(
          image: AssetImage('assets/images/profile.jpg'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: getImage(),
              ),

              // trial

              const SizedBox(
                height: 10,
              ),
              Text(
                ('Logged in as: ${user?.email}'),
                style: const TextStyle(fontSize: 14),
              ),
              // display the names of the user
              // Text(
              //   ('Logged in as: ${user?.displayName}'),
              //   style: const TextStyle(fontSize: 20),
              // ),

              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => {
                    // show model sheet
                    modalSheet.bottomSheet(
                      context,
                      (builder) => const UpdateProfileScreen(),
                    )
                    // navigate to update profile sceeen.
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    tEditProfile,
                    style: TextStyle(color: tWhiteColor),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              //menu
              ProfileMenuWidget(
                title: 'User Profile',
                icon: Icons.person_3,
                onPress: () => {
                  modalSheet.bottomSheet(
                      context, (builder) => const UserDetailsScreen())
                },
              ),
              ProfileMenuWidget(
                title: 'Property Details',
                icon: Icons.settings_applications_rounded,
                onPress: () => {
                  modalSheet.bottomSheet(
                      context, (builder) => const PropertyDetailsScreen())
                },
              ),
              const Divider(),
              const SizedBox(
                height: 96,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColor,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  signUserOut();
                },
                child: const Text(
                  'Sign Out',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
