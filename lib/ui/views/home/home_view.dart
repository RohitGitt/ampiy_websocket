import 'package:ampiy/ui/common/app_colors.dart';
import 'package:ampiy/ui/common/app_strings.dart';
import 'package:ampiy/ui/common/components/dump_widget.dart';
import 'package:ampiy/ui/common/components/no_data_widget.dart';
import 'package:ampiy/ui/common/ui_helpers.dart';
import 'package:ampiy/ui/views/home/components/coins_item.dart';
import 'package:ampiy/ui/views/home/components/search_bar.dart';
import 'package:ampiy/ui/views/home/home_view.form.dart';
import 'package:ampiy/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: "search")
  ]
)
class HomeView extends StackedView<HomeViewModel> with $HomeView{
  const HomeView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.initialize();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(HomeViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }


  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: secondaryPadding , horizontal: secondaryPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(title: HomeViewUI.ksCoins , fontSize:fontSize30 , fontWeight: FontWeight.bold ),
                      buildSearchBar(controller: searchController , focusNode: searchFocusNode , onChanged: (search) {
                        viewModel.filter(viewModel.data);
                      }, )
                    ],
                  ),
                ) ,
        
                VxConditional(
                  condition:  viewModel.data?.isNotEmpty ?? false,
                  fallback: (context) {
                    return buildNoDataWidget(title: ((viewModel.searchValue != null) || (viewModel.searchValue?.isNotEmpty ?? false )) ? "No Match Found" : null).expand();
                  },
                  builder: (context) {
                    return Container(
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: viewModel.data!.length ,
                    itemBuilder: (context, index) {
                      final item = viewModel.data![index];
                      return buildCoinsItem(title: item?.T ?? "N/A" , description: item?.s ?? "N/A" , price:  formatDoubleString(item?.c) ?? "N/A" , percentage: item?.p  , boxColor: index%2 == 0 ? kcVeryLightBlue : kcWhite , isInProfit: viewModel.isProfit(item?.p ?? ""));
                    },
                  ),
                ).expand();
                  },
                )
        
                
              ],
            ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
