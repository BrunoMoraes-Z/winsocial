import 'package:flutter/material.dart';
import 'package:winsocial/screens/tele_saude/widgets/info_dot_card.dart';
import 'package:winsocial/screens/tele_saude/widgets/info_steps.dart';
import 'package:winsocial/widgets/default_frame.dart';

class TeleSaudeScreen extends StatelessWidget {
  const TeleSaudeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultFrame(
      boxConstraints: const BoxConstraints(
        maxWidth: 1140,
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const InfoSteps(),
          const SizedBox(height: 24),
          Wrap(
            children: const [
              InfoDotCard(
                label: 'Orientação Farmacêutica',
                text:
                    'Visa assegurar o uso correto e racional dos medicamentos.',
              ),
              InfoDotCard(
                label: 'Orientação Nutricional',
                text:
                    'Auxiliará você a implementar hábitos e comportamentos desejáveis de nutrição e estilo de vida.',
              ),
              InfoDotCard(
                label: 'Educador Físico',
                text:
                    'Este profissional ajudará você a manter uma vida mais ativa e saudável atrável da prática de exercícios físicos.',
              ),
              InfoDotCard(
                label: 'Orientação Médica por telefone',
                text:
                    'Realizar um atendimento de apoio médico telefônico, com a missão de esclarecer dúvidas, proporcionar o aconselhamento seguro e acesso às informações de saúde sempre que solicitado pelo beneficiário.',
              ),
              InfoDotCard(
                label: 'Orientação Psicológica',
                text:
                    'A Orientação Psicológica é orientativa. Ela ajuda a esclarecer qual caminho que o paciente deve tomar em busca de uma solução. Ou seja, é uma alternativa de ajuda terapêutica com o objetivo fundamental de oferecer informação, orientação e encaminhamento adequados.',
              ),
              InfoDotCard(
                label: 'Orientação Social',
                text:
                    'Este serviço tem como objetivo auxiliar em momentos de fragilidade ou situação de vulnerabilidade relacionada à morte de membros familiares ou a violência familiar.',
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
