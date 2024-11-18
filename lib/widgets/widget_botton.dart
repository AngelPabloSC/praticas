import 'package:flutter/material.dart';

Color primaryColor=Colors.blue;
Color grayCardColor = const Color.fromRGBO(55, 73, 87, 1);

class BtnC extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? colorTitle;
  final Color? colorBorderSide;
  final Color? overlayColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Function? onTap;
  final double radius;
  final Widget? leftChild;
  final Widget? rightChild;
  final bool isExpanded;
  final bool isActive;
  final bool inverse;
  final bool inverseWithBorder;
  final bool isCloseKeyboard;

  const BtnC({
    super.key,
    this.title ="",
    this.color,
    this.colorTitle,
    this.overlayColor,
    this.height = 55.0,
    this.width = 450.0,
    this.textStyle,
    this.onTap,
    this.radius = 10.0,
    this.colorBorderSide,
    this.leftChild,
    this.rightChild,
    this.isExpanded = true,
    this.isActive = true,
    this.inverse = false,
    this.inverseWithBorder = false,
    this.isCloseKeyboard = true,
  });

  @override
  Widget build(BuildContext context) {
    var colorAux = isActive ? primaryColor : primaryColor.withOpacity(0.4);
    var colorBorderAux = colorAux;
    if (inverse || inverseWithBorder) {
      colorAux = Colors.transparent;
      if (!inverseWithBorder) colorBorderAux = Colors.transparent;
    }
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(color ?? colorAux),
          overlayColor: MaterialStateProperty.all(overlayColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: colorBorderSide ?? colorBorderAux,
            ),
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftChild != null) leftChild!,
            if (isExpanded) ...[Expanded(child: texBtn())] else ...[texBtn()],
            if (rightChild != null) rightChild!,
          ],
        ),
        onPressed: () {
          if (isCloseKeyboard) closeKeyboard(context);
          if (onTap != null) onTap!();
        },
      ),
    );
  }

  Widget texBtn() {
    var colorTitleAux = colorTitle ?? Colors.white;
    if (inverse || inverseWithBorder) colorTitleAux = primaryColor;
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: textStyle ??
            TextStyle(
              color: colorTitleAux,
              fontSize: 18.0,
            ),
      ),
    );
  }
}






void closeKeyboard(BuildContext context) =>
    FocusScope.of(context).requestFocus(FocusNode());

class BtnCSelect extends StatelessWidget {
  final String title;
  final Function? onTap;
  final bool isSelect;
  final double radius;

  const BtnCSelect({
    super.key,
    this.title = 'Aceptar',
    this.onTap,
    this.isSelect = false,
    this.radius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return BtnC(
      title: title,
      isExpanded: false,
      width: null,
      height: 35.0,
      radius: radius,
      color: isSelect ? null : grayCardColor.withOpacity(0.4),
      colorBorderSide: Colors.transparent,
      textStyle: const TextStyle(
        fontSize: 14.0,
        color: Colors.white,
      ),
      onTap: onTap,
    );
  }
}

class BtnText extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? style;
  final Alignment? alignment;
  final Function? onTap;
  final bool isExpanded;

  const BtnText(
      this.title, {
        super.key,
        this.fontSize,
        this.fontWeight,
        this.style,
        this.alignment,
        this.color,
        this.onTap,
        this.isExpanded = false,
      });

  @override
  Widget build(BuildContext context) {
    if (isExpanded) return Expanded(child: itemBtn(context));
    return itemBtn(context);
  }

  Widget itemBtn(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (onTap != null) {
          closeKeyboard(context);
          onTap!();
        }
      },
      style: ButtonStyle(
        alignment: alignment,
      ),
      child: Text(
        title ?? "",
        style: style ??
            TextStyle(
              fontSize: fontSize ?? 16.0,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: color,
            ),
      ),
    );
  }
}