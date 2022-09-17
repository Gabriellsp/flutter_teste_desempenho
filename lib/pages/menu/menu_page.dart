import 'package:flutter/material.dart';
import 'package:flutter_teste_desempenho/pages/data_rendering/data_rendering_page.dart';
import 'package:flutter_teste_desempenho/pages/menu/widgets/button_menu.dart';
import 'package:flutter_teste_desempenho/pages/processing/processing_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Menu')),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          spacing: 80,
          children: [
            ButtonMenu(
              buttonName: 'Teste de Processamento',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProcessingPage(),
                ),
              ),
            ),
            ButtonMenu(
              buttonName: 'Teste de Renderização',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DataRenderingPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
