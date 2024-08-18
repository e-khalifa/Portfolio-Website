import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/color_utility.dart';
import 'package:portfolio/utils/text_style_utility.dart';
import 'package:portfolio/widgets/items/project_demo_item.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatelessWidget {
  final String gifPath;
  final String projectName;
  final String description;
  final String skills;
  final String githubLink;

  const ProjectItem({
    required this.gifPath,
    required this.projectName,
    required this.description,
    required this.skills,
    required this.githubLink,
    super.key,
  });

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorUtility.darkGrey,
      surfaceTintColor: ColorUtility.darkGrey,
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Row(
            children: [
              SizedBox(
                width: 200.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0.r),
                  child: ProjectDemoItem(
                    gifPath: gifPath,
                    projectName: projectName,
                    projectBrief: '',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projectName,
                        style: TextStyleUtility.heading1,
                      ),
                      SizedBox(height: 8.0.h),
                      Text(
                        description,
                        style: TextStyleUtility.body,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Skills/Tools Used:',
                        style: TextStyleUtility.heading2,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        skills,
                        style: TextStyleUtility.body,
                      ),
                      SizedBox(height: 10.h),
                      InkWell(
                        onTap: () {
                          launchURL(githubLink);
                        },
                        child: const Text(
                          'View on GitHub',
                          style: TextStyle(
                              color: ColorUtility.main,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0.w,
          top: 0.w,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.red,
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: Text('In Progress', style: TextStyleUtility.heading2),
          ),
        ),
      ]),
    );
  }
}
