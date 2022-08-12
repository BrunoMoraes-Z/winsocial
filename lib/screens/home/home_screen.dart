import 'package:flutter/material.dart';
import 'package:winsocial/screens/home/widgets/link_card.dart';
import 'package:winsocial/shared/constants.dart';
import 'package:winsocial/shared/routes.dart';
import 'package:winsocial/widgets/default_frame.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultFrame(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 96),
          DefaultTextStyle(
            style: TextStyle(
              color: constants.primary,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
            child: Column(
              children: const [
                Text('Olá, {username}!'),
                Text('Como podemos ajudar hoje?')
              ],
            ),
          ),
          const SizedBox(height: 96),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 96),
            child: Wrap(
              spacing: 64,
              runSpacing: 64,
              alignment: WrapAlignment.center,
              children: [
                LinkCard(
                  label: 'TELESAÚDE',
                  assetPath: 'assets/icn-heart.svg',
                  onTap: () => routeNavigate(context, '/telemedicina'),
                ),
                LinkCard(
                  label: 'ENCONTRAR MEDICAMENTOS',
                  assetPath: 'assets/icn-direction.svg',
                  onTap: () => routeNavigate(context, '/encontrar-medicamento'),
                ),
                LinkCard(
                  label: 'MARCAR\nCONSULTA/EXAME',
                  assetPath: 'assets/icn-calendar-create.svg',
                  onTap: () => routeNavigate(context, '/consulta-exame'),
                ),
                LinkCard(
                  label: 'ENCONTRAR FARMÁCIA',
                  assetPath: 'assets/icn-discount.svg',
                  onTap: () => routeNavigate(context, '/encontrar-farmacia'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
