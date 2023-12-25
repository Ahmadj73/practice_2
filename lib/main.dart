import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy/page/welcome/bloc/welcome_bloc.dart';
import 'package:udemy/page/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: ScreenUtilInit(
        builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: welcome(),
        ),
      ),
    );
  }
}

enum _SkillType { photo, xd, ill, after, light }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType? _skill;
  void updateSelectedSkill(_SkillType skillType) {
    setState(() {
      _skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 8,
            children: [
              Skill(
                shadowColor: Colors.blue,
                type: _SkillType.photo,
                isActive: _skill == _SkillType.photo,
                title: 'PhotoShop',
                imagePath: 'image/app_icon_01.png',
                onTab: () {
                  updateSelectedSkill(_SkillType.photo);
                },
              ),
              Skill(
                type: _SkillType.xd,
                isActive: _skill == _SkillType.xd,
                title: 'xd',
                imagePath: 'image/app_icon_05.png',
                onTab: () {
                  updateSelectedSkill(_SkillType.xd);
                },
                shadowColor: Colors.pink,
              ),
              Skill(
                shadowColor: Colors.orange.shade400,
                type: _SkillType.ill,
                isActive: _skill == _SkillType.ill,
                title: 'illustrator',
                imagePath: 'image/app_icon_04.png',
                onTab: () {
                  updateSelectedSkill(_SkillType.ill);
                },
              ),
              Skill(
                shadowColor: Colors.blue.shade800,
                type: _SkillType.after,
                isActive: _skill == _SkillType.after,
                title: 'AfterEffect',
                imagePath: 'image/app_icon_03.png',
                onTab: () {
                  updateSelectedSkill(_SkillType.after);
                },
              ),
              Skill(
                shadowColor: Colors.blue,
                type: _SkillType.light,
                isActive: _skill == _SkillType.light,
                title: 'Light Room',
                imagePath: 'image/app_icon_02.png',
                onTab: () {
                  updateSelectedSkill(_SkillType.light);
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 10, 14, 4),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'aaaa',
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'chorkhar'),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(onPressed: () {}, child: Text('Save'))),
            ],
          ),
        ),
      ]),
    );
  }
}

class Skill extends StatelessWidget {
  final Color shadowColor;
  final _SkillType type;
  final String title;
  final String imagePath;
  final bool isActive;
  final Function() onTab;
  const Skill({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isActive,
    required this.onTab,
    required this.type,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Color(0xdffffff),
                borderRadius: BorderRadius.circular(12))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 20)
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(height: 4),
            Text(title),
          ],
        ),
      ),
    );
  }
}
