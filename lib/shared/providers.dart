import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:winsocial/controller/forgot_controller.dart';
import 'package:winsocial/controller/login_controller.dart';
import 'package:winsocial/controller/notification_controller.dart';
import 'package:winsocial/shared/routes.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider<LoginController>.value(
    value: loginController,
  ),
  ChangeNotifierProvider(
    create: (context) => NotificationController(),
  ),
  ChangeNotifierProvider(
    create: (context) => ForgotController(
      notificationController: context.read<NotificationController>(),
    ),
  ),
];
