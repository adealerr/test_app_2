import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EmojiBottomSheet extends StatefulWidget {
  final List<String> emojis;

  const EmojiBottomSheet({required this.emojis, Key? key}) : super(key: key);

  @override
  State<EmojiBottomSheet> createState() => _EmojiBottomSheetState();
}

class _EmojiBottomSheetState extends State<EmojiBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Column(
          children: [
            Expanded(
              child: Center(
                child: GridView.count(
                  physics: const ClampingScrollPhysics(),
                  crossAxisCount: 6,
                  shrinkWrap: true,
                  primary: false,
                  childAspectRatio: (size.width / 2 / 160),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  // padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  children: List.generate(
                    widget.emojis.length,
                        (index) => _buildEmoji(index),
                  ),
                ),
              ),
            ),
          ],
        ),

    );
  }

  Widget _buildEmoji(int index) =>
      GestureDetector(
        onTap: () => Navigator.of(context).pop(widget.emojis[index]),
        child: Text(
          widget.emojis[index],
          textScaleFactor: 2,
          textAlign: TextAlign.center
        ),
      );
}
