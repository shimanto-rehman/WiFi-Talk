import 'dart:ui';

class User {
  String name;
  String imageUrl;
  Color color;
  String ip;
  String port;

  User({this.name, this.imageUrl, this.color, this.ip, this.port});

  factory User.fromJson(Map<String, dynamic> json) => new User(
      name: json['name'],
      imageUrl: json['imageUrl'],
      color: hexToColor(json['color']),
      ip: json['ip'],
      port: json['port']);

  Map<String, dynamic> toJson() =>
      {'name': name, 'imageUrl': imageUrl, 'color': colorToHex(color), 'ip': ip, 'port': port};
}

// Color of the format #RRGGBB.
Color hexToColor(String code) =>
    new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

String colorToHex(Color color) => '#${color.value.toRadixString(16)}';
