import 'package:check_dc_assesment/assets/colors.dart';
import 'package:check_dc_assesment/onboarding/models/page_model.dart';
import 'package:check_dc_assesment/onboarding/screens/signup_page.dart';
import 'package:check_dc_assesment/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  final PageController _controller = PageController();
  final List<PageModel> _pages = [
    PageModel(
      lottie: "assets/lottie/1.json",
      title: "Fund",
      subtitle: "Account",
      description: description,
      pageSwiped: true,
      previousPageSwiped: false,
    ),
    PageModel(
      lottie: "assets/lottie/2.json",
      title: "Save",
      subtitle: "Money",
      description: description,
      pageSwiped: false,
      previousPageSwiped: false,
    ),
    PageModel(
      lottie: "assets/lottie/3.json",
      title: "Send",
      subtitle: "Money",
      description: description,
      pageSwiped: false,
      previousPageSwiped: false,
    ),
    PageModel(
      lottie: "assets/lottie/4.json",
      title: "Buy",
      subtitle: "Airtime",
      description: description,
      pageSwiped: false,
      previousPageSwiped: false,
    ),
    PageModel(
      lottie: "assets/lottie/5.json",
      title: "Pay",
      subtitle: "Bills",
      description: description,
      pageSwiped: false,
      previousPageSwiped: false,
    ),
  ];

  void _onChanged(int index) {
    if (_currentPage < index) {
      _pages[_currentPage].previousPageSwiped = true;
    }

    _currentPage = index;
    _pages[_currentPage].pageSwiped = true;
    _pages[_currentPage].previousPageSwiped = false;

    setState(() {});
  }

  void _changePage() {
    _controller.animateToPage(
      _currentPage + 1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutQuart,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, int index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              RenderLottie(
                lottiePath: _pages[index].lottie,
                isContinous: true,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 61,
                  left: 30,
                  right: 30,
                ),
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    5,
                    (int index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 7.h,
                        width: 61.w,
                        margin: EdgeInsets.symmetric(
                            horizontal: 1.w, vertical: 20.h),
                        decoration: BoxDecoration(
                            color: (_pages[index].pageSwiped ||
                                    _pages[index].previousPageSwiped)
                                ? primaryColor
                                : secondaryColor),
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 150.h, left: 50.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${_pages[index].title}\n',
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 45,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: _pages[index].subtitle,
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 45,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      _pages[index].description,
                      style: const TextStyle(
                        color: black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              Positioned(
                bottom: 33,
                right: 30,
                left: 29,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Skip',
                          style: TextStyle(
                            color: altColor2,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 41,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: altColor2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    if (index == 4) ...[
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 1500),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const SignUpPage(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(0.0, 1.0),
                                        end: Offset.zero,
                                      ).animate(CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeOutQuart,
                                      )),
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          splashFactory: InkRipple.splashFactory,
                          child: Container(
                            width: 169.w,
                            alignment: Alignment.center,
                            height: 50.h,
                            decoration: ShapeDecoration(
                              color: white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                  width: 0.5,
                                  color: altColor2,
                                ),
                              ),
                            ),
                            child: const Text(
                              'GET STARTED',
                              style: TextStyle(
                                color: altColor2,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ))
                    ] else ...[
                      InkWell(
                        onTap: _changePage,
                        borderRadius: BorderRadius.circular(10),
                        splashColor: primaryColor,
                        splashFactory: InkRipple.splashFactory,
                        child: Container(
                            decoration: const ShapeDecoration(
                              color: white,
                              shape: OvalBorder(),
                            ),
                            child: SvgPicture.asset(
                              "assets/svgs/chevron_right_grouped.svg",
                            )),
                      )
                    ],
                  ],
                ),
              )
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: _pages.length,
        onPageChanged: _onChanged,
      ),
    );
  }
}
