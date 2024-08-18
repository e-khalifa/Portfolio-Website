import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/color_utility.dart';

class ContactMeButton extends StatefulWidget {
  const ContactMeButton({Key? key}) : super(key: key);

  @override
  _ContactMeButtonState createState() => _ContactMeButtonState();
}

class _ContactMeButtonState extends State<ContactMeButton>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController controller;
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: SizedBox(
        width: isExpanded ? 180.w : 100.w,
        height: 60.h,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
              if (isExpanded) {
                controller.forward();
              } else {
                controller.reverse();
              }
            });
          },
          backgroundColor: ColorUtility.main,
          child: isExpanded
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Contact Me:'),
                    IconButton(
                        onPressed: () async {
                          final Uri params = Uri(
                              scheme: 'mailto',
                              path: 'esraakhalifa122@gmail.com',
                              queryParameters: {
                                'subject': 'Default Subject',
                                'body': 'Default body'
                              });
                          await launchURL(params.toString());
                        }, //Not Working
                        icon: const Icon(
                          Icons.email,
                        )),
                    IconButton(
                        onPressed: () async {
                          await launchURL('https://t.me/Israa_K');
                        },
                        icon: const Icon(
                          Icons.telegram,
                        )),
                  ],
                )
              : const Text('Contact Me'),
        ),
      ),
    );
  }
}
