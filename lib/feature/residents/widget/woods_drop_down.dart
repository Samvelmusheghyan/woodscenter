import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../res/colors.dart';

typedef DropDownItemTapCallback<T> = void Function(WoodsDropDownEntry<T> item);
typedef DropDownOnSelectedItemChanged<T> = void Function(T item);

class WoodsDropDown<T> extends StatefulHookWidget {
  const WoodsDropDown({
    super.key,
    required this.items,
    required this.initialSelected,
    this.onSelectedItemChanged,
  });

  final List<WoodsDropDownEntry<T>> items;
  final T initialSelected;
  final DropDownOnSelectedItemChanged<T>? onSelectedItemChanged;

  @override
  State<StatefulWidget> createState() => WoodsDropDownState<T>();
}

class WoodsDropDownState<T> extends State<WoodsDropDown<T>> {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final _link = LayerLink();

  double? _buttonWidth;

  @override
  Widget build(BuildContext context) {
    final selectedItem = useState(widget.items.firstWhere((element) => element.value == widget.initialSelected));
    return TapRegion(
      onTapOutside: (tap) {
        // _tooltipController.hide();
      },
      child: CompositedTransformTarget(
        link: _link,
        child: OverlayPortal(
          controller: _tooltipController,
          overlayChildBuilder: (BuildContext context) {
            return CompositedTransformFollower(
              link: _link,
              targetAnchor: Alignment.bottomLeft,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: MenuWidget<T>(
                    selectedItem: selectedItem.value,
                    width: _buttonWidth,
                    items: widget.items,
                    onTap: (item) {
                      widget.onSelectedItemChanged?.call(item.value);
                      _tooltipController.hide();
                      selectedItem.value = item;
                    },
                  ),
                ),
              ),
            );
          },
          child: ButtonWidget(
            onTap: onTap,
            child: Align(
              alignment: Alignment.centerLeft, // Align however you like (i.e .centerRight, centerLeft)
              child: Text(
                selectedItem.value.title,
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap() {
    _buttonWidth = context.size?.width;
    _tooltipController.toggle();
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.height = 48,
    this.width,
    this.onTap,
    this.child,
  });

  final double? height;
  final double? width;

  final VoidCallback? onTap;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.0),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Center(
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class MenuWidget<T> extends HookWidget {
  const MenuWidget({
    required this.items,
    this.width,
    this.onTap,
    required this.selectedItem,
    super.key,
  });

  final double? width;
  final List<WoodsDropDownEntry<T>> items;
  final DropDownItemTapCallback<T>? onTap;
  final WoodsDropDownEntry<T> selectedItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 200,
        ),
        width: width ?? 200,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 32,
              offset: const Offset(0, 20),
              spreadRadius: -8,
            ),
          ],
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: items.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = items[index];
            return WoodsDropDownItem<T>(
              item: item,
              onTap: onTap,
              shoeDivider: index != items.length - 1,
              isSelected: item == selectedItem,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 1,
                color: WoodsColors.lineColor,
              ),
            );
          },
        ),
      ),
    );
  }
}

class WoodsDropDownItem<T> extends HookWidget {
  const WoodsDropDownItem({
    required this.onTap,
    required this.item,
    required this.shoeDivider,
    required this.isSelected,
    super.key,
  });

  final WoodsDropDownEntry<T> item;
  final DropDownItemTapCallback<T>? onTap;
  final bool shoeDivider;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: Colors.black,
      textColor: WoodsColors.textColor,
      selected: isSelected,
      title: Text(item.title),
      trailing: isSelected
          ? const Icon(
              Icons.check,
              color: WoodsColors.textColor,
            )
          : null,
      onTap: () {
        onTap?.call(item);
      },
    );
  }
}

class WoodsDropDownEntry<T> {
  final String title;
  final T value;

  const WoodsDropDownEntry({required this.title, required this.value});
}
