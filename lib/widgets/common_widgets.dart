import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universities_app/app_config.dart';
import 'package:universities_app/extensions/context_extensions.dart';
import 'package:universities_app/utils/styles.dart';

class CommonWidgets {
  // TEXT BUTTON
  static Widget textButton(BuildContext context, ButtonArgs args) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          context.primaryColorDark,
        ),
      ),
      onPressed: args.onPressed,
      child: Text(
        args.nameButton,
        style: AppStyles.textStyleCustom(
          context,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget avatarUniversity(BuildContext context, Uint8List? image,
      [double height = 300]) {
    return image != null
        ? Image.memory(
            Uint8List.fromList(image),
            height: height,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          )
        : Image.asset(
            highSchool,
            height: height,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          );
  }
}

class ButtonArgs {
  final void Function()? onPressed;
  final String nameButton;
  final bool disabled;

  ButtonArgs({
    this.disabled = false,
    required this.onPressed,
    required this.nameButton,
  });
}
