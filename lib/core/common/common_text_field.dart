import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isPhoneField;
  final bool isDropdownField;
  final Function(String)? onCountryCodeChanged;
  final List<String>? dropdownItems;
  final String? selectedValue;
  final ValueChanged<String?>? onDropdownChanged;

  const CommonTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.isPhoneField = false,
    this.isDropdownField = false,
    this.onCountryCodeChanged,
    this.dropdownItems,
    this.selectedValue,
    this.onDropdownChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (isPhoneField) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CountryCodePicker(
              onChanged: (code) {
                onCountryCodeChanged?.call(code.dialCode ?? '');
              },
              initialSelection: 'IN',
              favorite: const ['+91', 'IN'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              textStyle: const TextStyle(fontSize: 16),
            ),
            Container(
              width: 1,
              height: 25,
              color: Colors.grey.shade400,
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }

    else if (isDropdownField) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: (selectedValue?.isEmpty ?? true) ? null : selectedValue,
            isExpanded: true,
            hint: Text(
              hintText,
              style: const TextStyle(color: Colors.grey),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            items: dropdownItems?.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onDropdownChanged,
          ),
        ),
      );
    }

    else {
      return TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          suffixIcon: suffixIcon,
        ),
      );
    }
  }
}
