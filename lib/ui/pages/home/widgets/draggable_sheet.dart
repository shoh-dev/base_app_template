import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DragController extends DraggableScrollableController {
  DragController({
    this.minChildSize = 0.1,
    this.maxChildSize = 0.9,
    this.initialChildSize = 0.5,
  });

  final double minChildSize;
  final double maxChildSize;
  final double initialChildSize;

  final _sheet = GlobalKey();

  void collapse() => _animateSheet(sheet.snapSizes!.first);

  void anchor() => _animateSheet(sheet.snapSizes!.last);

  void expand() => _animateSheet(sheet.maxChildSize);

  void hide() => _animateSheet(sheet.minChildSize);

  void _animateSheet(double size) {
    animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.bounceInOut,
    );
  }

  DraggableScrollableSheet get sheet =>
      (_sheet.currentWidget as DraggableScrollableSheet);

  bool get isCollapsed => isAttached ? size <= sheet.snapSizes!.first : false;
  bool get isExpanded => isAttached ? size >= sheet.maxChildSize : false;
  bool get isAnchored => isAttached ? size == sheet.snapSizes!.last : false;
}

class DraggableSheet extends StatefulWidget {
  const DraggableSheet(
      {super.key, required this.controller, required this.child});

  final DragController controller;
  final Widget child;

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

// it's a stateful widget!
class _DraggableSheetState extends State<DraggableSheet> {
  DragController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = controller.size;
    if (currentSize <= 0.05) controller.collapse();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        LayoutBuilder(builder: (context, constraints) {
          return DraggableScrollableSheet(
            key: controller._sheet,
            maxChildSize: controller.maxChildSize,
            minChildSize: controller.minChildSize,
            initialChildSize: controller.initialChildSize,
            expand: true,
            snap: true,
            // snapSizes: [
            //   100 / constraints.maxHeight, //minimum size that can collapse
            //   0.5, //midpoints(can be multiple, last will be the last snap point)
            // ],
            controller: controller,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Center(
                          child: Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius: BorderRadius.circular(4),
                              ))),
                    ),
                    SliverToBoxAdapter(
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            Text(
                              'Good Morning, User!',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text('How can we help you today?'),
                          ],
                        ),
                      )),
                    ),
                    SliverList.list(
                      children: [
                        Center(
                          child: SearchAnchor(
                            isFullScreen: true,
                            suggestionsBuilder: (query, controller) {
                              return [
                                const Text('Search 1'),
                                const Text('Search 2'),
                                const Text('Search 3'),
                                const Text('Search 4'),
                                const Text('Search 5'),
                              ].map((e) => InkWell(
                                    onTap: () =>
                                        controller.closeView(e.data.toString()),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: e,
                                    ),
                                  ));
                            },
                            builder: (context, controller) {
                              return SizedBox(
                                height: 56,
                                child: CupertinoTextField(
                                  controller: controller,
                                  onTap: () {
                                    controller.openView();
                                  },
                                  readOnly: true,
                                  placeholder: 'Search',
                                  prefix: const Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Icon(Icons.search),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ]
                          .map((e) => Padding(
                              padding: const EdgeInsets.all(12), child: e))
                          .toList(),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ],
    );
  }
}
