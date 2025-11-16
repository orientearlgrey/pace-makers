import 'package:flutter/material.dart';

class PreOpChecklistItem extends StatefulWidget {
  const PreOpChecklistItem({
    super.key,
    required this.completed,
    required this.description,
    required this.schedule,
  });

  final bool completed;
  final String description, schedule;

  @override
  State<PreOpChecklistItem> createState() => _PreOpChecklistItemState();
}

class _PreOpChecklistItemState extends State<PreOpChecklistItem> {
  late bool _completed;

  @override
  void initState() {
    _completed = widget.completed;
    super.initState();
  }

  void changeCompleted(bool? value) {
    setState(() {
      // TO-DO: Implement logic to update server
      _completed = !_completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xff211217))),
      ),
      child: Row(
        children: [
          Checkbox.adaptive(value: _completed, onChanged: changeCompleted),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(widget.description), Text(widget.schedule)],
          ),
        ],
      ),
    );
  }
}
