import 'dart:convert';

import 'package:cookbook/animations/container.dart';
import 'package:cookbook/animations/fade.dart';
import 'package:cookbook/animations/physics_simulation.dart';
import 'package:cookbook/content_model.dart';
import 'package:cookbook/design/custom_fonts.dart';
import 'package:cookbook/design/drawer.dart';
import 'package:cookbook/design/fonts.dart';
import 'package:cookbook/design/snackbar_demo.dart';
import 'package:cookbook/design/tabs_demo.dart';
import 'package:cookbook/design/update_ui_orientation.dart';
import 'package:cookbook/design/use_themes.dart';
import 'package:cookbook/effects/download_button.dart';
import 'package:cookbook/effects/drag_element.dart';
import 'package:cookbook/effects/expandable_fab.dart';
import 'package:cookbook/effects/gradient_bubble.dart';
import 'package:cookbook/effects/nested_navigation.dart';
import 'package:cookbook/effects/photo_filter_carousel.dart';
import 'package:cookbook/effects/scrolling_parallax.dart';
import 'package:cookbook/effects/shimmer_loading.dart';
import 'package:cookbook/effects/staggered_menu_animation.dart';
import 'package:cookbook/effects/typing_indicator.dart';
import 'package:cookbook/forms/focus_text_field.dart';
import 'package:cookbook/forms/form_validation.dart';
import 'package:cookbook/forms/handle_change_text_field.dart';
import 'package:cookbook/forms/retrieve_value_text_field.dart';
import 'package:cookbook/forms/style_text_field.dart';
import 'package:cookbook/gestures/handle_tap.dart';
import 'package:cookbook/gestures/swipe_to_dismiss.dart';
import 'package:cookbook/gestures/touch_ripple.dart';
import 'package:cookbook/images/image_cache.dart';
import 'package:cookbook/images/image_network.dart';
import 'package:cookbook/images/image_placeholder.dart';
import 'package:cookbook/lists/basic_list.dart';
import 'package:cookbook/lists/floating_app_bar.dart';
import 'package:cookbook/lists/grid_list.dart';
import 'package:cookbook/lists/horizontal_list.dart';
import 'package:cookbook/lists/long_list.dart';
import 'package:cookbook/lists/mixed_list.dart';
import 'package:cookbook/maintenance/error_reporting.dart';
import 'package:cookbook/navigation/hero_animation.dart';
import 'package:cookbook/navigation/naviagate_return_data.dart';
import 'package:cookbook/navigation/navigate_arguments.dart';
import 'package:cookbook/navigation/navigate_name.dart';
import 'package:cookbook/navigation/navigation_and_back.dart';
import 'package:cookbook/navigation/passing_data.dart';
import 'package:cookbook/networking/authorization.dart';
import 'package:cookbook/networking/background_parsing.dart';
import 'package:cookbook/networking/delete_data_on_network.dart';
import 'package:cookbook/networking/fetch_data.dart';
import 'package:cookbook/networking/send_data.dart';
import 'package:cookbook/networking/update_data_over_network.dart';
import 'package:cookbook/networking/web_socket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'animations/route_transition.dart';

class TitlePage extends StatefulWidget {
  final ContentModel? model;

  TitlePage({this.model});

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  List<ContentModel> _list = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    if (widget.model == null) {
      String listAsString =
          await rootBundle.loadString('assets/json/content.json');
      setState(() {
        _list = modelFromJson(listAsString);
      });
    } else {
      setState(() {
        _list = widget.model!.subTitle!;
      });
    }
  }

  List<ContentModel> modelFromJson(String str) => List<ContentModel>.from(
      json.decode(str).map((x) => ContentModel.fromJson(x)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model == null ? 'Cookbook' : widget.model!.title!),
      ),
      body: _list.length > 0
          ? Container(
              child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(_list[index].title!),
                        onTap: () {
                          if (_list[index].subTitle!.length > 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TitlePage(model: _list[index])));
                          } else {
                            contentSwitchBuilder(_list[index], context);
                          }
                        },
                      )))
          : Container(),
    );
  }
}

void contentSwitchBuilder(model, context) {
  print('id =========> ${model.id}');

  switch (model.id) {
    case 101:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RouteTransition()));
      break;
    case 102:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PhysicsCardDragDemo()));
      break;
    case 103:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AnimatedContainerApp()));
      break;
    case 104:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Fade()));
      break;

    case 201:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyDrawer()));
      break;
    case 202:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SnackBarDemo()));
      break;
    case 203:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Fonts()));
      break;
    case 204:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UpdateUiOrientation()));
      break;
    case 205:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CustomFonts()));
      break;
    case 206:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UseThemes()));
      break;
    case 207:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TabsDemo()));
      break;

    case 301:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ExampleCupertinoDownloadButton()));
      break;
    case 302:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NestedNavigation()));
      break;
    case 303:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PhotoFilterCarousel()));
      break;
    case 304:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ScrollingParallax()));
      break;
    case 305:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ShimmerLoading(isLoading: true, child: Container())));
      break;
    case 306:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StaggeredMenuAnimations()));
      break;
    case 307:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ExampleTypingIndicator()));
      break;
    case 308:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ExampleExpandableFab()));
      break;
    case 309:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GradientBubble()));
      break;
    case 3010:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DragAndDrop()));
      break;

    case 401:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FormValidation()));
      break;
    case 402:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StyleTextField()));
      break;
    case 403:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FocusTextField()));
      break;
    case 404:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HandleChangeTextField()));
      break;
    case 405:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RetrieveValueTextField()));
      break;

    case 501:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TouchRipple()));
      break;
    case 502:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HandleTap()));
      break;
    case 503:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SwipeToDismissible()));
      break;

    case 601:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ImageNetwork()));
      break;
    case 602:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ImagePlaceHolder()));
      break;
    case 603:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ImageCached()));
      break;


    case 701:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ExampleGridList()));
      break;
    case 702:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HorizontalList()));
      break;
    case 703:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MixedList()));
      break;
    case 704:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FloatingAppBar()));
      break;
    case 705:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BasicList()));
      break;
    case 706:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LongList()));
      break;

    case 801:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ErrorReporting()));
      break;

    case 901:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HeroAnimation()));
      break;
    case 902:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavigationAndBack()));
      break;
    case 903:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavigateName()));
      break;
    case 904:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavigateArguments()));
      break;
    case 905:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavigateReturnData()));
      break;
    case 906:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PassingData()));
      break;

    case 1001:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DeleteDataOnNetwork()));
      break;
    case 1002:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FetchData()));
      break;
    case 1003:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Authorization()));
      break;
    case 1004:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BackgroundParsing()));
      break;
    case 1005:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SendData()));
      break;
    case 1006:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UpdateDataOverNetwork()));
      break;
    case 1007:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ExampleWebSocket()));
      break;
  }
}
