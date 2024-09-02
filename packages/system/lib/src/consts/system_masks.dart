import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SystemMasks {
  SystemMasks();

  static final phone = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    type: MaskAutoCompletionType.lazy,
  );

  static final fixPhone = MaskTextInputFormatter(
    mask: '+55 (##) ####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    type: MaskAutoCompletionType.lazy,
  );

  static final cpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    type: MaskAutoCompletionType.lazy,
  );

  static final date = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    type: MaskAutoCompletionType.lazy,
  );

  static final cnpj = MaskTextInputFormatter(
    mask: '##.###.###/####-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    type: MaskAutoCompletionType.lazy,
  );

  static final cep = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    type: MaskAutoCompletionType.lazy,
  );

  static final userName = MaskTextInputFormatter(
    mask: '#######',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    type: MaskAutoCompletionType.lazy,
  );
}
