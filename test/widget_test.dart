import 'package:flutter_test/flutter_test.dart';
import 'package:zyra_pallet/main.dart';

void main() {
  testWidgets('Verifica la pantalla principal', (tester) async {
    await tester.pumpWidget(const ZyraPalletApp());

    expect(find.text('ZYRA PALLET'), findsOneWidget);
    expect(find.text('Benvenuta!'), findsOneWidget);
    expect(find.text('NUOVO PALLET'), findsOneWidget);
    expect(find.text('Cerca pallet'), findsOneWidget);
    expect(find.text('Movimenti'), findsOneWidget);
  });
}
