import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      // mise en place de l'avatar
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: EdgeInsets.only(left: 20.w),
          height: 60.h,
          width: 55.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/avatar 2.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(50.0.r),
          ),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(),
          margin: EdgeInsets.only(right: 20),
          child: Icon(Icons.settings, size: 30.sp),
        ),
      ),
    );
  }
}
