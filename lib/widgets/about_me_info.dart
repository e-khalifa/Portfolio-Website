import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/text_style_utility.dart';
import 'package:portfolio/widgets/items/about_me_item.dart';

class AboutMeInfo extends StatelessWidget {
  AboutMeInfo({super.key});

  final String summary =
      "Hi, I'm Esraa!\nSome say coding is like a puzzle, or a game, or a mystery waiting to be solved, but to me, it's a story. As someone who kept writing her whole life with a lifelong fascination with the language of humans, I’ve found myself equally captivated by computer languages.\nI don't care what Noam Chomsky might say—computer languages are a complete language! They have structure, usable units, complexity, artistry, and they develop! Each project to me is a new story that I get to build and unravel at the same time, where every line of code, every symbol, and every space plays a crucial role in the bigger picture. It can be challenging and sometimes frustrating, but the joy of seeing a complete and functional outcome makes it all worthwhile.";
  final List<String> skills = [
    'Skilled in using the Flutter framework.',
    'Experienced with Firebase for real-time database and authentication.',
    'Knowledgeable in state management solutions such as BLoC and Provider.',
    'Competent in integrating APIs.',
    'Familiar with SQLite for local data storage.',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: TextStyleUtility.title,
          ),
          SizedBox(height: 16.h),
          AboutMeItem(
            child: Text(
              summary,
              style: TextStyleUtility.body,
            ),
          ),

          Text(
            'Skills',
            style: TextStyleUtility.subtitle,
          ),
          AboutMeItem(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Framework',
                  style: TextStyleUtility.heading1,
                ),
                Text('• Flutter', style: TextStyleUtility.body),
                SizedBox(height: 10.h),
                Text('Languages', style: TextStyleUtility.heading1),
                Text('• Dart', style: TextStyleUtility.body),
                Text('• Java', style: TextStyleUtility.body),
                SizedBox(height: 10.h),
                Text(
                  'Other Skills',
                  style: TextStyleUtility.heading1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: skills
                      .map((skill) => Text(
                            '• $skill',
                            style: TextStyleUtility.body,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),

          Text('Education', style: TextStyleUtility.subtitle),
          AboutMeItem(
            child: Column(
              children: [
                Text(
                  'Bachelor of media studies:Radio and Television Broadcasting',
                  style: TextStyleUtility.heading2,
                ),
                Text(
                  'Faculty of Mass Communication, cairo University',
                  style: TextStyleUtility.body,
                )
              ],
            ),
          ),
          //Add Cv
          //Add Courses and Certifications
        ],
      ),
    );
  }
}
