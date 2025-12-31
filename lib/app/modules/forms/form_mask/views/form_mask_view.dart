import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/utils/my_string_utils.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/my_text_style.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/form_mask_controller.dart';

class FormMaskView extends GetView<FormMaskController> {
  const FormMaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: MyFlex(
            children: <MyFlexItem>[MyFlexItem(sizes: 'lg-8', child: mask())],
          ),
        ),
      ),
    );
  }

  Widget mask() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, strokeAlign: 0, color: theme.colorScheme.onSurface.withAlpha(80)),
    );
    final OutlineInputBorder focusedInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: theme.colorScheme.primary),
    );
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Form Mask', fontWeight: 600),
          MySpacing.height(16),
          MyText.labelMedium('Date Style 1'),
          MySpacing.height(8),
          TextFormField(
            inputFormatters: <TextInputFormatter>[DateTextFormatter()],
            decoration: InputDecoration(
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: focusedInputBorder,
              contentPadding: MySpacing.all(16),
              isCollapsed: true,
              helperText: '"dd/mm/yyy"',
              helperStyle: MyTextStyle.bodySmall(muted: true),
            ),
          ),
          MySpacing.height(16),
          MyText.labelMedium('Date Style 1'),
          MySpacing.height(8),
          TextFormField(
            inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(10), PhoneInputFormatter()],
            decoration: InputDecoration(
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: focusedInputBorder,
              contentPadding: MySpacing.all(16),
              isCollapsed: true,
              helperText: '"123456789"',
              helperStyle: MyTextStyle.bodySmall(muted: true),
            ),
          ),
          MySpacing.height(16),
          MyText.labelMedium('Date Style 2'),
          MySpacing.height(8),
          TextFormField(
            inputFormatters: <TextInputFormatter>[DateTextFormatter()],
            decoration: InputDecoration(
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: focusedInputBorder,
              contentPadding: MySpacing.all(16),
              isCollapsed: true,
              helperText: '"mm/dd/yyy"',
              helperStyle: MyTextStyle.bodySmall(muted: true),
            ),
          ),
          MySpacing.height(16),
          MyText.labelMedium('Mask'),
          MySpacing.height(8),
          TextFormField(
            inputFormatters: <TextInputFormatter>[MaskTextFormatter()],
            decoration: InputDecoration(
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: focusedInputBorder,
              contentPadding: MySpacing.all(16),
              isCollapsed: true,
              helperText: '"00-0000000"',
              helperStyle: MyTextStyle.bodySmall(muted: true),
            ),
          ),
          MySpacing.height(16),
          MyText.labelMedium('IP address'),
          MySpacing.height(8),
          TextFormField(
            inputFormatters: <TextInputFormatter>[IpAddressInputFormatter()],
            decoration: InputDecoration(
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: focusedInputBorder,
              contentPadding: MySpacing.all(16),
              isCollapsed: true,
              helperText: '"99.99.99.99"',
              helperStyle: MyTextStyle.bodySmall(muted: true),
            ),
          ),
          MySpacing.height(16),
          MyText.labelMedium('Email address'),
          MySpacing.height(8),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Email is required';
                }
                if (value != null && !MyStringUtils.isEmail(value)) {
                  return 'Invalid Email';
                }
                return null;
              },
              decoration: InputDecoration(
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: focusedInputBorder,
                contentPadding: MySpacing.all(16),
                isCollapsed: true,
                helperText: '"_@_._"',
                helperStyle: MyTextStyle.bodySmall(muted: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const int _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String formattedText = _format(newValue.text);
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.fromPosition(TextPosition(offset: formattedText.length)),
    );
  }

  String _format(String value) {
    final String cleanedValue = value.replaceAll('/', '');
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < cleanedValue.length && i < _maxChars; i++) {
      if (i == 2 || i == 4) {
        buffer.write('/');
      }
      buffer.write(cleanedValue[i]);
    }

    return buffer.toString();
  }
}

//-----------------------Phone Number-----------------------//
class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String cleanedText = newValue.text.replaceAll(RegExp(r'\D'), '');
    return newValue.copyWith(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }
}

//-----------------------IP address-----------------------//
class IpAddressInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = newValue.text.replaceAll('.', '');
    final StringBuffer buffer = StringBuffer();
    int dotCounter = 0;

    for (int i = 0; i < text.length && dotCounter < 3; i++) {
      final String char = text[i];
      buffer.write(char);

      if (buffer.length == 3 && int.parse(buffer.toString()) <= 255) {
        buffer.write('.');
        dotCounter++;
      } else if (buffer.length == 3 && int.parse(buffer.toString()) > 255) {
        buffer.clear();
        buffer.write(char);
      }
    }

    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

//-----------------------Mask Formatter-----------------------//
class MaskTextFormatter extends TextInputFormatter {
  static const int _maxChars = 10;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String formattedText = _format(newValue.text);
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _format(String value) {
    final String cleanedValue = value.replaceAll('-', '');
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < cleanedValue.length && i < _maxChars; i++) {
      if (i == 1) {
        buffer.write('-');
      }
      buffer.write(cleanedValue[i]);
    }

    return buffer.toString();
  }
}
