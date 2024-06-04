import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const String name = 'RecipeDetailScreen';
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ensalada'),
      ),
      body: const _IngredientsView(),
    );
  }
}

class _IngredientsView extends StatelessWidget {
  const _IngredientsView({
    super.key,
  });
  //final MenuItem item;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/cesar-1.jpg')),
            const Text(
                'Ingredientes\nPara los crutones:\n\u2022	1/2 baguette francesa, cortada en rebanadas finas\n\u2022	3 cucharadas de aceite de oliva extra virgen\n\u2022	1 cucharadita de ajo picado\n\u2022	2 cucharadas de queso parmesano rallado\nPara la ensalada:\n\u2022	1 lechuga romana grande (o 2 pequeñas)\n\u2022	1/3 taza de queso parmesano, rallado o en láminas\nPara el aderezo César:\n\u2022	2 dientes de ajo, picados\n\u2022	2 cucharaditas de mostaza\n\u2022	2 cucharaditas de jugo de limón fresco\n\u2022	1 1/2 cucharadita de vinagre de vino\n\u2022	1/3 taza de aceite de oliva extra virgen\n\u2022	Sal y pimienta a gusto\n'),
          ],
        ),
      ),
    );
  }
}
