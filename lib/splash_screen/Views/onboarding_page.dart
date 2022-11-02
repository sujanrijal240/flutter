// import 'package:flutter/src/foundation/key.dart';
import 'package:bpls/main.dart';
import 'package:bpls/login_screen/screen/signin_page.dart';
import 'package:bpls/splash_screen/app_styles.dart';
import 'package:bpls/splash_screen/model/onboarding_data.dart';
import 'package:bpls/splash_screen/size_configs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages.dart';
import '../Widgets/widget.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class OnbordingPage extends StatefulWidget {
  OnbordingPage({Key? key}) : super(key: key);

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  int currentPage = 0;

  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    //initialize size config
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    Text(
                      onboardingContents[index].title,
                      style: kTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    Container(
                      height: sizeV * 60,
                      child: Image.asset(
                        onboardingContents[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: kBodyText1,
                        children: [
                          TextSpan(text: 'We Can'),
                          TextSpan(
                            text: 'Help You',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                          TextSpan(text: 'To Be A Better'),
                          TextSpan(text: 'Version Of'),
                          TextSpan(
                            text: 'Yourself',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeV * 6,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentPage == onboardingContents.length - 1
                      ? MyTextButton(
                          buttonName: 'Get Started',
                          bgColor: kPrimaryColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                           
                          children: [
                            OnBoardNavBtn(
                              name: 'Skip',
                              onPressed: (() {
                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                              }),
                            ),
                            Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => dotIndicator(index),
                              ),
                            ),
                            OnBoardNavBtn(
                              name: 'Next',
                              onPressed: (() {
                                _pageController.nextPage(
                                  duration: Duration(
                                    milliseconds: 400,
                                  ),
                                  curve: Curves.easeInOut,
                                );
                              }),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(
        right: 7,
      ),
      duration: Duration(
        milliseconds: 400,
      ),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
  Future setSeenonboard() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard =  await prefs.setBool('seenOnboard', true);
    //this will  set seenOnboard to true when running onboard page for the first time.
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSeenonboard();
  }
}

