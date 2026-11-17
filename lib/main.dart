import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = 'https://xiyyxtmojzgqrkcreegi.supabase.co';
const String supabasePublishableKey =
    'sb_publishable_E-U828UQIT0xSN0o6f7sag_GoUjhzjU';

const Color verde = Color(0xFF173F35);
const Color sfondo = Color(0xFFF5F7F5);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    publishableKey: supabasePublishableKey,
  );

  runApp(const ZyraPalletApp());
}

final supabase = Supabase.instance.client;

class ZyraPalletApp extends StatelessWidget {
  const ZyraPalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZYRA PALLET',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: verde),
        scaffoldBackgroundColor: sfondo,
        appBarTheme: const AppBarTheme(
          backgroundColor: verde,
          foregroundColor: Colors.white,
        ),
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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Nessuna nuova notifica.')),
              );
            },
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
                color: verde,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Gestisci e monitora i tuoi pallet.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),

            _MainButton(
              icon: Icons.camera_alt_outlined,
              title: 'NUOVO PALLET',
              subtitle: 'Registra un nuovo pallet',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NuovoPalletScreen()),
                );
              },
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _SmallCard(
                    icon: Icons.search,
                    title: 'Cerca pallet',
                    subtitle: 'Trova un pallet',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CercaPalletScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SmallCard(
                    icon: Icons.history,
                    title: 'Movimenti',
                    subtitle: 'Storico completo',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MovimentiScreen(),
                        ),
                      );
                    },
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
                color: verde,
              ),
            ),
            const SizedBox(height: 12),

            _MainButton(
              icon: Icons.inventory_2_outlined,
              title: 'PALLET RITIRATI',
              subtitle: 'Visualizza i pallet ricevuti',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListaPalletScreen(
                      titolo: 'Pallet ritirati',
                      stato: 'Ritirato',
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _MainButton(
              icon: Icons.local_shipping_outlined,
              title: 'PALLET INVIATI',
              subtitle: 'Visualizza i pallet spediti',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListaPalletScreen(
                      titolo: 'Pallet inviati',
                      stato: 'Spedito',
                    ),
                  ),
                );
              },
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
}

// COMPONENTI GRAFICI

class _MainButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MainButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: verde.withValues(alpha: 0.12),
                  child: Icon(icon, color: verde, size: 27),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: verde,
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
}

class _SmallCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SmallCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 28, color: verde),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: verde,
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

// NUOVO PALLET

class NuovoPalletScreen extends StatefulWidget {
  const NuovoPalletScreen({super.key});

  @override
  State<NuovoPalletScreen> createState() => _NuovoPalletScreenState();
}

class _NuovoPalletScreenState extends State<NuovoPalletScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codiceController = TextEditingController();
  final _mittenteController = TextEditingController();
  final _destinatarioController = TextEditingController();
  final _riferimentoController = TextEditingController();

  String _stato = 'Ritirato';
  bool _salvataggio = false;

  @override
  void dispose() {
    _codiceController.dispose();
    _mittenteController.dispose();
    _destinatarioController.dispose();
    _riferimentoController.dispose();
    super.dispose();
  }

  Future<void> _salvaPallet() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _salvataggio = true);

    try {
      final adesso = DateTime.now().toUtc();

      await supabase.from('pallets').insert({
        'codigo_pallet': _codiceController.text.trim(),
        'mittente': _mittenteController.text.trim(),
        'destinatario': _destinatarioController.text.trim(),
        'referencia': _riferimentoController.text.trim().isEmpty
            ? null
            : _riferimentoController.text.trim(),
        'stato': _stato,
        'data_ritiro': _stato == 'Ritirato' ? adesso.toIso8601String() : null,
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pallet salvato correttamente!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } on PostgrestException catch (e) {
      debugPrint('ERROR SUPABASE: ${e.message}');
      debugPrint('ERROR CODE: ${e.code}');
      debugPrint('ERROR DETAILS: ${e.details}');
      debugPrint('ERROR HINT: ${e.hint}');

      if (!mounted) return;

      _mostraErrore('Errore database: ${e.message} - Codice: ${e.code}');
    } catch (e) {
      debugPrint('ERROR GENERAL: $e');

      if (!mounted) return;

      _mostraErrore('Errore durante il salvataggio: $e');
    } finally {
      if (mounted) setState(() => _salvataggio = false);
    }
  }

  void _mostraErrore(String messaggio) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(messaggio), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NUOVO PALLET')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Registra un nuovo pallet',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: verde,
              ),
            ),
            const SizedBox(height: 25),

            TextFormField(
              controller: _codiceController,
              decoration: const InputDecoration(
                labelText: 'Codice pallet',
                prefixIcon: Icon(Icons.qr_code),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Inserisci il codice del pallet';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _mittenteController,
              decoration: const InputDecoration(
                labelText: 'Mittente',
                prefixIcon: Icon(Icons.business),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Inserisci il mittente';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _destinatarioController,
              decoration: const InputDecoration(
                labelText: 'Destinatario',
                prefixIcon: Icon(Icons.local_shipping),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Inserisci il destinatario';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _riferimentoController,
              decoration: const InputDecoration(
                labelText: 'Riferimento / Note',
                prefixIcon: Icon(Icons.notes),
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 22),

            const Text(
              'Stato del pallet',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              initialValue: _stato,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.inventory_2_outlined),
              ),
              items: const [
                DropdownMenuItem(value: 'Ritirato', child: Text('Ritirato')),
                DropdownMenuItem(value: 'Caricato', child: Text('Caricato')),
                DropdownMenuItem(value: 'Spedito', child: Text('Spedito')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _stato = value);
                }
              },
            ),
            const SizedBox(height: 25),

            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: verde,
                padding: const EdgeInsets.all(16),
              ),
              onPressed: _salvataggio ? null : _salvaPallet,
              icon: _salvataggio
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.save),
              label: Text(_salvataggio ? 'Salvataggio...' : 'SALVA PALLET'),
            ),
          ],
        ),
      ),
    );
  }
}

// CERCA PALLET

class CercaPalletScreen extends StatefulWidget {
  const CercaPalletScreen({super.key});

  @override
  State<CercaPalletScreen> createState() => _CercaPalletScreenState();
}

class _CercaPalletScreenState extends State<CercaPalletScreen> {
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> _risultati = [];
  bool _caricamento = false;
  String? _errore;
  bool _haCercato = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _cercaPallet() async {
    final codice = _controller.text.trim();

    if (codice.isEmpty) {
      setState(() {
        _errore = 'Inserisci il codice del pallet.';
        _risultati = [];
        _haCercato = false;
      });
      return;
    }

    setState(() {
      _caricamento = true;
      _errore = null;
      _risultati = [];
      _haCercato = true;
    });

    try {
      final dati = await supabase
          .from('pallets')
          .select()
          .ilike('codigo_pallet', codice);

      if (!mounted) return;

      setState(() {
        _risultati = List<Map<String, dynamic>>.from(dati);
      });
    } on PostgrestException catch (e) {
      if (!mounted) return;
      setState(() => _errore = 'Errore database: ${e.message}');
    } catch (e) {
      if (!mounted) return;
      setState(() => _errore = 'Errore durante la ricerca: $e');
    } finally {
      if (mounted) setState(() => _caricamento = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CERCA PALLET')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Codice pallet',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _cercaPallet(),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: verde,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: _caricamento ? null : _cercaPallet,
                icon: const Icon(Icons.search),
                label: const Text('CERCA'),
              ),
            ),
            const SizedBox(height: 20),

            if (_caricamento) const CircularProgressIndicator(),

            if (_errore != null)
              Text(_errore!, style: const TextStyle(color: Colors.red)),

            if (!_caricamento &&
                _errore == null &&
                _haCercato &&
                _risultati.isEmpty)
              const Text(
                'Nessun pallet trovato.',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),

            Expanded(
              child: ListView.builder(
                itemCount: _risultati.length,
                itemBuilder: (context, index) {
                  return _PalletCard(pallet: _risultati[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// LISTA PALLET PER STATO

class ListaPalletScreen extends StatefulWidget {
  final String titolo;
  final String stato;

  const ListaPalletScreen({
    super.key,
    required this.titolo,
    required this.stato,
  });

  @override
  State<ListaPalletScreen> createState() => _ListaPalletScreenState();
}

class _ListaPalletScreenState extends State<ListaPalletScreen> {
  late Future<List<Map<String, dynamic>>> _future;

  @override
  void initState() {
    super.initState();
    _future = _caricaPallet();
  }

  Future<List<Map<String, dynamic>>> _caricaPallet() async {
    final dati = await supabase
        .from('pallets')
        .select()
        .eq('stato', widget.stato)
        .order('id', ascending: false);

    return List<Map<String, dynamic>>.from(dati);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titolo.toUpperCase())),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Errore: ${snapshot.error}'));
          }

          final pallets = snapshot.data ?? [];

          if (pallets.isEmpty) {
            return const Center(child: Text('Nessun pallet presente.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: pallets.length,
            itemBuilder: (context, index) {
              return _PalletCard(pallet: pallets[index]);
            },
          );
        },
      ),
    );
  }
}

// MOVIMENTI

class MovimentiScreen extends StatelessWidget {
  const MovimentiScreen({super.key});

  Future<List<Map<String, dynamic>>> _caricaMovimenti() async {
    final dati = await supabase
        .from('movimientos')
        .select()
        .order('fecha_hora', ascending: false);

    return List<Map<String, dynamic>>.from(dati);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MOVIMENTI')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _caricaMovimenti(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Errore: ${snapshot.error}'));
          }

          final movimenti = snapshot.data ?? [];

          if (movimenti.isEmpty) {
            return const Center(child: Text('Nessun movimento registrato.'));
          }

          return ListView.builder(
            itemCount: movimenti.length,
            itemBuilder: (context, index) {
              final movimento = movimenti[index];

              return ListTile(
                leading: const Icon(Icons.history, color: verde),
                title: Text(
                  movimento['tipo_movimiento']?.toString() ?? 'Movimento',
                ),
                subtitle: Text(movimento['fecha_hora']?.toString() ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}

// CARD DATI PALLET

class _PalletCard extends StatelessWidget {
  final Map<String, dynamic> pallet;

  const _PalletCard({required this.pallet});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pallet ${pallet['codigo_pallet'] ?? ''}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: verde,
              ),
            ),
            const Divider(),
            _riga('Mittente', pallet['mittente']),
            _riga('Destinatario', pallet['destinatario']),
            _riga('Riferimento', pallet['referencia']),
            _riga('Stato', pallet['stato']),
            _riga('Data ritiro', pallet['data_ritiro']),
            _riga('Data carico', pallet['data_carico']),
            _riga('Data spedizione', pallet['data_spedizione']),
          ],
        ),
      ),
    );
  }

  Widget _riga(String titolo, dynamic valore) {
    if (valore == null || valore.toString().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            child: Text(
              '$titolo:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(valore.toString())),
        ],
      ),
    );
  }
}
