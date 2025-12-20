import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_final_submission_dicoding/components/list_doctor_history.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 768) {
              return MobileScreen();
            } else {
              return DesktopScreen();
            }
          },
        ),
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          spacing: 32,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 32,
              children: [
                Text(
                  'History appointment',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white10],
                          stops: [0.24, 1.0],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          transform: GradientRotation(-1.0472),
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: PhosphorIcon(
                              PhosphorIconsRegular.magnifyingGlass,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: 24,
                              semanticLabel: 'New Note',
                            ),
                          ),
                          suffixIconConstraints: BoxConstraints(
                            minWidth: 24,
                            minHeight: 24,
                          ),
                          hintText: 'Medical Check',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                spacing: 16,
                children: [
                  _CustomTabBar(title: 'General', index: 0),
                  _CustomTabBar(title: 'Dentist', index: 1),
                  _CustomTabBar(title: 'Eye', index: 2),
                  _CustomTabBar(title: 'Skin', index: 3),
                  _CustomTabBar(title: 'Other', index: 4),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  ListDoctorHistory(),
                  Center(child: Text('History Empty')),
                  Center(child: Text('History Empty')),
                  Center(child: Text('History Empty')),
                  Center(child: Text('History Empty')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 32,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'History \nappointment',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white10],
                    stops: [0.24, 1.0],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    transform: GradientRotation(-1.0472),
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: PhosphorIcon(
                        PhosphorIconsRegular.magnifyingGlass,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 24,
                        semanticLabel: 'New Note',
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    hintText: 'Medical Check',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                spacing: 16,
                children: [
                  _CustomTabBar(title: 'General', index: 0),
                  _CustomTabBar(title: 'Dentist', index: 1),
                  _CustomTabBar(title: 'Eye', index: 2),
                  _CustomTabBar(title: 'Skin', index: 3),
                  _CustomTabBar(title: 'Other', index: 4),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  ListDoctorHistory(),
                  Center(child: Text('History Empty')),
                  Center(child: Text('History Empty')),
                  Center(child: Text('History Empty')),
                  Center(child: Text('History Empty')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTabBar extends StatelessWidget {
  const _CustomTabBar({required this.title, required this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final bool isActive = controller.index == index;

        return InkWell(
          onTap: () {
            controller.animateTo(index);
          },
          borderRadius: BorderRadius.circular(999),
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: isActive
                  ? const RadialGradient(
                      colors: [Color(0xFFC5E5FF), Colors.white],
                      stops: [0.24, 0.80],
                      center: Alignment(-1, -1.8),
                      radius: 2,
                    )
                  : null,

              color: isActive ? null : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(999),
              border: BoxBorder.all(
                color: isActive
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
                width: 1,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }
}
