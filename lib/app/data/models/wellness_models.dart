class WellnessModels {
  final int id;
  final String icon;
  final String title;
  final String note;
  final String price;
  final String buyMin;
  final String buyMax;
  final String description;

  const WellnessModels({
    required this.id,
    required this.icon,
    required this.title,
    required this.note,
    required this.price,
    required this.buyMin,
    required this.buyMax,
    required this.description,
  });

  // convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'icon': icon,
      'title': title,
      'note': note,
      'price': price,
      'buy_min': buyMin,
      'buy_max': buyMax,
      'description': description
    };
  }

  // convert Map to WellnessModel
  factory WellnessModels.fromMap(Map<String, dynamic> map) {
    return WellnessModels(
        id: map['id'],
        icon: map['icon'],
        title: map['title'],
        note: map['note'],
        price: map['price'],
        buyMin: map['buy_min'],
        buyMax: map['buy_max'],
        description: map['description']);
  }
}
