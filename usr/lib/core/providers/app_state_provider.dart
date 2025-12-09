import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  // Layout Settings
  double _splitRatio = 0.5; // 50% Chat, 50% Editor
  double get splitRatio => _splitRatio;

  // Model Settings
  String _selectedModel = 'Gemini 1.5 Pro';
  String _localLlmUrl = 'http://localhost:11434'; // Default Ollama
  bool _useLocalLlm = false;
  
  // Prompt Settings
  int _comparisonCount = 3; // "N from N'all"
  bool _enableThinkingMode = false;
  
  // Data
  final List<String> _chatHistory = [];
  String _currentPrompt = "";
  
  List<String> get chatHistory => _chatHistory;
  String get currentPrompt => _currentPrompt;
  String get selectedModel => _selectedModel;
  bool get useLocalLlm => _useLocalLlm;
  int get comparisonCount => _comparisonCount;

  void setSplitRatio(double value) {
    _splitRatio = value.clamp(0.1, 0.9);
    notifyListeners();
  }

  void updatePrompt(String text) {
    _currentPrompt = text;
    notifyListeners();
  }

  void addChatMessage(String message) {
    _chatHistory.add(message);
    notifyListeners();
  }

  void setModel(String model) {
    _selectedModel = model;
    notifyListeners();
  }

  void toggleLocalLlm(bool value) {
    _useLocalLlm = value;
    notifyListeners();
  }
  
  void setComparisonCount(int count) {
    _comparisonCount = count;
    notifyListeners();
  }
}
