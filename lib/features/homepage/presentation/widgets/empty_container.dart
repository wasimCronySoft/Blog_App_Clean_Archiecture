import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/images/empty.svg",
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.srcIn,
            ),
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "No Blogs available. Add new blogs",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
