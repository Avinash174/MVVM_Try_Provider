import 'package:flutter/material.dart';
import 'package:mvvm_try/res/colors.dart';

class CustomButtom extends StatelessWidget {
  double height;
  double width;
  final String title;
  final bool loading;
  final VoidCallback? Ontap;
  CustomButtom({
    super.key,
    this.loading = false,
    this.height = 50,
    this.width = 200,
    required this.title,
    required this.Ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Ontap,
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            color: AppColors.btnblueColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
            color: AppColors.whiteColor,
          ),
        )),
      ),
    );
  }
}
