import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;
  final from = TextEditingController(text: 'Kigali');
  final to = TextEditingController(text: 'Musanze');

  final companies = const [
    'RITCO', 'Volcano Express', 'Virunga Express', 'Different Express',
    'SU Direct', 'Stella', 'Horizon', 'Alpha', 'RFTC', 'Yahoos Car',
    'Matunda', 'Kivu Belt', 'International'
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [_home(), _tickets(), _feedback(), _ownerPreview()];
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET your Ticket', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(onPressed: _support, icon: const Icon(Icons.support_agent)),
        ],
      ),
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.search), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.confirmation_num_outlined), label: 'Tickets'),
          NavigationDestination(icon: Icon(Icons.star_outline), label: 'Feedback'),
          NavigationDestination(icon: Icon(Icons.admin_panel_settings_outlined), label: 'Owner'),
        ],
      ),
    );
  }

  Widget _home() => ListView(padding: const EdgeInsets.all(16), children: [
    Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF1261FF), Color(0xFF49A3FF)]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Travel smarter.', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800)),
        Text('Get your Ticket.', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800)),
        SizedBox(height: 8),
        Text('Book transport across Rwanda from one place.', style: TextStyle(color: Colors.white70)),
      ]),
    ),
    const SizedBox(height: 18),
    Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
      TextField(controller: from, decoration: const InputDecoration(labelText: 'From', prefixIcon: Icon(Icons.trip_origin))),
      TextField(controller: to, decoration: const InputDecoration(labelText: 'To', prefixIcon: Icon(Icons.location_on_outlined))),
      const SizedBox(height: 12),
      FilledButton.icon(onPressed: _search, icon: const Icon(Icons.search), label: const Text('Find trips')),
    ]))),
    const SizedBox(height: 12),
    const Text('Transport companies', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    const SizedBox(height: 8),
    Wrap(spacing: 8, runSpacing: 8, children: companies.map((c) => Chip(label: Text(c))).toList()),
  ]);

  Widget _tickets() => const Center(child: Text('Your confirmed tickets will appear here.'));

  Widget _feedback() => Center(child: FilledButton.icon(
    onPressed: () => showDialog(context: context, builder: (_) => const AlertDialog(
      title: Text('Feedback'), content: Text('Connect this form to POST /api/feedback in the backend.'),
    )),
    icon: const Icon(Icons.rate_review), label: const Text('Give feedback'),
  ));

  Widget _ownerPreview() => ListView(padding: const EdgeInsets.all(16), children: const [
    Text('Owner dashboard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    SizedBox(height: 8),
    Text('The production owner dashboard should be a separate authenticated web application.'),
    SizedBox(height: 16),
    ListTile(leading: Icon(Icons.business), title: Text('Companies'), subtitle: Text('Add, edit, activate and deactivate operators')),
    ListTile(leading: Icon(Icons.route), title: Text('Routes & fares'), subtitle: Text('Control locations, routes, schedules and prices')),
    ListTile(leading: Icon(Icons.confirmation_num), title: Text('Bookings'), subtitle: Text('View bookings, payments, cancellations and refunds')),
    ListTile(leading: Icon(Icons.directions_bus), title: Text('Fleet & drivers'), subtitle: Text('Manage vehicles, seats and driver access')),
    ListTile(leading: Icon(Icons.bar_chart), title: Text('Reports'), subtitle: Text('Revenue, bookings and operator performance')),
  ]);

  void _search() {
    showModalBottomSheet(context: context, builder: (_) => ListView(
      padding: const EdgeInsets.all(20),
      children: ['RITCO • 08:00 • 5,000 RWF', 'Volcano Express • 09:30 • 5,500 RWF', 'Virunga Express • 11:00 • 5,000 RWF']
          .map((x) => Card(child: ListTile(title: Text(x), trailing: FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Select'))))).toList(),
    ));
  }

  Future<void> _support() async {
    final uri = Uri.parse('https://wa.me/250792764881');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
