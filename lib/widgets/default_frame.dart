// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:skynexui_responsive_stylesheet/breakpoints/breakpoints.dart';
import 'package:skynexui_responsive_stylesheet/responsive/responsive.dart';
import 'package:winsocial/controller/notification_controller.dart';
import 'package:winsocial/shared/toast_card.dart';
import 'package:winsocial/widgets/side_bar_menu.dart';
import 'package:winsocial/widgets/default_header.dart';
import 'package:provider/provider.dart';

class DefaultFrame extends StatefulWidget {
  DefaultFrame({
    Key? key,
    required this.child,
    this.boxConstraints,
  }) : super(key: key);

  final Widget child;
  late BoxConstraints? boxConstraints;

  @override
  State<DefaultFrame> createState() => _DefaultFrameState();
}

class _DefaultFrameState extends State<DefaultFrame> {
  late NotificationController notificationController;
  late Responsive responsive;
  bool opened = false;

  @override
  void initState() {
    super.initState();
    notificationController = context.read<NotificationController>();
    responsive = Responsive(context);

    _registerListener({
      required NotificationController notificationController,
      required Responsive responsive,
    }) {
      notificationController.addListener(() {
        final notifications = notificationController.notifications;
        if (notifications.isNotEmpty &&
            [Breakpoints.xs].contains(responsive.getActiveBreakpoint())) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Dismissible(
                key: UniqueKey(),
                child: toastCard(
                  notifications.first.message,
                  error: notifications.first.error,
                ),
                onDismissed: (direction) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar(
                    reason: SnackBarClosedReason.dismiss,
                  );
                },
              ),
            ),
          );
        }
      });
    }

    _registerListener(
      notificationController: notificationController,
      responsive: responsive,
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(82),
          child: DefaultHeader(
            onTapDrawer: () => setState(() => opened = !opened),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Container(
                      constraints: widget.boxConstraints,
                      child: widget.child,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                // top: 0,
                top: 0,
                right: opened ? 0 : -205,
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    elevation: 6,
                    child: SideBarMenu(),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: notificationController,
                builder: (context, child) {
                  return Visibility(
                    visible: ![Breakpoints.xs].contains(
                          responsive.getActiveBreakpoint(),
                        ) &&
                        notificationController.notifications.isNotEmpty,
                    child: SizedBox(
                      height: 600,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: 300,
                          height: 240,
                          child: notificationController.getAnimatedList(),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
