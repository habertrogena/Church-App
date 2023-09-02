import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../constants/text_string.dart';
import 'forget_password_widget.dart';

class ForgotPasswordScreen {
  // ignore: non_constant_identifier_names
  static Future<dynamic> ShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              tForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 30.0,
            ),
            forgetPasswordWidget(
              btnIcon: Icons.email_outlined,
              title: tEmail,
              subTitle: tResetViaEmail,
              onTap: () {},
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
