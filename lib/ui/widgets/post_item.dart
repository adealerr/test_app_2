import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  const PostItem(
      {required this.title, required this.body, this.onMorePressed, Key? key})
      : super(key: key);

  final String title;
  final String body;
  final VoidCallback? onMorePressed;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) =>
      InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => widget.onMorePressed?.call(),
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
              _buildTitle(),
              const SizedBox(height: 12),
              _buildBody(),
            ],
          ),
        ),
      );

  Widget _buildBody() =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                  widget.body,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ),
                const Text(
                  'view more',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
          ),
        ],
      );

  Widget _buildTitle() =>
      Text(
        widget.title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      );
}
