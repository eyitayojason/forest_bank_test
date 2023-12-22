import 'package:check_dc_assesment/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: const BackButton(
            color: black,
          ),
          backgroundColor: transparent),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 300.h),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/grouped.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Center(
                      child: Text(
                        'LET’S GET YOU STARTED',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: altColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Personal Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        3,
                        (int index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 3.h,
                            width: 29.w,
                            margin: EdgeInsets.symmetric(
                                horizontal: 1.w, vertical: 20.h),
                            decoration: BoxDecoration(
                                color: (index == 0)
                                    ? altColor2
                                    : altColor2.withOpacity(.10)),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    formSection(),
                    const SizedBox(
                      height: 11,
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Have an account? ',
                            style: TextStyle(
                              color: altColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: altColor2,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column formSection() {
    const sizedBox10 = SizedBox(
      height: 10,
    );
    const sizedBox15 = SizedBox(
      height: 15,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textFieldHeader('FIRST NAME'),
        sizedBox10,
        const CustomTextField(
          hintText: 'Ciroma',
        ),
        sizedBox15,
        textFieldHeader('LAST NAME'),
        sizedBox10,
        const CustomTextField(
          hintText: 'Adekunle',
        ),
        sizedBox15,
        textFieldHeader('GENDER'),
        sizedBox10,
        const CustomTextField(
          hintText: 'Select Gender',
          suffixIcon: 'assets/svgs/icon.svg',
        ),
        sizedBox15,
        textFieldHeader('DATE OF BIRTH'),
        sizedBox10,
        const CustomTextField(
          hintText: 'Select Date',
          suffixIcon: 'assets/svgs/calendar.svg',
        ),
        const SizedBox(
          height: 25,
        ),
        customButton(),
      ],
    );
  }
}
