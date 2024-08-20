import 'package:ampiy/services/easyLoading/easyLoadingService.dart';
import 'package:ampiy/services/home/webSocketService.dart';
import 'package:ampiy/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:ampiy/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:ampiy/ui/views/home/home_view.dart';
import 'package:ampiy/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ampiy/ui/views/home_screen/home_screen_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: HomeScreenView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: EasyLoadingService),
    LazySingleton(classType: WebSocketService),

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
