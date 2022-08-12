import 'package:flutter/material.dart';
import 'package:skynexui_responsive_stylesheet/breakpoints/breakpoints.dart';
import 'package:skynexui_responsive_stylesheet/responsive/responsive.dart';
import 'package:winsocial/shared/constants.dart';
import 'package:winsocial/shared/routes.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '{full_username}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF546876),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '123.456.789-00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF546876),
              ),
            ),
          ),
          const SizedBox(height: 48),
          Visibility(
            visible: responsive.value({
              Breakpoints.xs: true,
              Breakpoints.sm: true,
              Breakpoints.md: true,
              Breakpoints.lg: false,
            }),
            child: Column(
              children: [
                SideBarLinkItem(
                  label: 'TeleSaúde',
                  onTap: () => routeNavigate(context, '/telemedicina'),
                ),
                SideBarLinkItem(
                  label: 'Encontrar Medicamento',
                  onTap: () => routeNavigate(context, '/encontrar-medicamento'),
                ),
                SideBarLinkItem(
                  label: 'Marcar Consulta/Exame',
                  onTap: () => routeNavigate(context, '/consulta-exame'),
                ),
                SideBarLinkItem(
                  label: 'Encontrar Farmácia',
                  onTap: () => routeNavigate(context, '/encontrar-farmacia'),
                ),
                SideBarLinkItem(
                  label: 'Consulta por Vídeo',
                  onTap: () => routeNavigate(context, 'https://epharma.docway.com.br/'),
                ),
              ],
            ),
          ),
          SideBarLinkItem(
            label: 'Cartão Virtual',
            onTap: () => routeNavigate(context, '/cartao'),
          ),
          SideBarLinkItem(
            label: 'Alterar Senha',
            onTap: () => routeNavigate(context, '/alterar-senha'),
          ),
          SideBarLinkItem(
            label: 'Sair',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SideBarLinkItem extends StatefulWidget {
  const SideBarLinkItem({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  State<SideBarLinkItem> createState() => _SideBarLinkItemState();
}

class _SideBarLinkItemState extends State<SideBarLinkItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (event) => setState(() => isHovering = !isHovering),
      onTap: widget.onTap,
      child: Container(
        height: 40,
        width: 200,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isHovering ? constants.primary : Colors.transparent,
        ),
        padding: const EdgeInsets.only(left: 24),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            color: isHovering ? Colors.white : const Color(0xFF546876),
          ),
        ),
      ),
    );
  }
}
