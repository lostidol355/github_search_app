import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  Icon? leadingIcon;
  String? info;
  InfoRow({super.key, this.leadingIcon, this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leadingIcon!,
        const SizedBox(
          width: 15,
        ),
        Text(info == null ? "Not available" : info!),
      ],
    );
  }
}
