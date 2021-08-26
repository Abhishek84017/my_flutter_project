import 'package:flutter/material.dart';
import 'package:avt_yuwas/constants/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar appBar<T>(
    {required BuildContext context,
    String title = '',
    List<Widget>? actions,
    ShapeBorder? shape,
    Widget? leading,
    bool? centerTitle,
    Color? backgroundColor,
    double? elevation,
    Color? leadingColor,
    Widget? titleWidget,
    VoidCallback? onBackPressed,
    TextStyle? titleStyle,
    T? popData,
    PreferredSizeWidget? bottom,
    bool automaticallyImplyLeading = true}) {
  if (automaticallyImplyLeading) {
    leading = IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: onBackPressed ??
            () async {
              FocusScope.of(context).unfocus();
              await Navigator.maybePop<T>(context, popData);
            },
        color: Colors.white,
        iconSize: 24.0.sp);
  }
  return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? Palette.appbarcolor,
      title: title != null && title.isNotEmpty
          ? Padding(
            padding: EdgeInsets.only(left:0.05.sw),
            child: Text(
                '$title',
                style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1)
                    .merge(titleStyle),
              ),
          )
          : titleWidget,
      actions:[IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size:24.sp,))],
      shape: shape ?? null,
      leading: leading,
      elevation: elevation ?? 2.0,
      centerTitle: centerTitle ?? false,
      titleSpacing: 0,
      iconTheme: IconThemeData(color: leadingColor ?? Colors.white, size: 20),
      bottom: bottom);

}
