import 'package:flutter/material.dart';
import 'package:winsocial/screens/find_farmacy/widgets/my_drop_down.dart';
import 'package:winsocial/screens/find_medicine/widgets/transition_button.dart';
import 'package:winsocial/shared/constants.dart';
import 'package:winsocial/widgets/default_frame.dart';
import 'package:winsocial/widgets/dot_item_label.dart';

class FindFarmacy extends StatelessWidget {
  const FindFarmacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultFrame(
      boxConstraints: const BoxConstraints(
        maxWidth: 1140,
      ),
      child: Column(
        children: [
          // Page Header with informations
          const _PageTextInformation(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Encontre a farmácia mais próxima de você',
              style: TextStyle(
                color: constants.primary,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                MyDropDown(
                  label: 'Escolha um estado',
                  filledLabel: 'Estado',
                  itens: [
                    'Parana',
                    'São Paulo',
                    'Rio de Janeiro',
                    'Minas Gerais',
                  ]..sort(),
                  onChanged: (value) {},
                ),
                MyDropDown(
                  label: 'Escolha uma cidade',
                  filledLabel: 'Cidade',
                  enabled: false,
                  itens: []..sort(),
                  onChanged: (value) {},
                ),
                MyDropDown(
                  label: 'Escolha um bairro',
                  filledLabel: 'Bairro',
                  enabled: false,
                  itens: []..sort(),
                  onChanged: (value) {},
                ),
                Container(
                  width: 175,
                  padding: const EdgeInsets.only(left: 32),
                  child: TransitionButton(
                    label: 'BUSCAR',
                    onTap: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PageTextInformation extends StatelessWidget {
  const _PageTextInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w100,
          color: Colors.black.withOpacity(0.7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            const Text('Prezado BENEFICIÁRIO,'),
            const SizedBox(height: 24),
            const Text(
              'Para usufruir do seu benefício medicamento, localize uma farmácia de sua preferência abaixo e siga os seguintes passos:',
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  DotItemLabel(
                    text:
                        'Ao chegar na farmácia identifique-se como beneficiário EPHARMA;',
                  ),
                  DotItemLabel(
                    text:
                        'Apresente seu cartão de identificação WINSOCIAL e sua receita médica;',
                  ),
                  DotItemLabel(
                    text:
                        'O balconista no momento do atendimento deverá acessar o autorizador EPHARMA e selecionar o programa WINSOCIAL.',
                  ),
                  DotItemLabel(
                    text:
                        'O balconista deverá inserir os dados dos medicamentos, CRM e data da receita para realizar autorização de sua compra;',
                  ),
                  DotItemLabel(
                    text:
                        'Dirija-se ao caixa e apresente o número da autorização fornecida pelo balconista para efetivação da compra;',
                  ),
                  DotItemLabel(
                    text:
                        'No caixa será emitido o comprovante (cupom vinculado) que deverá ser assinado pelo beneficiário.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Se houver alguma dificuldade em sua compra, basta solicitar que o balconista ligue no Alô Farmácia da epharma (canal exclusivo para farmácias) para que você não fique sem seus medicamentos',
            ),
            const SizedBox(height: 24),
            const Text('Alô Farmácia 4002-1600'),
            const SizedBox(height: 24),
            const Text(
              'De segunda a sexta-feira, das 7h às 23h, Sábados, domingos e feriados, das 8h às 22h',
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
