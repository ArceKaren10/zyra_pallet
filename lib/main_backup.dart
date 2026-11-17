
import 'package:flutter/material.dart';

void main() {
  runApp(const ZyraPalletApp());
}

class ZyraPalletApp extends StatelessWidget {
  const ZyraPalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZYRA PALLET',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF173F35)),
        scaffoldBackgroundColor: const Color(0xFFF5F7F5),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF173F35),
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ZYRA PALLET',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
            Text('WAREHOUSE MANAGEMENT', style: TextStyle(fontSize: 10)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Benvenuta!',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Color(0xFF173F35),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Gestisci e monitora i tuoi pallet.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),

            _buildMainButton(
              icon: Icons.camera_alt_outlined,
              title: 'NUOVO PALLET',
              subtitle: 'Fotografa e registra un pallet',
              color: const Color(0xFF173F35),
              onTap: () {},
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _buildCard(
                    Icons.search,
                    'Cerca pallet',
                    'Trova un pallet',
                    () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildCard(
                    Icons.history,
                    'Movimenti',
                    'Storico completo',
                    () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'GESTIONE PALLET',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Color(0xFF173F35),
              ),
            ),

            const SizedBox(height: 12),

            _buildMainButton(
              icon: Icons.inventory_2_outlined,
              title: 'PALLET RITIRATI',
              subtitle: 'Visualizza i pallet ricevuti',
              color: const Color(0xFF527C68),
              onTap: () {},
            ),

            const SizedBox(height: 12),

            _buildMainButton(
              icon: Icons.local_shipping_outlined,
              title: 'PALLET INVIATI',
              subtitle: 'Visualizza i pallet spediti',
              color: const Color(0xFF527C68),
              onTap: () {},
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'ZYRA PALLET © 2026',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: color.withValues(alpha: 0.12),
                  child: Icon(icon, color: color, size: 27),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 28, color: const Color(0xFF173F35)),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173F35),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
