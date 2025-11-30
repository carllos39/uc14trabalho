import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/items_provider.dart';
import '../providers/auth_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ItemsProvider>(context, listen: false).loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ItemsProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.logout();
              // volta para login
              if (mounted) {
                Navigator.pushReplacementNamed(context, "/login");
              }
            },
          )
        ],
      ),
      body: itemsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : itemsProvider.items.isEmpty
              ? const Center(child: Text("Nenhum item encontrado"))
              : ListView.builder(
                  itemCount: itemsProvider.items.length,
                  itemBuilder: (_, i) {
                    final item = itemsProvider.items[i];
                    return ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(item["title"] ?? "Sem título"),
                      subtitle: Text(item["body"] ?? "Sem conteúdo"),
                      onTap: () {
                        Navigator.pushNamed(context, "/detail",
                            arguments: item);
                      },
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          itemsProvider.loadItems();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
