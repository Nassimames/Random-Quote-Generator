import '../models/quote.dart';

Quote _quote({
  required String french,
  required String english,
  required String arabic,
  required String author,
  required String authorArabic,
  required String categoryFr,
  required String categoryEn,
  required String categoryAr,
}) {
  return Quote(
    translations: {
      'fr': QuoteTranslation(
        text: french,
        author: author,
        category: categoryFr,
      ),
      'en': QuoteTranslation(
        text: english,
        author: author,
        category: categoryEn,
      ),
      'ar': QuoteTranslation(
        text: arabic,
        author: authorArabic,
        category: categoryAr,
      ),
    },
  );
}

final quotes = <Quote>[
  _quote(
    french:
        'Le bonheur n’est pas au sommet de la montagne, mais dans la façon de la gravir.',
    english:
        'Happiness is not at the top of the mountain, but in how you climb it.',
    arabic: 'السعادة ليست في قمة الجبل، بل في طريقة تسلّقه.',
    author: 'Confucius',
    authorArabic: 'كونفوشيوس',
    categoryFr: 'SAGESSE',
    categoryEn: 'WISDOM',
    categoryAr: 'حكمة',
  ),
  _quote(
    french:
        'La vie, ce n’est pas d’attendre que l’orage passe, c’est d’apprendre à danser sous la pluie.',
    english:
        'Life is not about waiting for the storm to pass, but learning to dance in the rain.',
    arabic: 'ليست الحياة انتظار انقشاع العاصفة، بل تعلّم الرقص تحت المطر.',
    author: 'Sénèque',
    authorArabic: 'سينيكا',
    categoryFr: 'COURAGE',
    categoryEn: 'COURAGE',
    categoryAr: 'شجاعة',
  ),
  _quote(
    french: 'Rien n’est plus fort qu’une idée dont l’heure est venue.',
    english: 'Nothing is more powerful than an idea whose time has come.',
    arabic: 'لا شيء أقوى من فكرة حان وقتها.',
    author: 'Victor Hugo',
    authorArabic: 'فيكتور هوغو',
    categoryFr: 'ÉLAN',
    categoryEn: 'MOMENTUM',
    categoryAr: 'إلهام',
  ),
  _quote(
    french: 'Fais de ta vie un rêve, et d’un rêve, une réalité.',
    english: 'Make your life a dream, and make your dream a reality.',
    arabic: 'اجعل من حياتك حلماً، ومن حلمك حقيقة.',
    author: 'Antoine de Saint-Exupéry',
    authorArabic: 'أنطوان دو سانت إكزوبيري',
    categoryFr: 'RÊVE',
    categoryEn: 'DREAM',
    categoryAr: 'حلم',
  ),
  _quote(
    french: 'Le voyage de mille lieues commence toujours par un premier pas.',
    english: 'A journey of a thousand miles begins with a single step.',
    arabic: 'رحلة الألف ميل تبدأ دائماً بخطوة واحدة.',
    author: 'Lao Tseu',
    authorArabic: 'لاو تزو',
    categoryFr: 'DÉPART',
    categoryEn: 'BEGINNINGS',
    categoryAr: 'بداية',
  ),
  _quote(
    french: 'La simplicité est la sophistication suprême.',
    english: 'Simplicity is the ultimate sophistication.',
    arabic: 'البساطة هي قمة الرقي.',
    author: 'Léonard de Vinci',
    authorArabic: 'ليوناردو دا فينشي',
    categoryFr: 'CRÉATIVITÉ',
    categoryEn: 'CREATIVITY',
    categoryAr: 'إبداع',
  ),
  _quote(
    french:
        'Celui qui déplace une montagne commence par déplacer de petites pierres.',
    english:
        'The one who moves a mountain begins by carrying away small stones.',
    arabic: 'من يحرّك جبلاً يبدأ بتحريك الحجارة الصغيرة.',
    author: 'Confucius',
    authorArabic: 'كونفوشيوس',
    categoryFr: 'PATIENCE',
    categoryEn: 'PATIENCE',
    categoryAr: 'صبر',
  ),
  _quote(
    french:
        'Aimer, ce n’est pas se regarder l’un l’autre, c’est regarder ensemble dans la même direction.',
    english:
        'Love is not gazing at each other, but looking together in the same direction.',
    arabic:
        'الحب ليس أن ينظر أحدنا إلى الآخر، بل أن ننظر معاً في الاتجاه نفسه.',
    author: 'Antoine de Saint-Exupéry',
    authorArabic: 'أنطوان دو سانت إكزوبيري',
    categoryFr: 'AMOUR',
    categoryEn: 'LOVE',
    categoryAr: 'حب',
  ),
  _quote(
    french:
        'Le secret du changement consiste à concentrer son énergie pour créer du nouveau.',
    english:
        'The secret of change is to focus your energy on creating the new.',
    arabic: 'سرّ التغيير هو أن توجّه طاقتك نحو صنع الجديد.',
    author: 'Socrate',
    authorArabic: 'سقراط',
    categoryFr: 'CHANGEMENT',
    categoryEn: 'CHANGE',
    categoryAr: 'تغيير',
  ),
  _quote(
    french: 'La joie est en tout ; il faut savoir l’extraire.',
    english: 'Joy is everywhere; you only need to know how to find it.',
    arabic: 'الفرح في كل شيء؛ علينا فقط أن نعرف كيف نستخرجه.',
    author: 'Confucius',
    authorArabic: 'كونفوشيوس',
    categoryFr: 'JOIE',
    categoryEn: 'JOY',
    categoryAr: 'فرح',
  ),
  _quote(
    french: 'Même la nuit la plus sombre prendra fin et le soleil se lèvera.',
    english: 'Even the darkest night will end, and the sun will rise.',
    arabic: 'حتى أشدّ الليالي ظلمة ستنتهي، وستشرق الشمس.',
    author: 'Victor Hugo',
    authorArabic: 'فيكتور هوغو',
    categoryFr: 'ESPOIR',
    categoryEn: 'HOPE',
    categoryAr: 'أمل',
  ),
  _quote(
    french: 'La meilleure façon de prédire l’avenir est de le créer.',
    english: 'The best way to predict the future is to create it.',
    arabic: 'أفضل طريقة للتنبؤ بالمستقبل هي أن تصنعه.',
    author: 'Abraham Lincoln',
    authorArabic: 'أبراهام لينكولن',
    categoryFr: 'ACTION',
    categoryEn: 'ACTION',
    categoryAr: 'عمل',
  ),
  _quote(
    french:
        'Il n’y a pas de chemin vers le bonheur : le bonheur est le chemin.',
    english: 'There is no way to happiness: happiness is the way.',
    arabic: 'لا طريق إلى السعادة؛ فالسعادة هي الطريق.',
    author: 'Bouddha',
    authorArabic: 'بوذا',
    categoryFr: 'SÉRÉNITÉ',
    categoryEn: 'SERENITY',
    categoryAr: 'سكينة',
  ),
  _quote(
    french: 'Ce que tu fais aujourd’hui peut améliorer tous tes lendemains.',
    english: 'What you do today can improve all your tomorrows.',
    arabic: 'ما تفعله اليوم قد يجعل كل غدٍ أفضل.',
    author: 'Ralph Waldo Emerson',
    authorArabic: 'رالف والدو إيمرسون',
    categoryFr: 'INSPIRATION',
    categoryEn: 'INSPIRATION',
    categoryAr: 'إلهام',
  ),
  _quote(
    french: 'La beauté est dans les yeux de celui qui regarde.',
    english: 'Beauty is in the eye of the beholder.',
    arabic: 'الجمال في عين من يراه.',
    author: 'Oscar Wilde',
    authorArabic: 'أوسكار وايلد',
    categoryFr: 'BEAUTÉ',
    categoryEn: 'BEAUTY',
    categoryAr: 'جمال',
  ),
  _quote(
    french: 'Un mot gentil peut réchauffer trois mois d’hiver.',
    english: 'A kind word can warm three months of winter.',
    arabic: 'كلمة طيبة قد تدفئ ثلاثة أشهر من الشتاء.',
    author: 'Proverbe japonais',
    authorArabic: 'مثل ياباني',
    categoryFr: 'DOUCEUR',
    categoryEn: 'KINDNESS',
    categoryAr: 'لطف',
  ),
];
