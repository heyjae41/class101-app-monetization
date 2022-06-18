import 'package:flutter/material.dart';
import 'package:sticky_notes/data/note.dart';
import 'package:sticky_notes/providers.dart';

class NoteListPage extends StatefulWidget {
  static const routeName = '/';

  @override
  State createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticky Notes'),
      ),
      body: GridView(
        children: _buildCards(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      ),
    );
  }

  List<Widget> _buildCards() {
    return noteManager().listNotes().map((note) => _buildCard(note)).toList();
  }

  Widget _buildCard(Note note) {
    return Card(
      color: note.color,
      child: Padding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title.isEmpty ? '(제목 없음)' : note.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Text(
                note.body,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(12.0),
      ),
    );
  }
}
