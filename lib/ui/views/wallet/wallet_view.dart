import 'package:ampiy/ui/common/app_strings.dart';
import 'package:ampiy/ui/common/components/dump_widget.dart';
import 'package:ampiy/ui/views/wallet/wallet_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletViewmodel>.reactive(
      viewModelBuilder: ()=> WalletViewmodel(), 
      builder: (context, viewModel, child)=> Scaffold(
        body: Center(child: buildText(title: WalletViewUI.ksWalletScreen ,fontSize: 30),),
      ),
    );
  }
}