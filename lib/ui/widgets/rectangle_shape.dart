

class RectangleShape {
  late String type;
  late Border border;
  late BorderRadius borderRadius;
  late CornerStyles cornerStyles;

  RectangleShape(
      {required this.type, required this.border, required this.borderRadius, required this.cornerStyles});

  RectangleShape.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    border =
    (json['border'] != null ?  Border.fromJson(json['border']) : null)!;
    borderRadius = (json['borderRadius'] != null
        ?  BorderRadius.fromJson(json['borderRadius'])
        : null)!;
    cornerStyles = (json['cornerStyles'] != null
        ?  CornerStyles.fromJson(json['cornerStyles'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['type'] = type;
    data['border'] = border.toJson();
    data['borderRadius'] = borderRadius.toJson();
    data['cornerStyles'] = cornerStyles.toJson();
    return data;
  }
}

class Border {
  late String color;
  late int width;
  late String style;
  late String strokeCap;
  late String strokeJoin;

  Border({required this.color,required this.width, required this.style,required this.strokeCap,required this.strokeJoin});

  Border.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    width = json['width'];
    style = json['style'];
    strokeCap = json['strokeCap'];
    strokeJoin = json['strokeJoin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['width'] = width;
    data['style'] = style;
    data['strokeCap'] = strokeCap;
    data['strokeJoin'] = strokeJoin;
    return data;
  }
}

class BorderRadius {
  late TopLeft topLeft;
  late TopLeft topRight;
  late TopLeft bottomLeft;
  late TopLeft bottomRight;

  BorderRadius(
      {required this.topLeft, required this.topRight, required this.bottomLeft, required this.bottomRight});

  BorderRadius.fromJson(Map<String, dynamic> json) {
    topLeft =
    (json['topLeft'] != null ?  TopLeft.fromJson(json['topLeft']) : null)!;
    topRight = (json['topRight'] != null
        ?  TopLeft.fromJson(json['topRight'])
        : null)!;
    bottomLeft = (json['bottomLeft'] != null
        ?  TopLeft.fromJson(json['bottomLeft'])
        : null)!;
    bottomRight = (json['bottomRight'] != null
        ?  TopLeft.fromJson(json['bottomRight'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['topLeft'] = topLeft.toJson();
    data['topRight'] = topRight.toJson();
    data['bottomLeft'] = bottomLeft.toJson();
    data['bottomRight'] = bottomRight.toJson();
    return data;
  }
}

class TopLeft {
  late String x;
  late String y;

  TopLeft({ this.x = '0', this.y = '0'});

  TopLeft.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}

class CornerStyles {
  late String topLeft;
  late String bottomLeft;
  late String topRight;
  late String bottomRight;

  CornerStyles(
      {required this.topLeft, required this.bottomLeft, required this.topRight, required this.bottomRight});

  CornerStyles.fromJson(Map<String, dynamic> json) {
    topLeft = json['topLeft'];
    bottomLeft = json['bottomLeft'];
    topRight = json['topRight'];
    bottomRight = json['bottomRight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topLeft'] = topLeft;
    data['bottomLeft'] = bottomLeft;
    data['topRight'] = topRight;
    data['bottomRight'] = bottomRight;
    return data;
  }
}