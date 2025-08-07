import 'package:common_jds_flutter_example/modules/Toast/ui/toast_widget_page.dart';
import 'package:common_jds_flutter_example/modules/action_bar/ui/action_bar_widget_page.dart';
import 'package:common_jds_flutter_example/modules/action_dropdown/data/ui/action_dropdown_widget_page.dart';
import 'package:common_jds_flutter_example/modules/add_tags_field/ui/add_tags_page.dart';
import 'package:common_jds_flutter_example/modules/app_bar/ui/app_bar_widget_page.dart';
import 'package:common_jds_flutter_example/modules/avatar/ui/avatar_page.dart';
import 'package:common_jds_flutter_example/modules/button/ui/button_page.dart';
import 'package:common_jds_flutter_example/modules/calender/ui/calendar_widget_page.dart';
import 'package:common_jds_flutter_example/modules/checkbox/ui/checkbox_page.dart';
import 'package:common_jds_flutter_example/modules/chip_widget/ui/chip_widget_page.dart';
import 'package:common_jds_flutter_example/modules/custom_button_with_dropdown/ui/primary_button_page.dart';
import 'package:common_jds_flutter_example/modules/custom_text/ui/custom_text_page.dart';
import 'package:common_jds_flutter_example/modules/dialog/ui/radio_button_widget_page.dart';
import 'package:common_jds_flutter_example/modules/dropdown/ui/multi_dropdown_widget_page.dart';
import 'package:common_jds_flutter_example/modules/dropdown/ui/multi_select_search_dropdown_widget_page.dart';
import 'package:common_jds_flutter_example/modules/dropdown/ui/single_dropdown_widget_page.dart';
import 'package:common_jds_flutter_example/modules/dropdown/ui/single_select_search_dropdown_widget_page.dart';
import 'package:common_jds_flutter_example/modules/image_dialog/ui/image_dialog_page.dart';
import 'package:common_jds_flutter_example/modules/image_viewer/ui/image_viewer_page.dart';
import 'package:common_jds_flutter_example/modules/loaders/ui/loader_page.dart';
import 'package:common_jds_flutter_example/modules/main_layout/ui/main_layout.dart';
import 'package:common_jds_flutter_example/modules/overlay/ui/overlay_drawer_widget_page.dart';
import 'package:common_jds_flutter_example/modules/pagination/ui/pagination_widget_page.dart';
import 'package:common_jds_flutter_example/modules/primary_button/ui/primary_button_page.dart';
import 'package:common_jds_flutter_example/modules/radio_button/ui/radio_button_widget_page.dart';
import 'package:common_jds_flutter_example/modules/rounded_rectangle/ui/rounded_rectangle.dart';
import 'package:common_jds_flutter_example/modules/search_field/ui/search_field_widget_page.dart';
import 'package:common_jds_flutter_example/modules/search_field/ui/search_field_with_suggestions_widget_page.dart';
import 'package:common_jds_flutter_example/modules/single_date_calender/data/ui/single_date_picker_widget_page.dart';
import 'package:common_jds_flutter_example/modules/switch/ui/switch_widget_page.dart';
import 'package:common_jds_flutter_example/modules/table/ui/custom_table_widget_page.dart';
import 'package:common_jds_flutter_example/modules/text_field/ui/textfield_page.dart';
import 'package:common_jds_flutter_example/modules/time_picker/ui/time_picker_widget_page.dart';
import 'package:common_jds_flutter_example/modules/tooltip/ui/tooltip_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

class AppPages {
  // Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _sectionNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: _Paths.CUSTOM_TEXT_PAGE,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
          parentNavigatorKey: _rootNavigatorKey,
          navigatorKey: _sectionNavigatorKey,
          builder: (context, state, child) {
            return MainLayout(
              state: state,
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: _Paths.CUSTOM_TEXT_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const CustomTextPage();
              },
            ),
            GoRoute(
              path: _Paths.AVATAR_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const AvatarPage();
              },
            ),
            GoRoute(
              path: _Paths.BUTTON_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const ButtonPage();
              },
            ),
            GoRoute(
              path: _Paths.PRIMARY_BUTTON_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const PrimaryButtonPage();
              },
            ),
            GoRoute(
              path: _Paths.BUTTON_WITH_DROPDOWN_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const CustomButtonWithDropdownPage();
              },
            ),
            GoRoute(
              path: _Paths.CHECKBOX_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const CheckboxPage();
              },
            ),
            GoRoute(
              path: _Paths.TEXTFIELD_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const TextFieldPage();
              },
            ),
            GoRoute(
              path: _Paths.ADD_TAGS_FIELD,
              builder: (BuildContext context, GoRouterState state) {
                return const AddTagsPage();
              },
            ),
            GoRoute(
              path: _Paths.CHIP_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const ChipWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.DROPDOWN_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return SingleSelectDropdownWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.SINGLE_SEARCH_DROPDOWN_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const SingleSelectSearchDropdownWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.MULTI_DROPDOWN_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return MultiSelectDropdownWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.MULTI_SEARCH_DROPDOWN_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const MultiSelectSearchDropdownWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.SEARCH_FIELD_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const SearchFieldPage();
              },
            ),
            GoRoute(
              path: _Paths.SEARCH_FIELD_WITH_SUGGESTIONS_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const SearchFieldWithSuggestionPage();
              },
            ),
            GoRoute(
              path: _Paths.RADIO_BUTTON_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const RadioButtonWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.ACTION_DROPDOWN_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const ActionDropdownWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.APP_BAR,
              builder: (BuildContext context, GoRouterState state) {
                return const AppBarWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.ACTION_BAR,
              builder: (BuildContext context, GoRouterState state) {
                return const ActionBarWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.SWITCH,
              builder: (BuildContext context, GoRouterState state) {
                return const PrimarySwitchWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.PAGINATION,
              builder: (BuildContext context, GoRouterState state) {
                return const PaginationWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.DIALOG,
              builder: (BuildContext context, GoRouterState state) {
                return const CustomDialogWidgetPage();
              },
            ),
            /*GoRoute(
              path: _Paths.TABLE,
              builder: (BuildContext context, GoRouterState state) {
                return const CustomTableWidgetPage();
              },
            ),*/
            GoRoute(
              path: _Paths.ACTION_DROPDOWN_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const ActionDropdownWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.OVERLAYDRAWER,
              builder: (BuildContext context, GoRouterState state) {
                return const OverlayDrawerWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.TOOLTIP_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const TooltipWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.TOAST_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const ToastWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.CALENDAR_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const CalendarWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.SINGLE_DATE_PICKER_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const SingleDatePickerDropdownWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.LOADER_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const LoaderWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.ROUNDED_RECTANGLE_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const RoundedRectangleWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.IMAGE_DIALOG_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const ImageDialogPage();
              },
            ),
            GoRoute(
              path: _Paths.TIME_PICKER_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const TimePickerWidgetPage();
              },
            ),
            GoRoute(
              path: _Paths.IMAGE_VIEWER_PAGE,
              builder: (BuildContext context, GoRouterState state) {
                return const ImageViewerPage();
              },
            ),
          ]),
    ],
  );
}
