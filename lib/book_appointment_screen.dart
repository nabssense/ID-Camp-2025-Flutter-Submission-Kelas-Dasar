import 'package:flutter/material.dart';
import 'package:flutter_final_submission_dicoding/components/list_doctor.dart';
import 'package:flutter_final_submission_dicoding/models/doctor_list.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String _query = '';
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Doctor> get _filteredHistory {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return doctorList;
    return doctorList.where((d) {
      return d.name.toLowerCase().contains(q) ||
          d.specialty.toLowerCase().contains(q) ||
          d.bio.toLowerCase().contains(q) ||
          d.tags.any((t) => t.toLowerCase().contains(q));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 768) {
              return MobileScreen(
                controllerSearch: _controller,
                onQueryChanged: (value) => setState(() => _query = value),
                filteredHistory: _filteredHistory,
              );
            } else {
              return DesktopScreen(
                controllerSearch: _controller,
                onQueryChanged: (value) => setState(() => _query = value),
                filteredHistory: _filteredHistory,
              );
            }
          },
        ),
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({
    super.key,
    required this.onQueryChanged,
    required this.filteredHistory,
    required this.controllerSearch,
  });

  final ValueChanged<String> onQueryChanged;
  final List<Doctor> filteredHistory;
  final dynamic controllerSearch;

  @override
  Widget build(BuildContext context) {
    final double viewInsets = MediaQuery.of(context).viewInsets.bottom;
    final controller = DefaultTabController.of(context);

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: viewInsets),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 32,
                  children: [
                    Text(
                      'Book appointment',
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
                            controller: controllerSearch,
                            onChanged: onQueryChanged,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: PhosphorIcon(
                                  PhosphorIconsRegular.magnifyingGlass,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  size: 24,
                                  semanticLabel: 'New Note',
                                ),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                minWidth: 24,
                                minHeight: 24,
                              ),
                              hintText: 'Fever',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ),
                                borderSide: BorderSide(color: Colors.white),
                              ),
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
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    switch (controller.index) {
                      case 0:
                        return ListDoctor(
                          scrollable: false,
                          searchDataDoctor: filteredHistory,
                        );
                      default:
                        return const Center(child: Text('Schedule Empty'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({
    super.key,
    required this.onQueryChanged,
    required this.filteredHistory,
    required this.controllerSearch,
  });

  final ValueChanged<String> onQueryChanged;
  final List<Doctor> filteredHistory;
  final dynamic controllerSearch;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Text(
                  'Book \nappointment',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),

            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(
                  height: 142,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      spacing: 16,
                      children: [
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
                              controller: controllerSearch,
                              onChanged: onQueryChanged,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: PhosphorIcon(
                                    PhosphorIconsRegular.magnifyingGlass,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                    size: 24,
                                    semanticLabel: 'New Note',
                                  ),
                                ),
                                suffixIconConstraints: BoxConstraints(
                                  minWidth: 24,
                                  minHeight: 24,
                                ),
                                hintText: 'Fever',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32),
                                  ),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32),
                                  ),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Ink(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.none,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            _GeneralTabBody(items: filteredHistory),
            _EmptyTabBody(),
            _EmptyTabBody(),
            _EmptyTabBody(),
            _EmptyTabBody(),
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

class _GeneralTabBody extends StatelessWidget {
  const _GeneralTabBody({required this.items});

  final List<Doctor> items;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: ListDoctor(scrollable: false, searchDataDoctor: items),
          ),
        ),
      ],
    );
  }
}

class _EmptyTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: const Center(child: Text('Schedule Empty')),
          ),
        ),
      ],
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  _StickyHeaderDelegate({required this.child, required this.height});

  final Widget child;
  final double height;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: overlapsContent ? 2 : 0,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}
