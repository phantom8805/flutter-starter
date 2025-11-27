import 'package:flutter/material.dart';
import 'package:flutterstarter/enums/message_type.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/models/message.dart';
import 'package:flutterstarter/widgets/shared/empty.dart';
import 'package:mobx/mobx.dart';

class SnackBarMessages extends StatelessWidget {
  const SnackBarMessages({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => context.storeNonListened.messages.iterator, (messagesIterator) {
        final List<Message> messages = [];

        while (messagesIterator.moveNext()) {
          if (messagesIterator.current.type != MessageType.notification) {
            messages.add(messagesIterator.current);
          }
        }

        for (final message in messages) {
          context.scaffoldMessenger.showSnackBar(
            SnackBar(showCloseIcon: true, content: Text(context.t(message.label))),
          );
          context.storeNonListened.removeMessage(message);
        }
      });
    });

    return const Empty();
  }
}
