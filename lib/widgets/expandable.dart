// A library of Flutter widgets that allow creating expandable panels
library expandable;

import 'package:flutter/material.dart';

class ExpandableNotifier extends InheritedNotifier<ExpandableController> {
  ExpandableNotifier(
      {
      // An optional key
      Key key,

      /// If the controller is not provided, it's created with the initial state of collapsed.
      ExpandableController controller,
      @required

          /// The child can be any widget which contains [Expandable] widgets in its widget tree.
          Widget child})
      : super(
            key: key,
            notifier: controller ?? ExpandableController(),
            child: child);
}

/// Controls the state (expanded or collapsed) of one or more [Expandable].
/// The controller should be provided to [Expandable] via [ExpandableNotifier].
class ExpandableController extends ValueNotifier<bool> {
  /// Returns [true] if the state is expanded, [false] if collapsed.
  bool get expanded => value;

  ExpandableController([expanded = false]) : super(expanded);

  /// Sets the expanded state.
  set expanded(bool exp) {
    value = exp;
  }

  /// Sets the expanded state to the opposite of the current state.
  void toggle() {
    expanded = !expanded;
  }

  static ExpandableController of(BuildContext context,
      {bool rebuildOnChange = true}) {
    final notifier = rebuildOnChange
        ? context.inheritFromWidgetOfExactType(ExpandableNotifier)
        : context.ancestorWidgetOfExactType(ExpandableNotifier);
    return (notifier as ExpandableNotifier).notifier;
  }
}

/// Shows either the expanded or the collapsed child depending on the state.
/// The state is determined by an instance of [ExpandableController] provided by [ScopedModel]
class Expandable extends StatelessWidget {
  // Whe widget to show when collapsed
  final Widget collapsed;

  // The widget to show when expanded
  final Widget expanded;
  final Duration animationDuration;
  final double collapsedFadeStart;
  final double collapsedFadeEnd;
  final double expandedFadeStart;
  final double expandedFadeEnd;
  final Curve fadeCurve;
  final Curve sizeCurve;

  Expandable(
      {this.collapsed,
      this.expanded,
      this.collapsedFadeStart = 0,
      this.collapsedFadeEnd = 1,
      this.expandedFadeStart = 0,
      this.expandedFadeEnd = 1,
      this.fadeCurve = Curves.linear,
      this.sizeCurve = Curves.fastOutSlowIn,
      this.animationDuration = const Duration(milliseconds: 300)});

  @override
  Widget build(BuildContext context) {
    var controller = ExpandableController.of(context);

    return AnimatedCrossFade(
      firstChild: collapsed ?? Container(),
      secondChild: expanded ?? Container(),
      firstCurve:
          Interval(collapsedFadeStart, collapsedFadeEnd, curve: fadeCurve),
      secondCurve:
          Interval(expandedFadeStart, expandedFadeEnd, curve: fadeCurve),
      sizeCurve: sizeCurve,
      crossFadeState: controller.expanded
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: animationDuration,
    );
  }
}

typedef Widget ExpandableBuilder(
    BuildContext context, Widget collapsed, Widget expanded);

/// Determines the placement of the expand/collapse icon in [ExpandablePanel]
enum ExpandablePanelIconPlacement {
  /// The icon is on the left of the header
  left,

  /// The icon is on the right of the header
  right,
}

/// A configurable widget for showing user-expandable content with an optional expand button.
class ExpandablePanel extends StatelessWidget {
  /// If specified, the header is always shown, and the expandable part is shown under the header
  final Widget header;

  /// The widget shown in the collapsed state
  final Widget collapsed;

  /// The widget shown in the expanded state
  final Widget expanded;

  /// If true then the panel is expanded initially
  final bool initialExpanded;

  /// If true, the header can be clicked by the user to expand
  final bool tapHeaderToExpand;

  /// If true, an expand icon is shown on the right
  final bool hasIcon;

  /// Builds an Expandable object
  final ExpandableBuilder builder;

  /// Expand/collapse icon placement
  final ExpandablePanelIconPlacement iconPlacement;

  static Widget defaultExpandableBuilder(
      BuildContext context, Widget collapsed, Widget expanded) {
    return Expandable(
      collapsed: collapsed,
      expanded: expanded,
    );
  }

  ExpandablePanel(
      {this.collapsed,
      this.header,
      this.expanded,
      this.initialExpanded = false,
      this.tapHeaderToExpand = true,
      this.hasIcon = true,
      this.iconPlacement = ExpandablePanelIconPlacement.right,
      this.builder = defaultExpandableBuilder});

  @override
  Widget build(BuildContext context) {
    Widget buildHeaderRow(Widget child) {
      if (!hasIcon) {
        return child;
      } else {
        final rowChildren = <Widget>[
//          Expanded(
//            flex: 0,
//            child: child,
//          ),
        child,
          Align(
            alignment: Alignment.topCenter,
            child: ExpandableIcon(),
          ),
        ];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: iconPlacement == ExpandablePanelIconPlacement.right
              ? rowChildren
              : rowChildren.reversed.toList(),
        );
      }
    }

    Widget buildHeader(Widget child) {
      return tapHeaderToExpand
          ? ExpandableButton(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 45.0), child: child))
          : child;
    }

    final clickableExpanded = ExpandableExpanded(expanded);
    final clickableCollapsed = ExpandableCollapsed(collapsed);

    Widget buildWithHeader() {
      return Column(
        children: <Widget>[
          buildHeaderRow(buildHeader(header)),
          builder(context, clickableCollapsed, clickableExpanded)
        ],
      );
    }

    Widget buildWithoutHeader() {
      return buildHeaderRow(
          builder(context, buildHeader(clickableCollapsed), clickableExpanded));
    }

    return ExpandableNotifier(
      controller: ExpandableController(initialExpanded),
      child: this.header != null ? buildWithHeader() : buildWithoutHeader(),
    );
  }
}

/// An down/up arrow icon that toggles the state of [ExpandableController] when the user clicks on it.
/// The model is accessed via [ScopedModelDescendant].
class ExpandableIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ExpandableController.of(context);
    return ExpandIcon(
      isExpanded: controller.expanded,
      onPressed: (exp) {
        controller.toggle();
      },
    );
  }
}

/// Toggles the state of [ExpandableController] when the user clicks on it.
class ExpandableButton extends StatelessWidget {
  final Widget child;

  ExpandableButton({this.child});

  @override
  Widget build(BuildContext context) {
    final controller = ExpandableController.of(context);
    return InkWell(
        onTap: () {
          controller.toggle();
        },
        child: child);
  }
}

class ExpandableCollapsed extends StatelessWidget{
  final Widget child;
  ExpandableCollapsed(this.child);

  @override
  Widget build(BuildContext context) {
    final controller = ExpandableController.of(context);
    return GestureDetector(
      onTap: (){
        controller.toggle();
      },
      child: child,
    );
  }
}

class ExpandableExpanded extends StatelessWidget{
  final Widget child;
  ExpandableExpanded(this.child);

  @override
  Widget build(BuildContext context) {
    final controller = ExpandableController.of(context);
    return GestureDetector(
      onTap: (){
        controller.toggle();
      },
      child: child,
    );
  }
}