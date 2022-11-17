import 'package:sales_beeorder_app/di/di_config.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';
import 'package:sales_beeorder_app/module_localization/service/localization_service/localization_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final String? hintText;
  final Widget? preIcon;
  final Widget? sufIcon;
  final TextEditingController? controller;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final bool numbers;
  final bool last;
  final bool validator;
  final bool phone;
  final Function()? onChanged;
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();

  CustomFormField(
      {this.height = 65,
        this.contentPadding = const EdgeInsets.fromLTRB(16, 16, 16, 16),
      this.hintText,
      this.preIcon,
      this.sufIcon,
      this.controller,
      this.readOnly = false,
      this.onTap,
      this.maxLines,
      this.numbers = false,
      this.last = false,
      this.validator = true,
      this.phone = false,
      this.onChanged});
}

class _CustomFormFieldState extends State<CustomFormField> {
  AutovalidateMode mode = AutovalidateMode.disabled;
  bool clean = true;
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 15,end: 15,bottom: 10,top: 10),
      child: Container(
        height: widget.height,
        decoration: new BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 8,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          autovalidateMode: mode,
          toolbarOptions: ToolbarOptions(
              copy: true, paste: true, selectAll: true, cut: true,),
          onTap: widget.onTap,
          controller: widget.controller,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines ?? 1,
          cursorHeight:
              getIt<LocalizationService>().getLanguage() == 'ar' && kIsWeb
                  ? 16
                  : null,
          keyboardType: widget.numbers ? TextInputType.phone : null,
          onEditingComplete:
              widget.maxLines != null ? null : () => node.nextFocus(),
          onFieldSubmitted: widget.maxLines == null && widget.last
              ? (_) => node.unfocus()
              : null,
          textInputAction: widget.maxLines == null && widget.last
              ? null
              : TextInputAction.next,
          inputFormatters: widget.numbers
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9+]')),
                ]
              : [],
          onChanged: (v) {
            if (widget.onChanged != null) {
              widget.onChanged!();
            }
            setState(() {});
          },
          validator: widget.validator
              ? (value) {
                  if (mode == AutovalidateMode.disabled) {
                    setState(() {
                      mode = AutovalidateMode.onUserInteraction;
                      clean = false;
                    });
                  }
                  if (value == null) {
                    clean = false;
                    return S.of(context).pleaseCompleteField;
                  } else if (value.isEmpty) {
                    clean = false;
                    return S.of(context).pleaseCompleteField;
                  } else if (value.length < 8 &&
                      widget.numbers &&
                      widget.phone) {
                    clean = false;
                    return 'phoneNumbertooShort';
                  } else {
                    clean = true;
                    return null;
                  }
                }
              : null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            prefixIcon: widget.preIcon,
            suffixIcon: widget.sufIcon,
            enabledBorder: InputBorder.none,
            contentPadding: widget.contentPadding,
            focusedBorder: InputBorder.none,
          ),

        ),
      ),
    );
  }
}


