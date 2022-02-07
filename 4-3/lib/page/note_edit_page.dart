import 'package:flutter/material.dart';
import 'package:sticky_notes/data/note.dart';

class NoteEditPage extends StatefulWidget {
  @override
  State createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {

  String? title;

  String? body;

  Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('노트 편집'),
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens),
            tooltip: '배경색 선택',
            onPressed: _displayColorSelectionDialog,
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Container(
          color: color,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '제목 입력',
                  ),
                  maxLines: 1,
                  style: TextStyle(fontSize: 20.0),
                  onChanged: (text) {
                    title = text;
                  },
                ),
                SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '노트 입력',
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (text) {
                    body = text;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _displayColorSelectionDialog() {
    FocusManager.instance.primaryFocus?.unfocus();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('배경색 선택'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('없음'),
                onTap: () => _applyColor(Note.colorDefault),
              ),
              ListTile(
                leading: CircleAvatar(backgroundColor: Note.colorRed),
                title: Text('빨간색'),
                onTap: () => _applyColor(Note.colorRed),
              ),
              ListTile(
                leading: CircleAvatar(backgroundColor: Note.colorOrange),
                title: Text('오렌지색'),
                onTap: () => _applyColor(Note.colorOrange),
              ),
              ListTile(
                leading: CircleAvatar(backgroundColor: Note.colorYellow),
                title: Text('노란색'),
                onTap: () => _applyColor(Note.colorYellow),
              ),
              ListTile(
                leading: CircleAvatar(backgroundColor: Note.colorLime),
                title: Text('연두색'),
                onTap: () => _applyColor(Note.colorLime),
              ),
              ListTile(
                leading: CircleAvatar(backgroundColor: Note.colorBlue),
                title: Text('파란색'),
                onTap: () => _applyColor(Note.colorBlue),
              ),
            ],
          ),
        );
      },
    );
  }

  void _applyColor(Color newColor) {
    setState(() {
      Navigator.pop(context);
      color = newColor;
    });
  }
}
