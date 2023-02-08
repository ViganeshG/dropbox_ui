import 'package:dropbox_ui/app_style.dart';
import 'package:dropbox_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DropBox UI',
      theme: ThemeData(),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Color> folderColors = [
    kLightBlueColor,
    kLightYellowColor,
    kLightRedColor,
    kLightCyanColor,
    kLightBlueColor,
    kLightYellowColor,
    kLightRedColor,
    kLightCyanColor
  ];

  List<Color> textColors = [
    kBlueColor,
    kYellowColor,
    kRedColor,
    kCyanColor,
    kBlueColor,
    kYellowColor,
    kRedColor,
    kCyanColor
  ];

  List<String> foldericonColors = [
    'folder_icon_blue.svg',
    'folder_icon_yellow.svg',
    'folder_icon_red.svg',
    'folder_icon_green.svg',
    'folder_icon_blue.svg',
    'folder_icon_yellow.svg',
    'folder_icon_red.svg',
    'folder_icon_green.svg'
  ];

  List<String> moreiconColors = [
    'more_vertical_icon_blue.svg',
    'more_vertical_icon_yellow.svg',
    'more_vertical_icon_red.svg',
    'more_vertical_icon_green.svg',
    'more_vertical_icon_blue.svg',
    'more_vertical_icon_yellow.svg',
    'more_vertical_icon_red.svg',
    'more_vertical_icon_green.svg'
  ];

  List<String> folderNames = [
    'Mobile apps',
    'SVG icons',
    'Prototypes',
    'avatars',
    'Mobile apps',
    'SVG icons',
    'Prototypes',
    'avatars'
  ];
  List<String> folderDates = [
    'December 20.2020',
    'December 14.2020',
    'December 20.2020',
    'December 14.2020',
    'December 20.2020',
    'December 14.2020',
    'December 20.2020',
    'December 14.2020'
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: kPaddingHor,
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Your dribbox",
                style: kQuestrailSemiBold.copyWith(
                  color: kBlackColor,
                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                ),
              ),
              SvgPicture.asset(
                'assets/menu_icon.svg',
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 4,
          ),
          TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  borderSide: const BorderSide(
                    width: 1,
                    color: kGreyColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  borderSide: const BorderSide(
                    width: 1,
                    color: kGreyColor,
                  ),
                ),
                prefixIcon: Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/search_icon.svg')),
                hintText: 'Search folder',
              ),
              style: kQuestrailMedium.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkGreyColor)),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Recent',
                    style: kQuestrailSemiBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        color: kLightBlackColor),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 2.5,
                  ),
                  SvgPicture.asset('assets/arrow_down_icon.svg'),
                ],
              ),
              SvgPicture.asset('assets/sort_icon.svg'),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 3,
          ),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: SizeConfig.blockSizeHorizontal! * 2,
                  mainAxisSpacing: SizeConfig.blockSizeHorizontal! * 2,
                  mainAxisExtent: 107),
              itemCount: folderColors.length,
              itemBuilder: ((context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.5 * kPaddingHor),
                  decoration: BoxDecoration(
                    color: folderColors[index],
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                                'assets/${foldericonColors[index]}'),
                            SvgPicture.asset('assets/${moreiconColors[index]}'),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 1,
                        ),
                        Text(
                          folderNames[index],
                          style: kQuestrailSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: textColors[index]),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 0.3,
                        ),
                        Text(folderDates[index],
                            style: kQuestrailRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                              color: textColors[index],
                            )),
                      ]),
                );
              }))
        ]),
      ),
    );
  }
}
