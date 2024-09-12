import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_add_item_list_model.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/constants/memento_icons.dart';

class ActivityAddItemPage extends AddItemModel {
  ActivityAddItemPage()
      : super(
            "NOVA\nATIVIDADE",
            "images/add_activity.png",
            MementoIcons.iconawesomewalking,
            GeneralAppColor.activityBar1,
            "Atividade");
}
