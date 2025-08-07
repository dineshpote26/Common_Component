/*
import 'package:common_jds_flutter/common/app_colors.dart';
import 'package:common_jds_flutter/common/app_icons.dart';
import 'package:common_jds_flutter/common/constants.dart';
import 'package:common_jds_flutter/common/custom_inkwell.dart';
import 'package:common_jds_flutter/widgets/hover/hover_widget.dart';
import 'package:common_jds_flutter/widgets/table/custom_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SortingArrowWidget extends StatelessWidget {
  const SortingArrowWidget({
    Key? key,
    required this.onTap,
    this.order,
    this.isTapped = false,
  }) : super(key: key);
  final Function onTap;
  final SortingOrder? order;
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
        onTap: onTap,
        child: OnHover(builder: (isHovered) {
          return CircleAvatar(
            radius: 10,
            backgroundColor: isTapped
                ? isHovered
                    ? AppColors.black.withOpacity(0.10)
                    : Colors.transparent
                : AppColors.black.withOpacity(0.10),
            child: SvgPicture.asset(
              order == SortingOrder.asc
                  ? AppIcons.icUpwardArrow
                  : AppIcons.icDownwardArrow,
              color: isTapped
                  ? AppColors.black.withOpacity(0.80)
                  : AppColors.black.withOpacity(0.40),
              height: 13,
              package: Constants.packageName,
            ),
          );
        }));
  }
}
*/
