import 'package:eclipse_test/bloc/home/home_bloc.dart';
import 'package:eclipse_test/ui/widgets/comment_input_view.dart';
import 'package:eclipse_test/utils/base_bloc_state.dart';
import 'package:eclipse_test/utils/bloc_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState
    extends BaseBlocState<PostDetailsScreen, HomeBloc> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Post comments'),
        ),
        body: _buildBody(),
      );

  Widget _buildBody() => BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          final BlocAction? action = state.action;
          if (action is ShowLoader) {
            /// TODO
          }
          if (action is ShowCommentBottomSheet) {
            _showCommentBottomSheet();
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    itemBuilder: (_, index) => _buildComment(
                        name: state.commentsBySelectedPost[index].name,
                        email: state.commentsBySelectedPost[index].email,
                        body: state.commentsBySelectedPost[index].body),
                    separatorBuilder: (_, __) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(
                        height: 2,
                        thickness: 2,
                      ),
                    ),
                    itemCount: state.commentsBySelectedPost.length,
                  ),
                ),
                _buildButton(),
              ],
            ),
          ),
        ),
      );

  Widget _buildComment(
          {required String name,
          required String email,
          required String body}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            email,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            body,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );

  Widget _buildButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: GestureDetector(
          onTap: () => getBloc.add(
            const HomeEvent.addCommentClicked(),
          ),
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

  void _showCommentBottomSheet() {
    showMaterialModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: CommentInputView(
            onNameChanged: (value) => getBloc.add(HomeEvent.nameChanged(value)),
            onEmailChanged: (value) =>
                getBloc.add(HomeEvent.emailChanged(value)),
            onTextChanged: (value) => getBloc.add(HomeEvent.textChanged(value)),
            onButtonPressed: () {
              getBloc.add(const HomeEvent.sendComment());
              Future.delayed(const Duration(milliseconds: 100),
                  () => Navigator.pop(context));
            },
          ),
        ),
      ),
    );
  }
}
