import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:farsight_vendor_app/styles/styles.dart';

class DropdownInput<T> extends StatelessWidget {
  final T? value;
  final String label;
  final bool isLoading;
  final List<T> options;
  final String hintTextStr;
  final String searchHintTextStr;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;
  final TextEditingController? searchKey;
  final bool Function(DropdownMenuItem<dynamic>, String)? searchMatch;
  final String? disabledHint;

  const DropdownInput({
    Key? key,
    required this.value,
    required this.getLabel,
    required this.onChanged,
    this.searchKey,
    this.searchMatch,
    this.label = 'option',
    this.isLoading = false,
    this.options = const [],
    this.hintTextStr = 'select an option',
    this.searchHintTextStr = 'search for an item...',
    this.disabledHint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
      value: options.contains(value) ? value : null,
      isDense: true,
      isExpanded: true,
      hint: Text(hintTextStr),
      selectedItemHighlightColor: Colors.black12,
      itemHeight: Get.size.height * 0.06 < 45 ? 45 : Get.size.height * 0.06,
      searchInnerWidgetHeight: 150,
      offset: Offset(
        0,
        searchKey != null ? Get.size.height : 0,
      ),
      decoration: Styles.selectFieldStyle(
        labelStr: label,
        hintTextStr: hintTextStr,
      ),
      icon: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            )
          : const Icon(
              Icons.arrow_drop_down,
              color: Colors.black54,
            ),
      iconSize: 24,
      buttonHeight: 50,
      dropdownMaxHeight: Get.size.height * 0.6,
      buttonPadding: const EdgeInsets.only(left: 0, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      items: options.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(
            getLabel(value),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      validator: <String>(String? value) {
        if (value == null) {
          return 'Select a $label';
        }
        return null;
      },
      disabledHint:
          disabledHint != null ? Text(disabledHint!) : const SizedBox.shrink(),
      onChanged: onChanged,
      searchController: searchKey,
      searchInnerWidget: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 8,
          right: 8,
          bottom: 4,
        ),
        child: TextFormField(
          controller: searchKey,
          decoration: Styles.customTextFieldStyle(
            hintTextStr: searchHintTextStr,
          ),
        ),
      ),
      searchMatchFn: (item, searchValue) {
        return searchMatch!(item, searchValue);
      },
      onMenuStateChange: (isOpen) {
        if (!isOpen) {
          searchKey?.clear();
          FocusScope.of(context);
        }
      },
    );
  }
}
