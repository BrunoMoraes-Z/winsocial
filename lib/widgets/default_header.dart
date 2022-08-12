import 'package:flutter/material.dart';
import 'package:skynexui_responsive_stylesheet/breakpoints/breakpoints.dart';
import 'package:skynexui_responsive_stylesheet/responsive/responsive.dart';
import 'package:winsocial/shared/routes.dart';
import 'package:winsocial/widgets/link_label.dart';
import 'package:winsocial/widgets/menu_icon.dart';
import 'package:winsocial/shared/constants.dart';
import 'package:go_router/go_router.dart';

class DefaultHeader extends StatelessWidget {
  const DefaultHeader({
    Key? key,
    required this.onTapDrawer,
  }) : super(key: key);

  final VoidCallback onTapDrawer;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Material(
      elevation: 6,
      child: Container(
        height: 82,
        color: constants.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => context.push('/'),
              child: Image.asset(
                'winsocial-white.png',
                height: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: responsive.value({
                    Breakpoints.xl: true,
                    Breakpoints.lg: true,
                    Breakpoints.xs: false,
                  }),
                  child: Row(
                    children: [
                      LinkLabel(
                        label: 'TeleSaúde',
                         onTap: () => routeNavigate(context, '/telemedicina'),
                      ),
                      LinkLabel(
                        label: 'Encontrar\nMedicamento',
                        onTap: () => routeNavigate(context, '/encontrar-medicamento'),
                      ),
                      LinkLabel(
                        label: 'Marcar\nConsulta/Exame',
                        onTap: () => routeNavigate(context, '/consulta-exame'),
                      ),
                      LinkLabel(
                        label: 'Encontrar\nFarmácia',
                        onTap: () => routeNavigate(context, '/encontrar-farmacia'),
                      ),
                      LinkLabel(
                        label: 'Consulta\npor Vídeo',
                        onTap: () => routeNavigate(context, 'https://epharma.docway.com.br/'),
                      ),
                    ],
                  ),
                ),
                MenuIcon(onTap: onTapDrawer),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
