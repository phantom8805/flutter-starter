import 'package:flutter/material.dart';
import 'package:flutterstarter/enums/message_report_level.dart';
import 'package:flutterstarter/enums/message_type.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/models/message.dart';
import 'package:flutterstarter/widgets/shared/empty.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => context.storeNonListened.messages.iterator, (messagesIterator) {
        final List<Message> messages = [];

        while (messagesIterator.moveNext()) {
          if (messagesIterator.current.type == MessageType.notification) {
            messages.add(messagesIterator.current);
          }
        }

        for (final message in messages) {
          final closeDialog = showDialog<void>(
            context: context,
            builder: (BuildContext context) => _NotificationModal(message: message),
          );
          context.storeNonListened.removeMessage(message);

          closeDialog.then((_) {
            try {
              if (context.mounted) {
                context.storeNonListened.notificationApi.read(message.key);
              }
            } catch (_) {}
          });
        }
      }, fireImmediately: true);
    });

    return const Empty();
  }
}

class _NotificationModal extends StatelessWidget {
  final Message message;

  const _NotificationModal({required this.message});

  ElevatedButton _renderActionButton(
    BuildContext context,
    Message message,
    MessageAction action,
  ) {
    final ({Color textColor, Color backgroundColor}) colors = switch (message.reportLevel) {
      MessageReportLevel.info => (textColor: context.onPrimary, backgroundColor: context.primary),
      MessageReportLevel.warning => (textColor: context.onWarning, backgroundColor: context.warning),
      MessageReportLevel.error => (textColor: context.onDanger, backgroundColor: context.danger),
    };

    return _renderButton(
      context,
      text: action.title,
      backgroundColor: colors.backgroundColor,
      textColor: colors.textColor,
      onPressed: () {
        launchUrl(Uri.parse(action.link));
        Navigator.of(context).pop();
      },
    );
  }

  ElevatedButton _renderButton(
    BuildContext context, {
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required void Function() onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.borderRadius),
        ),
      ),
      child: Text(
        context.t(text),
        style: context.titleMedium?.merge(
          TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final regularTextStyle = context.bodyLarge!.merge(const TextStyle(
      color: Colors.black,
    ));

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(context.borderRadiusLarge)),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
      title: Text(
        message.label,
        style: context.titleLarge?.merge(
          const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: SizedBox(
          width: context.screenWidth,
          child: message.content != null
              ? Row(
                  children: [
                    Text(
                      context.t(message.content),
                      style: regularTextStyle,
                    )
                  ],
                )
              : null),
      actions: [
        _renderButton(
          context,
          text: 'Close',
          backgroundColor: context.disabled,
          textColor: context.onDisabled,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        for (MessageAction action in message.actions ?? []) ...[
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.verticalPadding),
            child: _renderActionButton(context, message, action),
          ),
          SizedBox(height: context.verticalPadding),
        ],
      ],
    );
  }
}
