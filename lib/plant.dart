
class Plant {
  final String name;
  final String water;
  final String heat;
  final String maxHeat;
  final String minHeat;
  final int avgLife;

  Plant({this.name, this.water, this.heat, this.maxHeat, this.minHeat, this.avgLife});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return new Plant(
      name: json['name'] as String,
      water: json['water'] as String,
      heat: json['heat'] as String,
      maxHeat: json['MaximumHeat'] as String,
      minHeat: json['MinimumHeat'] as String,
      avgLife: json['AverageLife'] as int,
    );
  }
}