import 'package:flutter/material.dart';
import 'package:winsocial/controller/notification_controller.dart';
import 'package:winsocial/models/app_notification.dart';
import 'package:winsocial/screens/find_medicine/widgets/transition_button.dart';
import 'package:winsocial/screens/login/widgets/custom_text_field.dart';
import 'package:winsocial/shared/constants.dart';
import 'package:winsocial/widgets/default_frame.dart';
import 'package:provider/provider.dart';

class FindMedicineScreen extends StatelessWidget {
  const FindMedicineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultFrame(
      boxConstraints: const BoxConstraints(
        maxWidth: 1140,
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: const [
                SelectableText(
                  '{full_username} - 123.456.789-00',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 64),
          Container(
            constraints: const BoxConstraints(maxWidth: 540),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  'Encontre seu medicamento',
                  style: TextStyle(
                    color: constants.primary,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Busque por nome do medicamento, princípio ativo ou laboratório.',
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  label: 'Digite aqui sua busca',
                  focusLabel: 'Busca',
                  textFieldType: TextFieldType.light,
                  maxSize: 540,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 64),
                TransitionButton(
                  label: 'BUSCAR',
                  onTap: () {
                    context.read<NotificationController>().addNotification(
                          const AppNotification(message: 'Erro'),
                        );
                  },
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
