class Recipe {
  final int id;
  final String name;
  final List<String> ingredients;
  final Map<String, String> steps;
  final String? shortDescription;
  final String? longDescription;
  final String coverImage;
  final String? calories;

  Recipe(
      {required this.id,
      required this.name,
      required this.ingredients,
      required this.steps,
      this.shortDescription,
      this.longDescription,
      required this.coverImage,
      this.calories});
}

final List<Recipe> myRecipes = [
  Recipe(
      id: 1,
      name: 'Ensalada César',
      ingredients: [
        '1/2 baguette francesa, cortada en rebanadas finas',
        '3 cucharadas de aceite de oliva extra virgen',
        '1 cucharadita de ajo picado',
        '2 cucharadas de queso parmesano rallado',
        '1 lechuga romana grande (o 2 pequeñas)',
        '1/3 taza de queso parmesano, rallado o en láminas',
        '2 dientes de ajo, picados',
        '2 cucharaditas de mostaza',
        '2 cucharaditas de jugo de limón fresco',
        '1 1/2 cucharadita de vinagre de vino',
        '1/3 taza de aceite de oliva extra virgen',
        'Sal y pimienta a gusto',
      ],
      steps: {
        'assets/images/cesar-step-1.jpg':
            '/u2022 Precalienta el horno a 180°C (350°F)./n/u2022 Corta la baguette en rebanadas de 1/4 de pulgada de grosor. Colócalas en una bandeja para hornear./n/u2022 Mezcla el aceite de oliva con el ajo picado en un tazón pequeño./n/u2022 Rocía las rebanadas de pan con la mezcla de aceite y ajo. Espolvorea el queso parmesano rallado por encima./n/u2022 Hornea durante 10-12 minutos o hasta que los crutones estén dorados y crujientes./n',
        'assets/images/cesar-step-2.jpg':
            '/u2022 En un tazón, mezcla el ajo picado, la mostaza, el jugo de limón y el vinagre de vino./n/u2022 Agrega lentamente el aceite de oliva mientras bates constantemente para emulsionar el aderezo./n/u2022 Añade sal y pimienta al gusto./n',
        'assets/images/cesar-step-3.jpg':
            '/u2022 Lava y seca la lechuga romana. Corta las hojas en trozos del tamaño de un bocado./n/u2022 En un tazón grande, mezcla la lechuga con el aderezo hasta que esté bien cubierta./n/u2022 Agrega los crutones y el queso parmesano rallado o en láminas./n',
        'assets/images/cesar-step-4.jpg':
            '/u2022 Sirve inmediatamente para que los crutones mantengan su textura crujiente./n/u2022 Añade más queso parmesano y pimienta negra al gusto si lo deseas./n'
      },
      coverImage: 'assets/images/cesar.jpg',
      shortDescription: 'Ensalada fresca de preparación rápida'), //Recipe
  Recipe(
      id: 2,
      name: 'Spaghetti con salsa de tomate',
      ingredients: [
        '900 g de carne molida',
        '1 cebolla mediana picada (aproximadamente 1 taza)',
        '4 dientes de ajo picados',
        '1 lata de tomates triturados',
        '1 lata de salsa de tomate',
        '1 lata de pasta de tomate',
        '2 cucharadas de azúcar granulada o al gusto',
        '1 1/2 cucharaditas de albahaca seca',
        '1 cucharadita de condimento italiano',
        '1 hoja de laurel',
        'Sal y pimienta negra recién molida',
        'Pasta cocida de acuerdo con las instrucciones del paquete, para servir',
      ],
      steps: {
        'assets/images/spaghetti-step-1.jpg':
            '/u2022 Caliente una cacerola grande a fuego medio-alto./n/u2022 Agregue la carne y la cebolla./n/u2022 Cocine hasta que estén casi doradas, aproximadamente 5 minutos./n/u2022 Escurrir si lo desea. Agregue el ajo hasta que esté fragante, aproximadamente 30 segundos./n',
        'assets/images/spaghetti-step-2.jpg':
            '/u2022 Agregue los tomates triturados, la salsa de tomate, la pasta de tomate, el azúcar, la albahaca, el condimento italiano y la hoja de laurel./n/u2022 Cocine a fuego lento sin tapar durante 30 minutos, revolviendo ocasionalmente./n/u2022 Sazone al gusto con sal y pimienta./n',
        'assets/images/spaghetti-step-3.jpg': '/u2022 Servir sobre la pasta./n',
      },
      coverImage: 'assets/images/spaghetti.jpg',
      shortDescription: 'Pastas clásicas a la Italiana'), //Recipe
];
