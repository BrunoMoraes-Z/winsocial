import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winsocial/controller/forgot_controller.dart';
import 'package:winsocial/screens/find_medicine/widgets/transition_button.dart';
import 'package:winsocial/screens/login/widgets/custom_text_field.dart';
import 'package:winsocial/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:winsocial/shared/formatter/phone_text_input_formatter.dart';

class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ForgotController>();
    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: MediaQuery.of(context).size.width < 500 ? 420 : 400,
        width: 300,
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recuperação de senha',
                    style: TextStyle(
                      color: constants.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.transparent,
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: constants.primary.withOpacity(0.4),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Column(
                    children: [
                      const Text(
                        'Celular: Uma nova senha será enviada via SMS.',
                      ),
                      const Text(
                        'Email: Instruções de como criar uma nova senha serão enviadas para o e-mail informado.',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'E-mail',
                        onChanged: controller.setEmail,
                        textFieldType: TextFieldType.light,
                        enabled: controller.isEmailEnabled(),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 16),
                        child: const Text(
                          'ou',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      CustomTextField(
                        label: 'Telefone',
                        onChanged: controller.setPhone,
                        textFieldType: TextFieldType.light,
                        enabled: controller.isPhoneEnabled(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                          PhoneInputFormatter(),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            TransitionButton(
              label: 'ENVIAR',
              onTap: () {
                if (controller.validate()) {}
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
