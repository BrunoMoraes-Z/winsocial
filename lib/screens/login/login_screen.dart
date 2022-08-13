import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skynexui_responsive_stylesheet/breakpoints/breakpoints.dart';
import 'package:skynexui_responsive_stylesheet/responsive/responsive.dart';
import 'package:winsocial/controller/login_controller.dart';
import 'package:winsocial/controller/notification_controller.dart';
import 'package:winsocial/models/app_notification.dart';
import 'package:winsocial/screens/login/widgets/forgot_dialog.dart';
import 'package:winsocial/screens/login/widgets/login_button.dart';
import 'package:winsocial/shared/constants.dart';
import 'package:winsocial/shared/toast_card.dart';
import 'package:winsocial/widgets/custom_password_text_field.dart';
import 'package:winsocial/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late NotificationController notificationController;
  late Responsive responsive;

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

  @override
  void initState() {
    super.initState();
    notificationController = context.read<NotificationController>();
    responsive = Responsive(context);

    _registerListener(
      notificationController: notificationController,
      responsive: responsive,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = context.read<LoginController>();

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      child: Scaffold(
        backgroundColor: constants.primary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(82),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(26),
            child: Row(
              children: [
                Image.asset('winsocial.png', height: 30),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Spacer
                  const SizedBox(width: double.infinity, height: 55),
                  // Body
                  Container(
                    width: responsive.value({
                      Breakpoints.xs: 400,
                      Breakpoints.sm: 400,
                      Breakpoints.md: 400,
                      Breakpoints.lg: 500,
                      Breakpoints.xl: 500,
                    }),
                    height: 480,
                    padding: responsive.value({
                      Breakpoints.xs:
                          const EdgeInsets.symmetric(horizontal: 16),
                      Breakpoints.sm:
                          const EdgeInsets.symmetric(horizontal: 16),
                      Breakpoints.xl: EdgeInsets.zero,
                    }),
                    child: Column(
                      children: [
                        Image.asset('winsocial-white.png', height: 60),
                        const SizedBox(height: 16),
                        Padding(
                          padding: responsive.value({
                            Breakpoints.xs:
                                const EdgeInsets.symmetric(horizontal: 16),
                            Breakpoints.xl: EdgeInsets.zero,
                          }),
                          child: const Text(
                            'Preencha os dados para acessar sua conta.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(
                          label: 'CPF',
                          onChanged: loginController.setCpf,
                          inputFormatters: constants.cpfFormatters,
                          maxSize: responsive.value({
                            Breakpoints.xs: 400,
                            Breakpoints.sm: 400,
                            Breakpoints.md: 400,
                            Breakpoints.lg: 500,
                            Breakpoints.xl: 500,
                          }),
                          textInputType: TextInputType.number,
                        ),
                        const SizedBox(height: 30),
                        CustomPasswordTextField(
                          label: 'Senha',
                          onChanged: loginController.setPassword,
                          maxSize: responsive.value({
                            Breakpoints.xs: 400,
                            Breakpoints.sm: 400,
                            Breakpoints.md: 400,
                            Breakpoints.lg: 500,
                            Breakpoints.xl: 500,
                          }),
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 80),
                        LoginButton(
                          loginController: loginController,
                          notificationController: notificationController,
                          onTap: () {
                            if (loginController.validate()) {
                              loginController.login(notificationController);
                            } else {
                              notificationController.addNotification(
                                const AppNotification(
                                  message:
                                      'Preencha os campos corretamente para fazer o login',
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 32),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const ForgotPasswordDialog();
                              },
                            );
                          },
                          splashFactory: NoSplash.splashFactory,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          mouseCursor: SystemMouseCursors.click,
                          child: const Text(
                            'ESQUECEU SUA SENHA?',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible:
                  ![Breakpoints.xs].contains(responsive.getActiveBreakpoint()),
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
            ),
          ],
        ),
      ),
    );
  }
}
