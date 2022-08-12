import 'package:flutter/material.dart';
import 'package:winsocial/shared/constants.dart';
import 'package:winsocial/widgets/default_frame.dart';
import 'package:winsocial/widgets/dot_item_label.dart';

class ExameScreen extends StatelessWidget {
  const ExameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultFrame(
      boxConstraints: const BoxConstraints(
        maxWidth: 1140,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const SizedBox(height: 48),
            Text(
              'Telefone:',
              style: TextStyle(
                color: constants.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            const SelectableText(
              '0800 022 4073',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 32),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w100,
                color: Colors.black.withOpacity(0.7),
              ),
              child: Column(
                children: [
                  const Text(
                    'Entre em contato com o nosso 0800 onde você poderá realizar seu agendamento de consultas e exames médicos.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Retornaremos em até 48 horas com as informações sobre data e horários disponíveis para o procedimento com os valores reduzidos.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  DotItemLabel(
                    text: 'Consultas sem limite de idade e utilização;',
                    topMargin: 8,
                  ),
                  DotItemLabel(
                    text:
                        'Preços reduzidos em até 80% em clínicas de diversas especialidades em todo o Brasil:',
                    topMargin: 8,
                  ),
                  DotItemLabel(
                    text: 'Mais de 25.000 serviços disponíveis;',
                    topMargin: 8,
                  ),
                  DotItemLabel(
                    text: 'Mais de 536 especialidades médicas;',
                    topMargin: 8,
                  ),
                  DotItemLabel(
                    text: 'Mais de 2.235 tipos de exames;',
                    topMargin: 8,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
