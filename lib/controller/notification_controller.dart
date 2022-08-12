import 'package:flutter/material.dart';
import 'package:winsocial/models/app_notification.dart';
import 'package:winsocial/shared/toast_card.dart';

class NotificationController extends ChangeNotifier {
  final List<AppNotification> notifications = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  addNotification(AppNotification notification) async {
    notifications.add(notification);
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 100));
    if (_key.currentState != null) {
      _key.currentState!.insertItem(0, duration: const Duration(milliseconds: 600));
    }
    Future.delayed(const Duration(seconds: 4), () async {
      if (notifications.contains(notification)) {
        notifications.remove(notification);
        if (_key.currentState != null) {
          _key.currentState!.removeItem(0, (context, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: toastCard(notification.message, error: notification.error),
            );
          });
        }

        if (notifications.isEmpty) {
          await Future.delayed(const Duration(milliseconds: 200));
        }
        notifyListeners();
      }
    });
  }

  _silentDismiss(int index) async {
    notifications.remove(notifications[index]);
    if (notifications.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 200));
    }
    if (_key.currentState != null) {
      _key.currentState!.removeItem(0, (context, animation) {
        return Container();
      });
    }
    notifyListeners();
  }

  AnimatedList getAnimatedList() {
    return AnimatedList(
      key: _key,
      itemBuilder: (context, index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Dismissible(
            key: Key('k-$index'),
            child: toastCard(
              notifications[index].message,
              error: notifications[index].error,
            ),
            onDismissed: (direction) {
              _silentDismiss(index);
            },
          ),
        );
      },
    );
  }
}
