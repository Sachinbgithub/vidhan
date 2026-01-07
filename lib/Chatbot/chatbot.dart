import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vidhan/Chatbot/msg_widget.dart'; // Ensure this path is correct

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late GenerativeModel _model;
  ChatSession? _chatSession; // Make _chatSession nullable
  final FocusNode _textFieldFocus = FocusNode();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;
  String _outputText = ''; // Added for displaying errors/status

  final String _apiKey =
      'AIzaSyDQale7h_xn3F2dqz62V7u-6pw5DuKyRY4';

  @override
  void initState() {
    super.initState();
    _initializeGemini(); // Initialize Gemini in initState
  }

  // Separate Gemini initialization
  Future<void> _initializeGemini() async {
    try {
      _model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: _apiKey);
      _chatSession = _model.startChat();
      _outputText = 'Chatbot initialized.'; //update _outputText
    } catch (e) {
      _outputText = 'Error initializing Gemini: $e';
      print('Error initializing Gemini: $e'); // Keep the print for detailed logs
      // Consider showing a dialog here as well, to inform the user on startup
      if (mounted) {
        //check mounted
        _showError('Failed to initialize chatbot: $e');
      }
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _textFieldFocus.dispose();
    _scrollController.dispose();
    // _chatSession?.dispose(); // Dispose the chat session if it's not null
    super.dispose();
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
          children: [
            Expanded(
              child: _buildChatHistory(), //separate widget
            ),
            _buildInputArea(), //separate widget
            if (_loading) const LinearProgressIndicator(), // Show loading indicator
            if (_outputText.isNotEmpty &&
                !_loading) //show status/error
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _outputText,
                  style: TextStyle(
                    color: _outputText.startsWith('Error')
                        ? Colors.red
                        : Colors
                        .grey, //simple error message.
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  //build chat history
  Widget _buildChatHistory() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _chatSession?.history.length ??
          0, // Use null-aware length, and handle null case.
      itemBuilder: (context, index) {
        // Use null-aware access.  If _chatSession is null, return an empty widget.
        if (_chatSession == null) {
          return const SizedBox(); // Or a Text("Chat session not initialized");
        }
        final Content content = _chatSession!.history.toList()[index];
        final text = content.parts
            .whereType<TextPart>()
            .map<String>((e) => e.text)
            .join('');
        return MsgWidget(
          text: text,
          isFromUser: content.role == 'user',
          userColor: const Color(
              0xFF9E9D9F), // Consistent color definitions.  Consider moving to constants.
          botColor: const Color(0xFFE1E1F6),
        );
      },
    );
  }

  //build input area
  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              focusNode: _textFieldFocus,
              decoration: _textFieldDecoration(),
              controller: _textController,
              onSubmitted: _handleSendMessage, //use new function
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                _handleSendMessage(_textController.text); //use new function
              }
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  InputDecoration _textFieldDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: 'Enter a query..',
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Colors.grey, // Use theme if available
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Colors.blue, // Use theme if available
        ),
      ),
    );
  }

  //centralize message sending
  Future<void> _handleSendMessage(String message) async {
    if (_loading) return; // Prevent sending new messages while loading
    setState(() {
      _loading = true;
      _outputText = ''; // Clear any previous status
    });

    try {
      //check if chat session is null
      if (_chatSession == null) {
        _outputText =
        'Chat session is not initialized.  Please restart the chat.';
        setState(() {
          _loading = false;
        });
        return;
      }

      final response = await _chatSession!.sendMessage(Content.text(message));
      if (response.text == null) {
        _showError('No response from the model.');
        setState(() {
          _loading = false;
        });
        return; // Important: Exit the function if there's an error
      }
      setState(() {
        _outputText = '';
      }); //clear
      _scrollDown(); // Scroll after successful message
    } catch (e) {
      _showError('Error sending message: $e');
      setState(() {
        _outputText = 'Error sending message: $e';
        _loading = false;
      });
      print("Error sending message $e");
    } finally {
      setState(() {
        _loading = false;
      });
      _textController.clear();
      _textFieldFocus.requestFocus();
    }
  }

  //extracted scroll down.
  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), //make it faster
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Error dialog.
  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'), //simple title
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

