import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../widgets/ability_card.dart';
import '../models/blasphemy.dart';

class WikiScreen extends StatefulWidget {
  final int initialTab;
  
  const WikiScreen({super.key, this.initialTab = 0});

  @override
  State<WikiScreen> createState() => _WikiScreenState();
}

class _WikiScreenState extends State<WikiScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: widget.initialTab);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Справочник'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppTheme.accentRedLight,
          unselectedLabelColor: AppTheme.textSecondary,
          indicatorColor: AppTheme.accentRed,
          tabs: const [Tab(text: 'Богохульства'), Tab(text: 'Грехи'), Tab(text: 'Повестки')],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Поиск...',
                prefixIcon: const Icon(Icons.search, color: AppTheme.textSecondary),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list, color: AppTheme.accentRed),
                  onPressed: () {}, 
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BlasphemyList(searchQuery: _searchController.text),
                const Center(child: Text('Грехи (в разработке)\n\nЗдесь будет бестиарий аномалий', textAlign: TextAlign.center, style: TextStyle(color: AppTheme.textSecondary))),
                const Center(child: Text('Повестки (в разработке)\n\nЗдесь будут классы персонажей', textAlign: TextAlign.center, style: TextStyle(color: AppTheme.textSecondary))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Список Богохульств
class BlasphemyList extends StatelessWidget {
  final String searchQuery;
  const BlasphemyList({super.key, this.searchQuery = ''});

  @override
  Widget build(BuildContext context) {
    final filtered = mockBlasphemies.where((b) {
      final q = searchQuery.toLowerCase();
      return b.name.toLowerCase().contains(q) || b.description.toLowerCase().contains(q);
    }).toList();

    if (filtered.isEmpty) {
      return const Center(child: Text('Ничего не найдено', style: TextStyle(color: AppTheme.textSecondary)));
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: filtered.length,
      itemBuilder: (context, index) => AbilityCard(blasphemy: filtered[index]),
    );
  }
}