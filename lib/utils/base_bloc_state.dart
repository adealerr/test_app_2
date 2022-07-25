import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBlocState<W extends StatefulWidget, B extends Bloc>
    extends State<W> {

  B get getBloc => context.read<B>();

  Size get size => MediaQuery.of(context).size;
}
