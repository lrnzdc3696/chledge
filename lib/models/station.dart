class Station {
  String name;
  String description;
  String? nameAbbrev;
  String? alias;

  Station({
    required this.name,
    required this.description,
    this.nameAbbrev,
    this.alias,
  });

  @override
  String toString() {
    return 'Station{name: $name, description: $description, nameAbbrev: $nameAbbrev, alias: $alias}';
  }
}
