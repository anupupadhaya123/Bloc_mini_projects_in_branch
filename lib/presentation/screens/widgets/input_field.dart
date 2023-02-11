import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/height_spacer.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key, required this.focusNode, required this.ageController})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Age :"),
        const WidthSpacer(myWidth: 35),
        SizedBox(
          width: 50,
          child: TextFormField(
            controller: ageController,
            autofocus: true,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(focusNode);
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
              hintStyle: const TextStyle(color: Colors.blue),
              filled: true,
              fillColor: Colors.blue[50],
            ),
          ),
        ),
      ],
    );
  }
}
