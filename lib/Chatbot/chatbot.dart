import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vidhan/Chatbot/msg_widget.dart';

class Chat_Bot extends StatefulWidget {
  const Chat_Bot({super.key});

  @override
  State<Chat_Bot> createState() => _Chat_BotState();
}

class _Chat_BotState extends State<Chat_Bot> {
  late final GenerativeModel _model;
  late final ChatSession _chatSession;
  final FocusNode _textFielFocus = FocusNode();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _model = GenerativeModel(
  //     model: 'gemini-pro', apiKey: const String.fromEnvironment('api_key'),
  //   );
  //   _chatSession = _model.startChat();
  // }

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: 'AIzaSyC8Tk0-buF_AYwX8Eii7KHiPJkitWpU7ng',
    );
    _chatSession = _model.startChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            //   child: ListView.builder(
            //     controller: _scrollController,
            //     itemCount: _chatSession.history.length,
            //     itemBuilder: (context, index) {
            //       final Content content = _chatSession.history.toList()[index];
            //       final text = content.parts
            //           .whereType<TextPart>()
            //           .map<String>((e) => e.text)
            //           .join('');
            //       return msg_widget(
            //         text: text,
            //         isFromUser: content.role == 'user',
            //         userColor: Color(0xFF6200EE), // Custom purple for user
            //         botColor: Color(0xFF03DAC6),
            //       );
            //     },
            //   ),
            // ),

            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _chatSession.history.length,
                itemBuilder: (context, index) {
                  final Content content = _chatSession.history.toList()[index];
                  final text = content.parts
                      .whereType<TextPart>()
                      .map<String>((e) => e.text)
                      .join('');
                  return MsgWidget(
                    text: text,
                    isFromUser: content.role == 'user',
                    userColor: Color(0xFF9E9D9F),
                    // Custom purple for user messages
                    botColor: Color(0xFFE1E1F6), // Custom teal for bot messages
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      focusNode: _textFielFocus,
                      decoration: textFielDecoration(),
                      controller: _textController,
                      onSubmitted: _sendChatMessage,
                    ),
                  ),
                  const SizedBox(width: 10), // Adjusted spacing
                  TextButton(
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        _sendChatMessage(_textController.text);
                      }
                    },
                    child: const Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration textFielDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: 'enter a query..',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await _chatSession.sendMessage(
        Content.text(message),
      );
      final text = response.text;
      if (text == null) {
        _showError('No response from API.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFielFocus.requestFocus();
    }
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
