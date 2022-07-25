import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OpenedPhotoItem extends StatefulWidget {
  const OpenedPhotoItem({required this.image, required this.text, Key? key})
      : super(key: key);

  final String image;
  final String text;

  @override
  State<OpenedPhotoItem> createState() => _OpenedPhotoItemState();
}

class _OpenedPhotoItemState extends State<OpenedPhotoItem> {
  @override
  Widget build(BuildContext context) =>
     Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              fit: BoxFit.fitWidth,
              imageUrl: widget.image,
              /// TODO
              /// placeholder: (context, _) => Image...
            ),
            const SizedBox(height: 16),
            Text(
              widget.text,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
      );
}
