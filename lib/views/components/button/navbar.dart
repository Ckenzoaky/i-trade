import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return _navBar();
  }

  Widget _navBar() {
    return Container(
      height: 65.h,
      margin: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 24.h),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(25.r)
      ),
    );
  }
}
