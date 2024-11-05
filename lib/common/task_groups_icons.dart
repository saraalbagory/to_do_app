import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_colors.dart';
import 'package:to_do_app/common/images_name.dart';
import 'package:to_do_app/widgets/groups_icons.dart';

class TaskGroupsIcons {
  static Widget work = GroupsIcons(
      iconColor: AppColors.workIconColor,
      imageUrl: ImagesName.workIcon,
      containerColor: AppColors.workColor);
       static Widget dailyTasks = GroupsIcons(
      iconColor: AppColors.workIconColor,
      imageUrl: ImagesName.workIcon,
      containerColor: AppColors.workColor);
       static Widget dailyStudy = GroupsIcons(
      iconColor: AppColors.workIconColor,
      imageUrl: ImagesName.workIcon,
      containerColor: AppColors.workColor);
       static Widget personalProjects = GroupsIcons(
      iconColor: AppColors.workIconColor,
      imageUrl: ImagesName.workIcon,
      containerColor: AppColors.workColor);
}
