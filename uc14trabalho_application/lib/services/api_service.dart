import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item_model.dart';

class ApiService {
  // Exemplo: API pública de amostra (substitua pela API do seu hobby)
  final String endpoint = 'https://api.sampleapis.com/coffee/hot';

  Future<List<ItemModel>> fetchItems() async {
    final resp = await http.get(Uri.parse(endpoint));
    if (resp.statusCode == 200) {
      final List data = json.decode(resp.body);
      return data.map((e) => ItemModel.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar dados: ${resp.statusCode}');
    }
  }
}
