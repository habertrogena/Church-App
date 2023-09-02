import 'package:flutter/material.dart';
import 'package:rentals_app/src/constants/colors.dart';

import '../../../constants/text_string.dart';

class LoginHeaderWiget extends StatelessWidget {
  const LoginHeaderWiget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          tLoginTittle,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        Text(
          tLoginSubTittle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
