import 'package:flutter/material.dart';
import 'package:winsocial/screens/find_medicine/widgets/transition_button.dart';
import 'package:winsocial/screens/login/widgets/custom_password_text_field.dart';
import 'package:winsocial/screens/login/widgets/custom_text_field.dart';
import 'package:winsocial/shared/constants.dart';
import 'package:winsocial/widgets/default_frame.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultFrame(
      boxConstraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Text(
              'Alterar senha',
              style: TextStyle(
                fontSize: 22,
                color: constants.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            CustomPasswordTextField(
              label: 'Nova Senha',
              focusLabel: 'NOVA SENHA',
              textFieldType: TextFieldType.light,
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            CustomPasswordTextField(
              label: 'Repetir nova Senha',
              focusLabel: 'REPETIR NOVA SENHA',
              textFieldType: TextFieldType.light,
              onChanged: (value) {},
            ),
            const SizedBox(height: 48),
            TransitionButton(
              label: 'ALTERAR SENHA',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
