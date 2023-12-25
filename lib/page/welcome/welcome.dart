import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/main.dart';
import 'package:udemy/page/welcome/bloc/welcome_bloc.dart';
import 'package:udemy/page/welcome/bloc/welcome_events.dart';
import 'package:udemy/page/welcome/bloc/welcome_state.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(alignment: Alignment.topCenter, children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                },
                children: [
                  _page(
                      1,
                      context,
                      "NEXT",
                      'Nemayesh Mahsolat',
                      'Dar in Barname Mitavanid Kalaha va Joziat Manande : Gheymat , Tarikh,No e sakhtar An ra bbenid',
                      'assets/images/show.jpg'),
                  _page(
                      2,
                      context,
                      "NEXT",
                      'Ghabliat Chat',
                      'Dar in Barname Mitavanid Ba Dostan Va Hamkaran khod chat konid va Sefareshat khod ra anjam dahid',
                      'assets/images/chat.png'),
                  _page(
                      3,
                      context,
                      "START",
                      'Dar AYANde',
                      'Mitavanid dar Ayande B mahsolat khodetan dast yabi dashte va mizan forosh va mizan mahsolati k darid mosha hede konid',
                      'assets/images/man.png'),
                ],
              ),
              Positioned(
                  bottom: 40.h,
                  child: DotsIndicator(
                    position: state.page.toInt(),
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ))
            ]),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(imagePath),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          width: 375.w,
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            // ایندکس از 0 تا 2
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.linear);
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyHomePage()));
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 80.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(5, 5))
                ]),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            )),
          ),
        )
      ],
    );
  }
}
