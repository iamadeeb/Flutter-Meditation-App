import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBoxes extends StatefulWidget {
  final Function(bool isSelected)? onPressed;
  final String? text;

  const CategoryBoxes({Key? key, this.onPressed, this.text}) : super(key: key);

  @override
  State<CategoryBoxes> createState() => _CategoryBoxesState();
}

class _CategoryBoxesState extends State<CategoryBoxes> {
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return   Center(
      child: GestureDetector(
        onTap: (){
         setState(() {
           isSelected = !isSelected;
           widget.onPressed!(isSelected);
         });
        },
        child: Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isSelected? Color(0xff4A80F0): Color(0xff1C2031),
              boxShadow: isSelected ? [
                BoxShadow(
                  color: Color(0xff4A80F0).withOpacity(0.3),
                  offset: Offset(0,4),
                  blurRadius: 20
                ),
              ]: [],
            ),
            child: Center(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
                child: Text(widget.text!, style: TextStyle(color: Colors.white, fontSize:  17.sp, fontWeight: FontWeight.normal),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}







