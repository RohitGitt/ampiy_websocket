import 'package:ampiy/app/app.locator.dart';
import 'package:ampiy/services/easyLoading/easyLoadingService.dart';
import 'package:ampiy/ui/common/app_colors.dart';
import 'package:ampiy/ui/common/components/custom_bottom_navigation_bar.dart';
import 'package:ampiy/ui/views/coins/coins_view.dart';
import 'package:ampiy/ui/views/home/home_view.dart';
import 'package:ampiy/ui/views/home_screen/components/build_circular_button.dart';
import 'package:ampiy/ui/views/wallet/wallet_view.dart';
import 'package:ampiy/ui/views/you/you_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home_screen_viewmodel.dart';

class HomeScreenView extends StackedView<HomeScreenViewModel> {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    HomeScreenViewModel viewModel,
    Widget? child,
  ) {
    const double bottomNavBarHeight = 70;
    const double circularButtonHeight = 60;
    const double circularButtonWeight = 60;
    return WillPopScope(
        onWillPop: () async {
          if (viewModel.currentIndex == 1 ||
              viewModel.currentIndex == 2 ||
              viewModel.currentIndex == 3) {
            viewModel.setIndex(0);
            return false;
          }
          return true;
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: context.screenHeight - bottomNavBarHeight,
                    child: getViewForIndex(viewModel.currentIndex, () {
                      viewModel.setIndex(0);
                      return Future.value(true);
                    }),
                  ).box.border().make(),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: bottomNavBarHeight,
                      width: double.infinity,
                      child: customNavigationBar(
                          selectedIndex: viewModel.currentIndex,
                          onDestinationSelected: viewModel.setIndex),
                    ).box.shadow.make(),
                  ),
                  Positioned(
                      bottom: bottomNavBarHeight - circularButtonHeight / 2,
                      left: context.screenWidth / 2 - circularButtonWeight / 2,
                      child: buildCircularButton(width: circularButtonWeight, height: circularButtonHeight , onTap: () {
                         locator<EasyLoadingService>().showSuccessToast(
                              title: "Click Not implemented Yet");
                      },))
                ],
              ),
            ),
          ),
        ));
  }

  @override
  HomeScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeScreenViewModel();

  Widget getViewForIndex(int index, Future<bool> Function()? onBack) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const CoinsView();
      case 2:
        return const WalletView();
      case 3:
        return const YouView();

      default:
        return const HomeView();
    }
  }
}
