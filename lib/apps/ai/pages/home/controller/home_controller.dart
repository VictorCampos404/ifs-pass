import 'package:flutter/material.dart';
import 'package:ifs_pass/apps/ai/pages/home/model/message.dart';
import 'package:system_package/system.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AiHomeController extends BaseStatus {
  TextEditingController inputCtrl = TextEditingController();

  bool get sendButtonEnable => inputCtrl.text.isNotEmpty;

  List<String> areas = [
    'Análise de dados',
    'Ciência de Dados',
    'Cloud Computing',
    'Desenvolvimento Web',
    'Gestão de Projetos de TI',
    'Inteligência Artificial',
    'Machine Learning',
    'Programação',
    'Redes de Computadores',
    'Segurança da Informação',
    'Suporte em TI',
    'Tecnologia da Informação (TI)',
    'UX/UI Design',
  ];

  late List<Message> _messages;
  List<Message> get messages => _messages;

  AiHomeController() {
    reset();
  }

  void reset() {
    inputCtrl = TextEditingController();
    _messages = [];
    notifyListeners();
  }

  void setInputCtrlText(value) {
    inputCtrl.text = value;
    notifyListeners();
  }

  void updateStatus() {
    notifyListeners();
  }

  Future<void> sendMessage() async {
    final text = inputCtrl.text;

    _messages.add(
      Message(
        isUser: true,
        label: text,
      ),
    );

    _messages.add(
      Message(
        isUser: false,
        label: null,
      ),
    );

    inputCtrl.clear();

    setStatus(Status.loading);
    try {

      const apiKey = 'AIzaSyDa1CxCR_rOrzg1q__EatlOaxfzgsXz2d8';
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
      );

      final content = [
        Content.text(
          'Liste os topicos necessarios para aprender $text, sem descricao, apenas os topicos listados em ordem logica',
        )
      ];

      final response = await model.generateContent(content);

      _messages.last = Message(
        isUser: false,
        label: response.text ??
            'Erro ao gerar resposta, tente novamente mais tarde.s',
      );

      setStatus(Status.success);
    } catch (error) {
      _messages.last = Message(
        isUser: false,
        label: 'Erro ao gerar resposta, tente novamente mais tarde.',
      );
      setStatus(Status.error);
    }
  }
}
