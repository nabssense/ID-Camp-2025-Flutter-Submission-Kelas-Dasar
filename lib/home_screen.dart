import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/book_appointment_screen.dart';
import 'package:flutter_final_submission_dicoding/components/snackbar_custom.dart';
import 'package:flutter_final_submission_dicoding/models/health_tips.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 720) {
          return MobileScreen();
        } else {
          final crossAxisCount = constraints.maxWidth >= 1280 ? 3 : 2;
          return DesktopScreen(crossAxisCount: crossAxisCount);
        }
      },
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key, required this.crossAxisCount});
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 72,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(32.0),
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
                onTap: () {
                  showSnackBarCustom(
                    context,
                    title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                  );
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
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
                  hintText: 'Need Help?',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 0,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFC5E5FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 32,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your Appointment',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                      ),
                                      Text(
                                        'Dr. Haylie \nPhilips',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: -24,
                                  child: Image.asset(
                                    'assets/images/Dokter1.webp',
                                    width: 232,
                                    height: 232,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              showSnackBarCustom(
                                context,
                                title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.black12,
                                    Colors.white,
                                    Colors.green,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: IconTheme(
                                    data: IconThemeData(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimary,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              PhosphorIcon(
                                                PhosphorIconsRegular.calendar,
                                                size: 20,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                'Monday, 06 Oct 2025・07:45',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              PhosphorIcon(
                                                PhosphorIconsRegular.ticket,
                                                size: 20,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                'A-03・HP-0391239003',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 248,
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children: [
                          _ActionCard(
                            icon: PhosphorIconsBold.pill,
                            label: 'Pharmacy',
                            onTap: () {
                              showSnackBarCustom(
                                context,
                                title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                              );
                            },
                          ),
                          _ActionCard(
                            icon: PhosphorIconsBold.ticket,
                            label: 'My Queue',
                            onTap: () {
                              showSnackBarCustom(
                                context,
                                title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                              );
                            },
                          ),
                          _ActionCard(
                            icon: PhosphorIconsBold.calendarCheck,
                            label: 'Schedule',
                            destination: BookAppointmentScreen(),
                          ),
                          _ActionCard(
                            icon: PhosphorIconsBold.dotsThree,
                            label: 'More',
                            onTap: () {
                              showSnackBarCustom(
                                context,
                                title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 32,
                  right: 32,
                  bottom: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      'Health Tips',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: healthTipsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 144,
                      ),
                      itemBuilder: (context, index) {
                        final HealthTips healthTips = healthTipsList[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            showSnackBarCustom(
                              context,
                              title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 16,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  healthTips.imageAsset,
                                  scale: 1.0,
                                  width: 132,
                                  height: 132,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 8,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.secondary,
                                        borderRadius: BorderRadius.circular(
                                          999,
                                        ),
                                      ),
                                      child: Text(
                                        healthTips.tags.join(', '),
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          healthTips.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Text(healthTips.description),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 72,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
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
                onTap: () {
                  showSnackBarCustom(
                    context,
                    title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                  );
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
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
                  hintText: 'Need Help?',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 72),
                  padding: const EdgeInsets.only(top: 32, left: 16, bottom: 72),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFC5E5FF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),

                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 32,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your Appointment',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    Text(
                                      'Dr. Haylie \nPhilips',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineLarge,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: -24,
                                child: Image.asset(
                                  'assets/images/Dokter1.webp',
                                  width: 232,
                                  height: 232,
                                ),
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            showSnackBarCustom(
                              context,
                              title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.black12,
                                    Colors.white,
                                    Colors.green,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: IconTheme(
                                    data: IconThemeData(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimary,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              PhosphorIcon(
                                                PhosphorIconsRegular.calendar,
                                                size: 20,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                'Monday, 06 Oct 2025・07:45',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              PhosphorIcon(
                                                PhosphorIconsRegular.ticket,
                                                size: 20,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                'A-03・HP-0391239003',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0, 
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: _ActionCard(
                            icon: PhosphorIconsBold.pill,
                            label: 'Pharmacy',
                            onTap: () {
                              showSnackBarCustom(
                                context,
                                title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: _ActionCard(
                            icon: PhosphorIconsBold.ticket,
                            label: 'My Queue',
                            onTap: () {
                              showSnackBarCustom(
                                context,
                                title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: _ActionCard(
                            icon: PhosphorIconsBold.calendarCheck,
                            label: 'Schedule',
                            destination: BookAppointmentScreen(),
                          ),
                        ),
                        Expanded(
                          child: _ActionCard(
                            icon: PhosphorIconsBold.dotsThree,
                            label: 'More',
                            onTap: () {
                              showSnackBarCustom(
                                context,
                                title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(
                    'Health Tips',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: healthTipsList.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final HealthTips healthTips = healthTipsList[index];
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          showSnackBarCustom(
                            context,
                            title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset(
                                healthTips.imageAsset,
                                scale: 1.0,
                                width: 132,
                                height: 132,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: Text(
                                      healthTips.tags.join(', '),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        healthTips.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Text(healthTips.description),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.label,
    this.destination,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Widget? destination;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onTap != null) {
          onTap!();
          return;
        }
        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination!),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 32),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white10, Colors.white],
            center: Alignment(-0.8, -1),
            radius: 1.0,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2, color: Colors.white),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            PhosphorIcon(icon),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
