import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/theme/theme.dart';

class CustomTextFormAddress extends StatelessWidget {
  const CustomTextFormAddress({
    Key? key,
    required this.context,
    this.label,
    required this.prefixIcon,
    this.nameTag,
    this.nameTagStyle,
    this.borderColor,
    required this.controller,
    this.focusNode,
    this.textInputType,
    this.isPassword,
    this.hasError,
    this.onFieldSubmitted,
    this.onChanged,
    this.changeVisible,
    this.maxline,
    this.colorText,
    this.height,
    this.passwordVisible,
    this.radius,
    this.validator,
  }) : super(key: key);
  final BuildContext context;
  final String? label;
  final String prefixIcon;
  final String? nameTag;
  final TextStyle? nameTagStyle;
  final Color? borderColor;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final bool? isPassword;
  final bool? hasError;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final void Function()? changeVisible;
  final int? maxline;
  final Color? colorText;
  final double? height;
  final bool? passwordVisible;
  final double? radius;
  final FormFieldValidator<String>? validator;
  final Color hoverColor = Colors.amber;
  final Color errorColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (nameTag != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameTag ?? '',
                style: nameTagStyle ?? AppTextStyle.beVietNam(),
              ),
              const SizedBox(height: 6),
            ],
          )
        else
          Container(),
        SizedBox(
          height: height ?? 40.h,
          child: TextFormField(
            maxLines: maxline ?? 1,
            style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.black),
            onChanged: onChanged,
            validator: validator,
            cursorColor: Theme.of(context).primaryColorLight,
            controller: controller,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              // prefixIconConstraints: BoxConstraints(maxHeight: 20.h, maxWidth: 40.w, minHeight: 20.h, minWidth: 40.w),
              // prefixIcon: Padding(
              //   padding: EdgeInsets.only(left: 12.w, right: 8.w),
              //   child: SvgPicture.asset(
              //     prefixIcon,
              //   ),
              // ),
              contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: passwordVisible != null
                  ? GestureDetector(
                      onTap: () => {
                        changeVisible!(),
                      },
                      child: Icon(
                        passwordVisible == true ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: AppColors.neutral600,
                        size: 20,
                      ),
                    )
                  : null,
              fillColor: const Color.fromRGBO(244, 246, 249, 1),
              labelText: label,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.neutral300,
                ),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
                gapPadding: 0,
              ),
              hoverColor: hoverColor,
              labelStyle: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral600),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: hasError == false ? borderColor ?? AppColors.neutral300 : errorColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: hasError == false ? borderColor ?? AppColors.neutral300 : errorColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
              ),
            ),
            keyboardType: textInputType,
            obscureText: isPassword ?? false,
            focusNode: focusNode,
          ),
        ),
      ],
    );
  }
}
