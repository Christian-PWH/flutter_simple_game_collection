import 'dart:convert';

import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_bloc.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_event.dart';
import 'package:flutter_simple_game_collection/utilities/app_themes.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';
import 'package:flutter_simple_game_collection/utilities/preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listGame = [];

  @override
  void initState() {
    super.initState();
    _loadListGame();
  }

  void _loadListGame() {
    DefaultAssetBundle.of(context)
        .loadString("assets/datasets/gameList.json")
        .then((value) {
      final jsonResult = jsonDecode(value);
      setState(() {
        listGame = jsonResult['datas'];
      });
    });
  }

  _setTheme(bool darkTheme) async {
    AppTheme selectedTheme =
        darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
    BlocProvider.of<ThemeBloc>(context)
        .add(ThemeBlocEvent(appTheme: selectedTheme));
    Preferences.saveTheme(selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          AnimatedIconButton(
            alignment: Alignment.center,
            initialIcon: Preferences.getTheme() == AppTheme.lightTheme ? 1 : 0,
            size: 50,
            duration: const Duration(milliseconds: 500),
            splashColor: Colors.transparent,
            icons: const <AnimatedIconItem>[
              AnimatedIconItem(
                icon: Icon(Icons.light_mode, color: kDarkThemeModeColor),
              ),
              AnimatedIconItem(
                icon: Icon(Icons.dark_mode, color: kLightThemeModeColor),
              ),
            ],
            onPressed: () {
              if (Preferences.getTheme() == AppTheme.lightTheme) {
                _setTheme(false);
              } else {
                _setTheme(true);
              }
            },
          ),
        ],
        leading: IconButton(
          alignment: Alignment.center,
          tooltip: "Setting",
          icon: Icon(
            color: Preferences.getTheme() == AppTheme.lightTheme
                ? kLightThemeModeColor
                : kDarkThemeModeColor,
            Icons.settings,
            size: 50.0,
          ),
          onPressed: () {},
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    final List<Widget> imageSliders = listGame
        .map(
          (item) => SafeArea(
            child: Card(
              color: Theme.of(context).cardColor,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 5.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                splashColor: Theme.of(context).splashColor,
                onTap: () => _selectGame(item),
                child: SizedBox(
                  width: 250.0,
                  height: 400.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                        child: item['image_path'] != null
                            ? Image.asset(
                                item['image_path'],
                                fit: BoxFit.contain,
                                width: 250.0,
                                height: 250.0,
                              )
                            : const SizedBox(
                                width: 250.0,
                                height: 400.0,
                                child: Center(
                                  child: Icon(Icons.games),
                                ),
                              ),
                      ),
                      Positioned(
                        height: 75.0,
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: ClipPath(
                          clipper: const ShapeBorderClipper(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25.0),
                                  topLeft: Radius.circular(25.0)),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              item['label'] ?? 'Game Title',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: 110.0,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                    textAlign: TextAlign.center,
                    'GAME\nCOLLECTION',
                    textStyle: kAppbarTextStyle,
                    speed: const Duration(milliseconds: 150),
                    cursor: ''),
              ],
              pause: const Duration(milliseconds: 500),
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 350.0,
            aspectRatio: 16 / 9,
            autoPlay: false,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            scrollDirection: Axis.horizontal,
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.8,
          ),
          items: imageSliders,
        ),
      ],
    );
  }

  void _selectGame(Map<String, dynamic> item) {
    print(item);
  }
}
