import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.iconData,
      required this.hintText,
      required this.controller,
      required this.ofSecure});

  final IconData iconData;
  final String hintText;
  final TextEditingController controller;
  final bool ofSecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: ClayContainer(
        emboss: true,
        color: Colors.grey.shade200,
        width: MediaQuery.of(context).size.width,
        borderRadius: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(
                    obscureText: ofSecure,
                    controller: controller,
                    keyboardType: hintText=="Phone"?TextInputType.phone:TextInputType.text,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Enter $hintText";
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: TextStyle(
                        color: Color(0xFF124150), fontFamily: 'Oswald'),
                  ),
                ),
              ),
              ClayContainer(
                emboss: true,
                color: Colors.grey.shade200,
                height: 60,
                width: 60,
                borderRadius: 15,
                child: Icon(
                  iconData,
                  color: Color(0xFF124150),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
