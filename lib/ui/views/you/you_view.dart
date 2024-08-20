
import 'package:ampiy/ui/common/app_strings.dart';
import 'package:ampiy/ui/common/components/dump_widget.dart';
import 'package:ampiy/ui/views/you/you_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class YouView extends StatelessWidget {
  const YouView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YouViewmodel>.reactive(
      viewModelBuilder: ()=> YouViewmodel(), 
      builder: (context, viewModel, child)=> Scaffold(
        body: Center(child: buildText(title: YouViewUI.ksYouScreen ,fontSize: 30),),
      ) );
  }
}