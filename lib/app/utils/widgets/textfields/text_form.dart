import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class InputTextFields extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final bool isEnabled;

  const InputTextFields({
    super.key,
    required this.label,
    required this.hint,
    required this.isPassword,
    required this.controller,
    this.isEnabled = true,
  });

  @override
  State<InputTextFields> createState() => _InputTextFieldsState();
}

class _InputTextFieldsState extends State<InputTextFields> {
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.darkColor,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: widget.isPassword ? _obscureText : false,
          enabled: widget.isEnabled,
          decoration: InputDecoration(
              hintText: widget.hint,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyColor,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: _toggleObscureText,
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.greyColor,
                      ))
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.greyColor,
                )
              )
          ),
        ),
      ],
    );
  }
}
