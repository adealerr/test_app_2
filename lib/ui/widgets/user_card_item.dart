import 'package:flutter/material.dart';

class UserCardItem extends StatefulWidget {
  const UserCardItem(
      {required this.name, required this.username, this.onPressed, Key? key})
      : super(key: key);

  final String name;
  final String username;
  final VoidCallback? onPressed;

  @override
  State<UserCardItem> createState() => _UserCardItemState();
}

class _UserCardItemState extends State<UserCardItem> {
  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => widget.onPressed?.call(),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black12,
              width: 4,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildUsername(),
              const SizedBox(height: 12),
              _buildName(),
            ],
          ),
        ),
      );

  Widget _buildName() => Text(
        'Name: ${widget.name}',
        overflow: TextOverflow.fade,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget _buildUsername() => Text(
        'Username: "${widget.username}"',
        overflow: TextOverflow.fade,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );
}
