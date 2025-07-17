import 'package:flutter/material.dart';
import 'package:flutter_sample/common_ui/common_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputBar extends StatefulWidget {
  final String title;
  final String? hint;
  final ValueChanged<String?>? valueChanged;
  final ValueChanged<String?>? onSubmitted;
  final ValueChanged<bool>? focusNote;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? lineStretch;

  const InputBar({
    required this.title,
    this.hint,
    this.valueChanged,
    this.focusNote,
    this.keyboardType = TextInputType.text,
    this.lineStretch = false,
    this.obscureText = false,
    this.onSubmitted
  });

  @override
  State<StatefulWidget> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      widget.focusNote?.call(_focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 100.w,
              padding: EdgeInsets.only(left: 16.r, right: 10.r,top: 12.r,bottom: 12.r),
              child: Text(widget.title, style: titleTextStyle15),
            ),
            _inputBar(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: widget.lineStretch == true ? 0 : 15.w),
          child: Divider(height: 1.r, thickness: 0.5.r),
        ),
      ],
    );
  }

  Widget _inputBar() {
    return Expanded(
      child: TextField(
        focusNode: _focusNode,
        onChanged: widget.valueChanged,
        onSubmitted: widget.onSubmitted,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyboardType,
        autofocus: !(widget.obscureText ?? false),
        cursorColor: Colors.grey,
        style: titleTextStyle15,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 5.w, right: 10.w),
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.r),
        ),
      ),
    );
  }
}
