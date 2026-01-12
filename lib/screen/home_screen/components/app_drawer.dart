import 'package:flutter/material.dart';
import 'package:notes_app/screen/utils/constants/colors.dart';
import 'package:notes_app/screen/utils/helpers/helper_function.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: HelperFunction.isDarkMode(context)
          ? Colors.black
          : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(70),
                child: Icon(
                  Icons.edit,
                  size: 40,
                  color: HelperFunction.isDarkMode(context)
                      ? AppColors.lightSecondary
                      : AppColors.dark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: HelperFunction.isDarkMode(context)
                        ? AppColors.light
                        : AppColors.dark,
                  ),
                  title: Text(
                    'Home',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: HelperFunction.isDarkMode(context)
                        ? AppColors.light
                        : AppColors.dark,
                  ),
                  title: Text(
                    'About',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: HelperFunction.isDarkMode(context)
                    ? AppColors.light
                    : AppColors.dark,
              ),
              title: Text(
                'Logout',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
