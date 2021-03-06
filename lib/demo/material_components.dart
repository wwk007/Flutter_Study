import 'package:flutter/material.dart';
import 'package:flutter_app/demo/test/test_demo.dart';
import './button_demo.dart';
import './floating_action_button_demo.dart';
import './popup_menu_button_demo.dart';
import './form_demo.dart';
import './checkbox_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './datetime_demo.dart';
import './simple_dialog_demo.dart';
import './alert_dialog_demo.dart';
import './bottom_sheet_demo.dart';
import './snackbar_demo.dart';
import './expansion_panel_demo.dart';
import './chip_demo.dart';
import './data_tab_demo.dart';
import './paginated_datetab_demo.dart';
import './card_demo.dart';
import './stepper_demo.dart';
import './navigator_demo.dart';
import './state/state_management_demo.dart';
import './stream/stream_demo.dart';
import './rxdart/rxdart_demo.dart';
import './bloc/bloc_demo.dart';
import './http/http_demo.dart';
import './http/http_dart_io_demo.dart';
import './animation/animation_demo.dart';
import './i18n/i18n_demo.dart';
import './mobpush/mobpush_demo.dart';
import './flutter_to_android_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'Test', page: TestDemo()),
          ListItem(title: 'Flutter-to-android', page: FlutterToAndroidDemo()),
          ListItem(title: 'Mobpush', page: MobpushDemo()),
          ListItem(title: 'I18n', page: I18nDemo()),
          ListItem(title: 'Animation', page: AnimationDemo()),
          ListItem(title: 'Http', page: HttpDemo()),
          ListItem(title: 'Http-dartIo', page: HttpDartIoDemo()),
          ListItem(title: 'Bloc', page: BlocDemo()),
          ListItem(title: 'Rxdart', page: RxDartDemo()),
          ListItem(title: 'Stream', page: StreamDemo()),
          ListItem(title: 'State-management', page: StateManagementDemo()),
          ListItem(title: 'Mdc', page: MaterialComponents()),
          ListItem(title: 'Form', page: FormDemo()),
          ListItem(title: 'About', page: PageDemo(title: 'About',)),
          ListItem(title: 'Stepper', page: StepperDemo()),
          ListItem(title: 'Card', page: CardDemo()),
          ListItem(title: 'PaginatedDataTable', page: PaginatedDataTableDemo()),
          ListItem(title: 'DataTab', page: DataTabDemo()),
          ListItem(title: 'Chip', page: ChipDemo()),
          ListItem(title: 'ExpansionPanel', page: ExpansionPanelDemo()),
          ListItem(title: 'SnackBar', page: SnackBarDemo()),
          ListItem(title: 'BottomSheet', page: BottomSheetDemo()),
          ListItem(title: 'AlertDialog', page: AlertDialogDemo()),
          ListItem(title: 'SimpleDialog', page: SimpleDialogDemo()),
          ListItem(title: 'DateTime', page: DateTimeDemo()),
          ListItem(title: 'Slide', page: SliderDemo()),
          ListItem(title: 'Switch', page: SwitchDemo()),
          ListItem(title: 'Radio', page: RadioDemo()),
          ListItem(title: 'Checkbox', page: CheckboxDemo()),
          ListItem(title: 'Form', page: FormDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  ListItem({
      this.title,
      this.page,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

