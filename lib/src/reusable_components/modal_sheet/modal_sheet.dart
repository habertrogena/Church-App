import 'package:flutter/material.dart';

class ModalSheet {
  // function that will be used when creating a bottomsheet.
  Future<dynamic> bottomSheet(
      BuildContext context, Widget Function(BuildContext builder) builder) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        isScrollControlled: true,
        constraints: BoxConstraints.tight(
          Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * .7),
        ),
        builder: builder);
  }
}
