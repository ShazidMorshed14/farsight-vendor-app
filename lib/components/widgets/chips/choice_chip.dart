import 'package:farsight_vendor_app/components/widgets/containers/circular_container.dart';
import 'package:farsight_vendor_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getChipColor(text) != null;

    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? Colors.white : null),
      avatar: isColor
          ? TCircularContainer(
              width: 50,
              height: 50,
              backgroundColor: THelperFunctions.getChipColor(text)!)
          : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      shape: isColor ? const CircleBorder() : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      backgroundColor: isColor ? THelperFunctions.getChipColor(text)! : null,
    );
  }
}
