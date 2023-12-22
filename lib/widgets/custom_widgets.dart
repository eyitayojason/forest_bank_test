import 'package:check_dc_assesment/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class RenderLottie extends StatefulWidget {
  final String lottiePath;
  final bool isContinous;
  final double? width;
  final double? height;
  const RenderLottie(
      {super.key,
      required this.lottiePath,
      this.isContinous = false,
      this.width,
      this.height});

  @override
  State<RenderLottie> createState() => _RenderLottieState();
}

class _RenderLottieState extends State<RenderLottie>
    with TickerProviderStateMixin {
  late AnimationController _lottieController;

  @override
  void initState() {
    super.initState();

    _lottieController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(widget.lottiePath,
        fit: BoxFit.cover,
        controller: _lottieController,
        repeat: widget.isContinous,
        reverse: widget.isContinous,
        width: widget.width,
        height: widget.height,
        animate: widget.isContinous, onLoaded: (composition) {
      _lottieController.duration = composition.duration;
      _lottieController.forward();
      _lottieController.addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          if (widget.isContinous == true) {
            _lottieController.repeat();
          }
        }
      });
    });
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
  });

  final String hintText;
  final String? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          enabled: false,
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          fillColor: white,
          filled: true,
          suffixIcon: suffixIcon != null
              ? SvgPicture.asset(suffixIcon!,
                  height: 14, width: 12, fit: BoxFit.scaleDown)
              : null,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}

Text textFieldHeader(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: altColor2,
      fontSize: 10,
      fontWeight: FontWeight.w700,
    ),
  );
}

Container customButton() {
  return Container(
    width: 315,
    height: 50,
    alignment: Alignment.center,
    decoration: ShapeDecoration(
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    child: const Text(
      'NEXT',
      style: TextStyle(
        color: white,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
