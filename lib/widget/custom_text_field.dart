import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/color.dart';
import 'package:flutter_boilerplate/common/const.dart';
import 'package:flutter_boilerplate/common/dimen_const.dart';
import 'package:flutter_boilerplate/common/space.dart';
import 'package:flutter_boilerplate/common/theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.padding,
    this.textInputAction,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.obscureText = false,
    this.maxLines = 1,
    this.initialValue,
    this.enabled,
    this.readOnly = false,
    this.isRequired = true,
    this.isCollapsed = true,
    this.autofocus = false,
    this.debounceDuration,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool? enabled;
  final String? initialValue;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool isRequired;
  final bool isCollapsed;
  final bool autofocus;
  final int? debounceDuration;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Row(
            children: [
              Text(
                widget.labelText!,
                style: myTextTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: widget.enabled == false ? Colors.grey : null,
                ),
              ),
              if (widget.isRequired)
                Text(
                  '*',
                  style: myTextTheme.headline6?.copyWith(
                    color: widget.enabled == false ? Colors.grey : Colors.red,
                  ),
                ),
            ],
          ),
          verticalSpaceSmall,
        ],
        TextFormField(
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            hintText: widget.hintText ?? widget.labelText,
            hintStyle: TextStyle(
              color: widget.enabled == false ? Colors.grey : null,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            isCollapsed: widget.isCollapsed,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Dimens.size16,
              vertical: Dimens.size16,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadiusCircular,
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: colorPrimary, width: 0.5),
              borderRadius: borderRadiusCircular,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: colorPrimary, width: 0.5),
              borderRadius: borderRadiusCircular,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: colorPrimary, width: 0.5),
              borderRadius: borderRadiusCircular,
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadiusCircular,
            ),
          ),
          autofocus: widget.autofocus,
          obscureText: widget.obscureText,
          textAlignVertical: TextAlignVertical.center,
          onTap: widget.onTap,
          initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          enabled: widget.enabled,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          validator: widget.validator ??
              (widget.isRequired
                  ? (String? value) {
                      if (value?.isEmpty == true) {
                        return '${widget.hintText ?? widget.labelText} belum diisi';
                      }
                      return null;
                    }
                  : null),
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: (value) {
            if (widget.onChanged == null) return;
            if (_debounce?.isActive == true) {
              _debounce?.cancel();
            }
            setState(() {
              _debounce = Timer(
                Duration(
                  milliseconds: widget.debounceDuration ?? debounceDuration,
                ),
                () => widget.onChanged!(value),
              );
            });
          },
        ),
      ],
    );
  }
}
