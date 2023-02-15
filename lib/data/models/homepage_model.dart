import 'dart:convert';

class HomepageModel {
  final String name;
  final String address;
  final String company;

  HomepageModel(
    this.name,
    this.address,
    this.company,
  );

  HomepageModel copyWith({
    String? name,
    String? address,
    String? company,
  }) {
    return HomepageModel(
      name ?? this.name,
      address ?? this.address,
      company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'company': company,
    };
  }

  factory HomepageModel.fromMap(Map<String, dynamic> map) {
    return HomepageModel(
      map['name'] ?? '',
      map['address']['city'] ?? '',
      map['company']['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomepageModel.fromJson(String source) =>
      HomepageModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'HomepageModel(name: $name, address: $address, company: $company)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomepageModel &&
        other.name == name &&
        other.address == address &&
        other.company == company;
  }

  @override
  int get hashCode => name.hashCode ^ address.hashCode ^ company.hashCode;
}
