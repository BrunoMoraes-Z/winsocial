import 'package:flutter/material.dart';

Widget toastCard(String message, {bool error = true}) {
  return Container(
    padding: const EdgeInsets.only(
      top: 16,
      right: 16,
    ),
    child: Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(3),
      color: Colors.transparent,
      child: Container(
        height: 60.0,
        width: 300,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: error ? Colors.redAccent : Colors.green[300],
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                message,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
