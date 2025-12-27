import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/book_appointment_screen.dart';
import 'package:flutter_final_submission_dicoding/history_screen.dart';
import 'package:flutter_final_submission_dicoding/home_screen.dart';
import 'package:flutter_final_submission_dicoding/inbox_screen.dart';
import 'package:flutter_final_submission_dicoding/profile_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Color(0xFFC5E5FF),
          primary: Color(0xFF2A7879),
          secondary: Color(0xFFC7F1E3),
          onPrimary: Color(0xFFF5f5f5),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 48,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 16,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 14,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  void _goToIndex(int idx) => setState(() => _selectedIndex = idx);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(),
      const BookAppointmentScreen(),
      const InboxScreen(),
      const HistoryScreen(),
      const ProfileScreen(),
    ];
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: pages),
      appBar: isMobile
          ? null
          : AppBar(
              titleSpacing: 0,
              title: TopAppBar(
                selectedIndex: _selectedIndex,
                goToIndex: _goToIndex,
              ),
            ),
      bottomNavigationBar: isMobile
          ? BottomAppBarMobile(
              selectedIndex: _selectedIndex,
              goToIndex: _goToIndex,
            )
          : null,
    );
  }
}

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
    required this.selectedIndex,
    required this.goToIndex,
  });
  final int selectedIndex;
  
  final dynamic goToIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => goToIndex(0),
            child: SizedBox(
              child: Image.asset(
                'assets/images/Logo-Primaya-Hospital.png',
                width: 128,
                height: double.infinity,
                scale: 1.0,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _NavBtnTop(
                icon: PhosphorIcon(
                  PhosphorIconsRegular.house,
                  color: selectedIndex == 0 ? Colors.black : Colors.grey[600],
                  size: 20,
                ),
                label: 'Home',
                isActive: selectedIndex == 0,
                onTap: () => goToIndex(0),
              ),
              _NavBtnTop(
                icon: PhosphorIcon(
                  PhosphorIconsRegular.calendarCheck,
                  color: selectedIndex == 1 ? Colors.black : Colors.grey[600],
                  size: 20,
                ),
                label: 'Schedule',
                isActive: selectedIndex == 1,
                onTap: () => goToIndex(1),
              ),
              _NavBtnTop(
                icon: PhosphorIcon(
                  PhosphorIconsRegular.envelope,
                  color: selectedIndex == 2 ? Colors.black : Colors.grey[600],
                  size: 20,
                ),
                label: 'Inbox',
                isActive: selectedIndex == 2,

                onTap: () => goToIndex(2),
              ),
              _NavBtnTop(
                icon: PhosphorIcon(
                  PhosphorIconsRegular.clockCounterClockwise,
                  color: selectedIndex == 3 ? Colors.black : Colors.grey[600],
                  size: 20,
                ),
                label: 'History',
                isActive: selectedIndex == 3,
                onTap: () => goToIndex(3),
              ),
              _NavBtnTop(
                icon: PhosphorIcon(
                  PhosphorIconsRegular.user,
                  color: selectedIndex == 4 ? Colors.black : Colors.grey[600],
                  size: 20,
                ),
                label: 'Profile',
                isActive: selectedIndex == 4,
                onTap: () => goToIndex(4),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomAppBarMobile extends StatelessWidget {
  const BottomAppBarMobile({
    super.key,
    required this.selectedIndex,
    required this.goToIndex,
  });
  final int selectedIndex;
  final dynamic goToIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _NavBtn(
            icon: PhosphorIcon(
              PhosphorIconsRegular.house,
              color: selectedIndex == 0 ? Colors.black : Colors.grey[600],
            ),
            label: 'Home',
            isActive: selectedIndex == 0,
            onTap: () => goToIndex(0),
          ),
          _NavBtn(
            icon: PhosphorIcon(
              PhosphorIconsRegular.calendarCheck,
              color: selectedIndex == 1 ? Colors.black : Colors.grey[600],
            ),
            label: 'Schedule',
            isActive: selectedIndex == 1,
            onTap: () => goToIndex(1),
          ),
          _NavBtn(
            icon: PhosphorIcon(
              PhosphorIconsRegular.envelope,
              color: selectedIndex == 2 ? Colors.black : Colors.grey[600],
            ),
            label: 'Inbox',
            isActive: selectedIndex == 2,

            onTap: () => goToIndex(2),
          ),
          _NavBtn(
            icon: PhosphorIcon(
              PhosphorIconsRegular.clockCounterClockwise,
              color: selectedIndex == 3 ? Colors.black : Colors.grey[600],
            ),
            label: 'History',
            isActive: selectedIndex == 3,
            onTap: () => goToIndex(3),
          ),
          _NavBtn(
            icon: PhosphorIcon(
              PhosphorIconsRegular.user,
              color: selectedIndex == 4 ? Colors.black : Colors.grey[600],
            ),
            label: 'Profile',
            isActive: selectedIndex == 4,
            onTap: () => goToIndex(4),
          ),
        ],
      ),
    );
  }
}

class _NavBtn extends StatelessWidget {
  const _NavBtn({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isActive,
  });
  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          child: Column(
            spacing: 8,
            children: [
              icon,
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isActive ? Colors.black : Colors.grey[600],
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBtnTop extends StatelessWidget {
  const _NavBtnTop({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isActive,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isActive ? Colors.black : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
