import 'package:flutter/material.dart';
import 'package:winsocial/screens/tele_saude/widgets/info_icon_card.dart';

class InfoSteps extends StatelessWidget {
  const InfoSteps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Wrap(
          children: const [
            InfoIconCard(
              asset: 'assets/telefone.png',
              step: 1,
              child: SelectableText.rich(
                TextSpan(
                  text: 'Ligue na Central Concierge\nda Saúde através do\n',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '0800-942-0795',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InfoIconCard(
              asset: 'assets/telefone.png',
              step: 2,
              child: Text(
                'A Equipe Técnica vai entender a sua necessidade, coletar dois horários disponíveis para o agendamento, bem como seus dados de contato.',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Wrap(
          children: const [
            InfoIconCard(
              asset: 'assets/mensagem.png',
              step: 3,
              child: Text(
                'Você receberá os dados do agendamento por E-mail.',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            InfoIconCard(
              asset: 'assets/telefone.png',
              step: 4,
              child: Text(
                'No dia da consulta, o profissional da saúde entrará em contato no horário agendado.',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
