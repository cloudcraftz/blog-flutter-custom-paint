import 'package:drawing_path_using_custompaint/widgets/dash_line_painter.dart';
import 'package:flutter/material.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  List<String> levels = [
    'Start',
    'Level-1',
    'Level-2',
    'Level-3',
    'Level-4',
    'Level-5'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFEFBE7),
        appBar: AppBar(
          title: const Text(
            'Levels Path',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 2,
          backgroundColor: const Color(0xffF9EBC8),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: CustomPaint(
            painter: DashLinePainter(),
            child: GridView.builder(
              itemCount: levels.length,
              reverse: true,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: (index % 2 == 0)
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                          color: const Color(0xff525E75),
                          borderRadius: BorderRadius.circular(62.5),
                        ),
                        child: Center(
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              color: (index == 0)
                                  ? const Color(0xff112B3C)
                                  : const Color(0xffFEB139),
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: Center(
                              child: Text(
                                levels[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
