import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _controller = TextEditingController();
  String _response = "";

  void _sendMessage() {
    String question = _controller.text;
    // Call Gemini AI API here with the question
    // This is a placeholder for the actual API call
    setState(() {
      _response = "Response from Gemini AI for: $question"; // Replace with actual response
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: "Type your question",
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) {
            _sendMessage();
          },
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _sendMessage,
          child: Text("Send"),
        ),
        SizedBox(height: 10),
        Text(_response),
      ],
    );
  }
}