import 'package:eclipse_test/bloc/home/home_bloc.dart';
import 'package:eclipse_test/utils/base_bloc_state.dart';
import 'package:flutter/material.dart';

class CommentInputView extends StatefulWidget {
  const CommentInputView(
      {this.onNameChanged,
      this.onEmailChanged,
      this.onTextChanged,
      this.onButtonPressed,
      Key? key})
      : super(key: key);

  final Function(String value)? onNameChanged;
  final Function(String value)? onEmailChanged;
  final Function(String value)? onTextChanged;
  final VoidCallback? onButtonPressed;

  @override
  State<CommentInputView> createState() => _CommentInputViewState();
}

class _CommentInputViewState extends BaseBlocState<CommentInputView, HomeBloc> {
  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(children: [
                _buildNameInput(),
                const SizedBox(height: 8),
                _buildEmailInput(),
                const SizedBox(height: 8),
                _buildTextInput(),
              ]),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildButton(),
            ),
          ),
        ],
      );

  Widget _buildNameInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Name',
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: true,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              disabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
              ),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            onChanged: (value) => widget.onNameChanged?.call(value),
          ),
        ],
      );

  Widget _buildEmailInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: true,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              disabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
              ),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            onChanged: (value) => widget.onEmailChanged?.call(value),
          ),
        ],
      );

  Widget _buildTextInput() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Comment',
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: true,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              disabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
              ),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black38,
                ),
              ),
            ),
            onChanged: (value) => widget.onTextChanged?.call(value),
          ),
        ],
      );

  Widget _buildButton() => Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
        child: GestureDetector(
          onTap: () => widget.onButtonPressed?.call(),
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'Add comment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
}
