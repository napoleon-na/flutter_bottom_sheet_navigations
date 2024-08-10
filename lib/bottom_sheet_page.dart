import 'package:flutter/material.dart';

class BottomSheetPage<T> extends Page<T> {
  const BottomSheetPage({
    required this.child,
    this.capturedThemes,
    this.barrierLabel,
    this.barrierOnTapHint,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.constraints,
    this.modalBarrierColor,
    this.isDismissible = true,
    this.enableDrag = true,
    this.showDragHandle,
    this.isScrollControlled = false,
    this.scrollControlDisabledMaxHeightRatio = 0.5,
    this.transitionAnimationController,
    this.anchorPoint,
    this.useSafeArea = false,
    this.sheetAnimationStyle,
    super.key,
  });

  final Widget child;

  final CapturedThemes? capturedThemes;

  final String? barrierLabel;

  final String? barrierOnTapHint;

  final Color? backgroundColor;

  final double? elevation;

  final ShapeBorder? shape;

  final Clip? clipBehavior;

  final BoxConstraints? constraints;

  final Color? modalBarrierColor;

  final bool isDismissible;

  final bool enableDrag;

  final bool? showDragHandle;

  final bool isScrollControlled;

  final double scrollControlDisabledMaxHeightRatio;

  final AnimationController? transitionAnimationController;

  final Offset? anchorPoint;

  final bool useSafeArea;

  final AnimationStyle? sheetAnimationStyle;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        builder: (BuildContext context) =>
            (ModalRoute.of(context)?.settings as BottomSheetPage).child,
        capturedThemes: capturedThemes,
        barrierLabel: barrierLabel,
        barrierOnTapHint: barrierOnTapHint,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehavior,
        constraints: constraints,
        modalBarrierColor: modalBarrierColor,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        showDragHandle: showDragHandle,
        isScrollControlled: isScrollControlled,
        scrollControlDisabledMaxHeightRatio:
            scrollControlDisabledMaxHeightRatio,
        settings: this,
        transitionAnimationController: transitionAnimationController,
        anchorPoint: anchorPoint,
        useSafeArea: useSafeArea,
        sheetAnimationStyle: sheetAnimationStyle,
      );
}
