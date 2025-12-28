import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/components/snackbar_custom.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 768) {
            return MobileScreen();
          } else {
            return DesktopScreen();
          }
        },
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Text(
                'Profile patient',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  GestureDetector(
                    onTap: () {
                      showSnackBarCustom(
                        context,
                        title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                      );
                    },
                    child: IntrinsicHeight(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 460,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          spacing: 16,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                'assets/images/raditya-dika.jpg',
                                width: 128,
                                height: 128,
                                scale: 1,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('John Doe'),
                                Text('johndoe@gmail.com'),
                                Text('+123-456-789'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 16,
                      children: [
                        ButtonProfile(
                          iconLeft: PhosphorIconsFill.hospital,
                          title: 'Medical Record',
                          onTap: () {
                            showSnackBarCustom(
                              context,
                              title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                            );
                          },
                        ),
                        ButtonProfile(
                          iconLeft: PhosphorIconsFill.shield,
                          title: 'Privacy & Security',
                          onTap: () {
                            showSnackBarCustom(
                              context,
                              title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                            );
                          },
                        ),
                        ButtonProfile(
                          iconLeft: PhosphorIconsFill.gear,
                          title: 'Setting',
                          onTap: () {
                            showSnackBarCustom(
                              context,
                              title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                            );
                          },
                        ),
                        ButtonProfile(
                          iconLeft: PhosphorIconsFill.appWindow,
                          title: 'App Version',
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
            ],
          ),
        ),
      ),
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                'Profile \npatient',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              GestureDetector(
                onTap: () {
                  showSnackBarCustom(
                    context,
                    title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    spacing: 16,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          'assets/images/raditya-dika.jpg',
                          width: 72,
                          height: 72,
                          scale: 1,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('John Doe'),
                            Text('johndoe@gmail.com'),
                            Text('+123-456-789'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonProfile(
                iconLeft: PhosphorIconsFill.hospital,
                title: 'Medical Record',
                onTap: () {
                  showSnackBarCustom(
                    context,
                    title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                  );
                },
              ),
              ButtonProfile(
                iconLeft: PhosphorIconsFill.shield,
                title: 'Privacy & Security',
                onTap: () {
                  showSnackBarCustom(
                    context,
                    title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                  );
                },
              ),
              ButtonProfile(
                iconLeft: PhosphorIconsFill.gear,
                title: 'Setting',
                onTap: () {
                  showSnackBarCustom(
                    context,
                    title: 'Maaf, fitur belum tersedia 🙏🏻☺️',
                  );
                },
              ),
              ButtonProfile(
                iconLeft: PhosphorIconsFill.appWindow,
                title: 'App Version',
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
      ),
    );
  }
}

class ButtonProfile extends StatelessWidget {
  const ButtonProfile({
    super.key,
    required this.iconLeft,
    required this.title,
    this.onTap,
  });

  final dynamic iconLeft;
  final String title;

  final dynamic onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          spacing: 16,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(999),
              ),
              child: PhosphorIcon(
                iconLeft,
                size: 32,
                color: Colors.blue.shade700,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
              ),
              child: PhosphorIcon(
                PhosphorIconsRegular.caretRight,
                size: 32,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
