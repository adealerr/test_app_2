import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlbumItem extends StatefulWidget {
  const AlbumItem({required this.imagePreview,
    required this.title,
    this.onPressed,
    this.isLast = false,
    Key? key})
      : super(key: key);

  final String imagePreview;
  final String title;
  final VoidCallback? onPressed;
  final bool isLast;

  @override
  State<AlbumItem> createState() => _AlbumItemState();
}

class _AlbumItemState extends State<AlbumItem> {
  @override
  Widget build(BuildContext context) =>
      InkWell(
        onTap: () => widget.onPressed?.call(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildImagePreview(),
                  const SizedBox(width: 16),
                  _buildTitle(),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildImagePreview() =>
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: CachedNetworkImage(
          width: 70,
          height: 70,
          imageUrl: widget.imagePreview,
          fadeInCurve: Curves.easeInOut,
          placeholder: (context, _) => const SizedBox.shrink(),
        ),
      );

  Widget _buildTitle() =>
      Flexible(
        child: Text(
          widget.title,
          overflow: TextOverflow.fade,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
