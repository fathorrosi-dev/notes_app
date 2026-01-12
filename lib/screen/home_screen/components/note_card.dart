import 'package:flutter/material.dart';
import 'package:notes_app/screen/home_screen/components/note_settings.dart';
import 'package:notes_app/screen/utils/constants/colors.dart';
import 'package:notes_app/screen/utils/helpers/helper_function.dart';
import 'package:popover/popover.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  const NoteCard({
    super.key,
    required this.title,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      decoration: BoxDecoration(
        color: HelperFunction.isDarkMode(context)
            ? AppColors.darkSecondary
            : AppColors.lightSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        trailing: Builder(
          builder: (context) => IconButton(
            onPressed: () => showPopover(
              backgroundColor: Colors.amber,
              height: 100,
              width: 100,
              context: context,
              bodyBuilder: (context) =>
                  NoteSettings(onEditTap: onEditTap, onDeleteTap: onDeleteTap),
            ),
            icon: Icon(
              Icons.more_vert,
              color: HelperFunction.isDarkMode(context)
                  ? AppColors.lightSecondary
                  : AppColors.dark,
            ),
          ),
        ),
      ),
    );
  }
}
