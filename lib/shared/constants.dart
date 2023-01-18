import 'package:flutter/services.dart';
import 'package:winsocial/shared/formatter/cpf_text_input_formatter.dart';

export './text_to_drop_item.dart';

final Constants constants = Constants();

class Constants {
  Color primary = const Color(0xff673CBC);

  final List<TextInputFormatter> cpfFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(11),
    CpfInputFormatter(),
  ];
}
