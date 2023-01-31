import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../view_models/home_view_model.dart';

class ProviderList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => HomeViewModel()),
  ];
}