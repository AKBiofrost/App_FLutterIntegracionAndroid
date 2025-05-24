import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const PostRequestApp());
}

class PostRequestApp extends StatelessWidget {
  const PostRequestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POST Request Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PostRequestPage(),
    );
  }
}

class PostRequestPage extends StatefulWidget {
  const PostRequestPage({Key? key}) : super(key: key);

  @override
  State<PostRequestPage> createState() => _PostRequestPageState();
}

class _PostRequestPageState extends State<PostRequestPage> {
  final TextEditingController _urlController = TextEditingController(text: 'https://jsonplaceholder.typicode.com/posts');
  final TextEditingController _bodyController = TextEditingController(text: '{"title": "foo", "body": "bar", "userId": 1}');
  String _response = '';
  bool _loading = false;

  Future<void> _sendPostRequest() async {
    setState(() {
      _loading = true;
      _response = '';
    });

    final url = _urlController.text.trim();
    final bodyText = _bodyController.text.trim();

    try {
      final Map<String, dynamic> bodyJson = json.decode(bodyText);

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(bodyJson),
      );

      setState(() {
        _response = 'Status code: ${response.statusCode}\n\nBody:\n${response.body}';
      });
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _urlController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POST Request Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Sección para URL y Body
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  TextField(
                    controller: _urlController,
                    decoration: const InputDecoration(
                      labelText: 'URL',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.url,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: TextField(
                      controller: _bodyController,
                      decoration: const InputDecoration(
                        labelText: 'Body (JSON format)',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _sendPostRequest,
                      child: _loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Enviar POST'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Sección para mostrar la respuesta
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _response.isEmpty ? 'Aquí se mostrará la respuesta...' : _response,
                    style: const TextStyle(fontFamily: 'Courier', fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

