import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../controller/chat_controller.dart';

class ManagerSupportScreen extends StatefulWidget {
  const ManagerSupportScreen({super.key});

  @override
  State<ManagerSupportScreen> createState() => _ManagerSupportScreenState();
}

class _ManagerSupportScreenState extends State<ManagerSupportScreen> {
  // text editing controllers
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  ChatController chatController = ChatController();
  // variables
  final _respondantList = ['caretaker', 'electrician', 'landlord', 'plumber'];
  String? _dropDownValue = '';
  // function
  _ManagerSupportScreenState() {
    _dropDownValue = _respondantList[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: tPrimaryColor,
        //   title: const Text('Electricity chat'),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  // key: controller.loginFormKey,
                  //key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: tFormHeight - 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField(
                          value: _dropDownValue,
                          items: _respondantList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _dropDownValue = val;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            color: tSecondaryColor,
                          ),
                          decoration: const InputDecoration(
                              labelText:
                                  'Please select the respondant to your ticket'),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: bodyController,
                          onSaved: (value) {
                            bodyController.text = '';
                          },
                          validator: (value) {
                            return null;

                            // return controller.validatePassword(value!);
                          },
                          decoration: const InputDecoration(
                            labelText: 'body',
                            hintText: 'write your ticket here...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // --FORGET PASSWORD BTN

                        //--LOGIN BUTTON
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tPrimaryColor,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            chatController.addTicket(
                                _dropDownValue!, bodyController.text);
                          },
                          child: const Text(
                            'Submit',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
