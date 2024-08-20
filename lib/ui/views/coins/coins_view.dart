import 'package:ampiy/ui/common/app_strings.dart';
import 'package:ampiy/ui/common/components/dump_widget.dart';
import 'package:ampiy/ui/views/coins/coins_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CoinsView extends StatelessWidget {
  const CoinsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ViewModelBuilder<CoinsViewmodel>.reactive(
        viewModelBuilder:()=> CoinsViewmodel(), 
        builder: (context, viewModel, child)=> Scaffold(
          body: Center(child: buildText(title: CoinsViewUI.ksCoinScreen ,fontSize: 30),
        ),)
      );
  }

}