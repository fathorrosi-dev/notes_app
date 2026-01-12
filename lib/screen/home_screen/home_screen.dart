import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/provider/notes_provider.dart';
import 'package:notes_app/screen/home_screen/components/app_drawer.dart';
import 'package:notes_app/screen/home_screen/components/note_card.dart';
import 'package:notes_app/screen/utils/constants/colors.dart';
import 'package:notes_app/screen/utils/helpers/helper_function.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotesProvider>().loadNotes();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _showNoteDialog({NoteModel? note}) {
    final isEditing = note != null;
    _titleController.text = isEditing ? note.title : '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: HelperFunction.isDarkMode(context)
            ? AppColors.dark
            : AppColors.light,
        title: Text(
          isEditing ? 'Edit Note' : 'Add Note',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          cursorColor: Colors.amber,
          controller: _titleController,
          decoration: InputDecoration(
            hintText: 'Title',
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: HelperFunction.isDarkMode(context)
                    ? AppColors.lightSecondary
                    : AppColors.dark,
              ),
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 105,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.amber,
                    side: const BorderSide(color: Colors.amber),
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
              SizedBox(
                width: 105,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    final title = _titleController.text;
                    if (isEditing) {
                      context.read<NotesProvider>().updateNote(
                        NoteModel(id: note.id, title: title),
                      );
                    } else {
                      context.read<NotesProvider>().addNote(
                        NoteModel(title: title),
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    isEditing ? 'Update' : 'Add',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _deleteNote(int id) {
    context.read<NotesProvider>().deleteNoteById(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: HelperFunction.isDarkMode(context)
                  ? AppColors.light
                  : AppColors.dark,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Notes',
                  style: GoogleFonts.dmSerifText(
                    color: HelperFunction.isDarkMode(context)
                        ? AppColors.lightTextPrimary
                        : AppColors.darkTextPrimary,
                    fontSize: 48,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Consumer<NotesProvider>(
                builder: (context, notesProvider, child) =>
                    notesProvider.notes.isEmpty
                    ? SizedBox(
                        height: HelperFunction.screenHeight(context) * 0.7,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'No Notes Available',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: notesProvider.notes.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final note = notesProvider.notes[index];
                          return NoteCard(
                            title: note.title,
                            onEditTap: () => _showNoteDialog(note: note),
                            onDeleteTap: () => _deleteNote(note.id!),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () => _showNoteDialog(),
        child: Icon(
          Icons.add,
          color: HelperFunction.isDarkMode(context)
              ? AppColors.lightSecondary
              : AppColors.dark,
        ),
      ),
    );
  }
}
