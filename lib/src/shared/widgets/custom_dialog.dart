import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

import '../../utils/constant.dart';

class CustomDialogBox {
  static warningMessage(
    context, {
    String? title,
    String? message,
    Function(BuildContext context)? onPositiveClick,
  }) {
    showDialog(
      context: context,
      builder: (cntx) {
        return ContentDialog(
          title: Wrap(
            children: [
              Text(title ?? "Warning"),
              const SizedBox(
                width: Constant.minPadding,
              ),
              const Icon(FluentIcons.warning),
            ],
          ),
          content: Text(message ?? ""),
          actions: [
            Button(
              onPressed: () => Navigator.of(cntx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (onPositiveClick != null) {
                  Navigator.of(cntx).pop();
                  onPositiveClick(cntx);
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static errorMessage(
    context, {
    String? title,
    String? message,
  }) {
    return showDialog(
      context: context,
      builder: (cntx) {
        return SingleChildScrollView(
          child: ContentDialog(
            title: Text(title ?? "Error Message"),
            content: Text(
              message ?? "Something wrong, please check.",
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(cntx).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  static successMessage(
    context, {
    String? title,
    String? message,
    Function(BuildContext context)? onPositiveClick,
  }) {
    showDialog(
      context: context,
      builder: (cntx) {
        return ContentDialog(
          title: Text(title ?? "Success Message"),
          content: Text(message ?? "Congrats"),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.of(cntx).pop();
                if (onPositiveClick != null) {
                  onPositiveClick(cntx);
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static warningWithRemarks(
    context, {
    String? title,
    String? message,
    Function(BuildContext context, String remarks)? onPositiveClick,
  }) {
    showDialog(
      context: context,
      builder: (cntx) {
        return WarningWithRemarksDialog(
          title: title,
          warningMessage: message,
          onPositiveClick: onPositiveClick,
        );
      },
    );
  }

  static sapNumberField(
    context, {
    String? title,
    String? message,
    Function(BuildContext context, String sapNumber)? onPositiveClick,
  }) {
    showDialog(
      context: context,
      builder: (cntx) {
        return SAPNumberDialog(
          title: title,
          warningMessage: message,
          onPositiveClick: onPositiveClick,
        );
      },
    );
  }
}

class WarningWithRemarksDialog extends StatefulWidget {
  const WarningWithRemarksDialog({
    Key? key,
    this.title,
    this.warningMessage,
    this.onPositiveClick,
  }) : super(key: key);
  final String? title;
  final String? warningMessage;
  final Function(BuildContext context, String remarks)? onPositiveClick;
  @override
  State<WarningWithRemarksDialog> createState() =>
      _WarningWithRemarksDialogState();
}

class _WarningWithRemarksDialogState extends State<WarningWithRemarksDialog> {
  TextEditingController remarks = TextEditingController();
  @override
  void dispose() {
    remarks.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: Wrap(
        children: [
          Text(widget.title ?? "Warning"),
          const SizedBox(
            width: Constant.minPadding,
          ),
          const Icon(FluentIcons.warning),
          const SizedBox(
            height: Constant.minPadding,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.warningMessage ?? ""),
          const SizedBox(
            height: Constant.minPadding,
          ),
          TextFormBox(
            autovalidateMode: AutovalidateMode.always,
            autofocus: true,
            placeholder: "Remarks",
            maxLines: 5,
            onChanged: (value) {
              setState(() {
                remarks.text = value;
              });
            },
            validator: (value) {
              return value == null || value.isEmpty
                  ? "Remarks is required"
                  : null;
            },
          ),
        ],
      ),
      actions: [
        Button(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: remarks.text.isEmpty
              ? null
              : () {
                  if (widget.onPositiveClick != null) {
                    widget.onPositiveClick!(context, remarks.text);
                  }
                },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class SAPNumberDialog extends StatefulWidget {
  const SAPNumberDialog({
    Key? key,
    this.title,
    this.warningMessage,
    this.onPositiveClick,
  }) : super(key: key);
  final String? title;
  final String? warningMessage;
  final Function(BuildContext context, String remarks)? onPositiveClick;
  @override
  State<SAPNumberDialog> createState() => _SAPNumberDialogState();
}

class _SAPNumberDialogState extends State<SAPNumberDialog> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: Wrap(
        children: [
          Text(widget.title ?? "Warning"),
          const SizedBox(
            width: Constant.minPadding,
          ),
          const Icon(FluentIcons.warning),
          const SizedBox(
            height: Constant.minPadding,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.warningMessage ?? ""),
          const SizedBox(
            height: Constant.minPadding,
          ),
          TextFormBox(
            autovalidateMode: AutovalidateMode.always,
            autofocus: true,
            placeholder: "SAP Number",
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[0-9]"))
            ],
            onChanged: (value) {
              setState(() {
                controller.text = value;
              });
            },
            validator: (value) {
              return value == null || value.isEmpty
                  ? "SAP Number is required"
                  : null;
            },
          ),
        ],
      ),
      actions: [
        Button(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: controller.text.isEmpty
              ? null
              : () {
                  widget.onPositiveClick?.call(context, controller.text);
                  Navigator.of(context).pop();
                },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
