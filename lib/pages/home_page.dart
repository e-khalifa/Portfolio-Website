import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/color_utility.dart';
import 'package:portfolio/utils/image_utility.dart';
import 'package:portfolio/widgets/about_me_info.dart';
import '../widgets/buttons/contact_me_button.dart';
import '../widgets/items/project_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Esraa Khalifa - Flutter Developer',
              style: TextStyle(fontSize: 18.sp)),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: ColorUtility.lightGrey,
            dividerColor: ColorUtility.lightGrey,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'Projects'),
              Tab(text: 'About Me'),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: TabBarView(
            children: [buildProjectsTab(), buildAboutMeTab()],
          ),
        ),
      ),
    );
  }

  Widget buildProjectsTab() {
    return ListView(
      children: const [
        ProjectItem(
          gifPath: ImageUtility.easyPos,
          projectName: 'Easy Pos',
          description:
              'A user-friendly point-of-sale solution designed to streamline transactions and manage sales efficiently. With an intuitive interface, it allows businesses to handle sales operations seamlessly and keep track of their inventory in real-time.',
          skills:
              'Developed using SQL for robust database management and storage',
          githubLink: 'https://github.com/e-khalifa/EasyPOS',
        ),
        ProjectItem(
          gifPath: ImageUtility.eduVista,
          projectName: 'Edu-Vista',
          description:
              'An educational app designed to enhance learning through interactive courses and resources. It offers a dynamic platform for users to access educational content and track their progress.',
          skills:
              'Utilizes APIs for content integration, BLoC for state management, and Firebase for real-time database services and user authentication.',
          githubLink: 'https://github.com/e-khalifa/Edu-Vista',
        ),
        ProjectItem(
          gifPath: ImageUtility.em,
          projectName: 'E-M',
          description:
              'The Employee Manager App provides a comprehensive solution for managing employee records and streamlining HR processes. It includes features for tracking employee information, managing schedules, and handling performance evaluations.',
          skills:
              'Employs advanced database management techniques and user-friendly interfaces to ensure efficient HR operations.',
          githubLink: 'https://github.com/e-khalifa/employee_manager_app',
        ),
        ProjectItem(
          gifPath: ImageUtility.apeironHotel,
          projectName: 'Apeiron Hotel Booking App',
          description:
              'The Hotel Booking App simplifies the process of finding and reserving accommodations. With a sleek interface and powerful search features, users can effortlessly book their stay and manage reservations.',
          skills: 'Implemented with a focus on user experience.',
          githubLink: 'https://github.com/e-khalifa/Apeiron-HotelBookingApp',
        ),
      ],
    );
  }

  Widget buildAboutMeTab() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 60.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: ColorUtility.darkGrey,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: AboutMeInfo(),
        ),
        Positioned(
          top: 0,
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorUtility.main,
            ),
            child: CircleAvatar(
              radius: 60.r,
              backgroundImage: const AssetImage(ImageUtility.esraa),
            ),
          ),
        ),
        Positioned(
          bottom: 20.h,
          right: 20.w,
          child: const ContactMeButton(),
        ),
      ],
    );
  }
}
