import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vidhan/Chatbot/msg_widget.dart';
// import 'package:http/http.dart' as http;
// Assuming you have the GeminiService integrated, import it here
// import 'package:vidhan/services/gemini_service.dart';

class ArticleDetailPage extends StatefulWidget {
  final String article;
  final String description;
  final List<String> articles;

  ArticleDetailPage(
      {required this.article,
        required this.description,
        required this.articles});

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  String? explanation;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchExplanation(); // Fetch the explanation when the page loads
  }

  Future<void> _fetchExplanation() async {
    try {
      String response = await GeminiService().getExplanation(widget.article);
      setState(() {
        explanation = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        explanation = 'Failed to load explanation.';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text(widget.article),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Articles under \n${widget.article}:",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...widget.articles.map((subArticle) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subArticle,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    )).toList(),
                    const SizedBox(height: 20),
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : explanation != null
                        ? Text(
                      "AI Explanation:\n\n$explanation",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                        : const Text(
                      "No explanation available",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Icon(Icons.voice_chat),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class GeminiService {
  // Mock implementation, you need to replace with actual API call
  Future<String> getExplanation(String article) async {
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));

    // This is where you'd make your actual API call
    // For example:
    final response = await ('AIzaSyC8Tk0-buF_AYwX8Eii7KHiPJkitWpU7ng', body: { 'article': article });

    // Return mock response
    return "This is a detailed explanation for $article from Gemini AI.";
  }
}
