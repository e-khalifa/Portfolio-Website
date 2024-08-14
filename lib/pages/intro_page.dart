import 'package:flutter/material.dart';
import 'package:portfolio/widgets/animated_text.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<IntroPage> {
  final PageController pageController = PageController();
  bool isVertical = true;
  int currentPage = 0;
  Map<String, bool> delayedTextVisibility = {
    'page0_text': false,
    'page1_text1': false,
    'page1_text2': false,
  };

  @override
  void initState() {
    super.initState();
    startAutoSliding();
  }

  void startAutoSliding() {
    Future.microtask(() async {
      while (mounted) {
        switch (currentPage) {
          case 0:
            delayedText('page0_text', 300);
            await Future.delayed(const Duration(milliseconds: 2000));
            pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            );
            break;
          case 1:
            delayedText('page1_text1', 5);
            delayedText('page1_text2', 3050);
            setState(() {
              isVertical = !isVertical;
            });
            await Future.delayed(const Duration(
                milliseconds: 9000)); // Adjust this delay as needed
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
            );
            break;
          default:
            // Handle any other cases if needed
            break;
        }
      }
    });
  }

  void delayedText(String textId, int delayMs) {
    Future.delayed(Duration(milliseconds: delayMs), () {
      if (mounted) {
        setState(() {
          delayedTextVisibility[textId] = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: PageView(
        controller: pageController,
        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: [
          buildPage0(),
          buildPage1(),
        ],
      ),
    );
  }

  Widget buildPage0() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedText(
          text: 'Hello..',
          style: TextStyle(
            fontSize: 40,
            color: Colors.grey.shade300,
            decoration: TextDecoration.none,
          ),
          letterSpeed: const Duration(milliseconds: 100),
        ),
        delayedTextVisibility['page0_text'] == true
            ? AnimatedText(
                text: '             World?',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey.shade300,
                  decoration: TextDecoration.none,
                ),
                letterSpeed: const Duration(milliseconds: 60),
              )
            : const SizedBox(
                height: 47,
              )
      ],
    );
  }

  Widget buildPage1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedText(
          text: "I'm Esraa!",
          style: TextStyle(
            fontSize: 25,
            color: Colors.grey.shade300,
            decoration: TextDecoration.none,
          ),
          letterSpeed: const Duration(milliseconds: 80),
        ),
        delayedTextVisibility['page1_text1'] == true
            ? AnimatedText(
                text:
                    "I Like to create things with\nWords,\nNumbers,\nSymbols,\nand sometimes..",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey.shade300,
                  decoration: TextDecoration.none,
                ),
                letterSpeed: const Duration(milliseconds: 35),
              )
            : const SizedBox(),
        delayedTextVisibility['page1_text2'] == true
            ? AnimatedText(
                text: "Spells!",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey.shade300,
                  decoration: TextDecoration.none,
                ),
                letterSpeed: const Duration(milliseconds: 90),
              )
            : const SizedBox(),
      ],
    );
  }
}
