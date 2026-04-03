// dart format width=100
class InputBigFloatFilter {
  factory InputBigFloatFilter({
    String? eq,
    String? gt,
    String? gte,
    List<String>? $in,
    EnumFilterIs? $is,
    String? lt,
    String? lte,
    String? neq,
  }) => InputBigFloatFilter._({
    if (eq != null) r'eq': eq,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if ($in != null) r'in': $in,
    if ($is != null) r'is': $is,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
    if (neq != null) r'neq': neq,
  });

  InputBigFloatFilter._(this._$data);

  factory InputBigFloatFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as String?);
    }
    return InputBigFloatFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  List<String>? get $in => (_$data['in'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  String? get neq => (_$data['neq'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputBigFloatFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$gt = gt;
    final l$gte = gte;
    final l$$in = $in;
    final l$$is = $is;
    final l$lt = lt;
    final l$lte = lte;
    final l$neq = neq;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
      _$data.containsKey('neq') ? l$neq : const {},
    ]);
  }
}

class InputBigFloatListFilter {
  factory InputBigFloatListFilter({
    List<String>? containedBy,
    List<String>? contains,
    List<String>? eq,
    EnumFilterIs? $is,
    List<String>? overlaps,
  }) => InputBigFloatListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputBigFloatListFilter._(this._$data);

  factory InputBigFloatListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return InputBigFloatListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get containedBy => (_$data['containedBy'] as List<String>?);

  List<String>? get contains => (_$data['contains'] as List<String>?);

  List<String>? get eq => (_$data['eq'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<String>? get overlaps => (_$data['overlaps'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputBigFloatListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

class InputBigIntFilter {
  factory InputBigIntFilter({
    String? eq,
    String? gt,
    String? gte,
    List<String>? $in,
    EnumFilterIs? $is,
    String? lt,
    String? lte,
    String? neq,
  }) => InputBigIntFilter._({
    if (eq != null) r'eq': eq,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if ($in != null) r'in': $in,
    if ($is != null) r'is': $is,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
    if (neq != null) r'neq': neq,
  });

  InputBigIntFilter._(this._$data);

  factory InputBigIntFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as String?);
    }
    return InputBigIntFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  List<String>? get $in => (_$data['in'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  String? get neq => (_$data['neq'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputBigIntFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$gt = gt;
    final l$gte = gte;
    final l$$in = $in;
    final l$$is = $is;
    final l$lt = lt;
    final l$lte = lte;
    final l$neq = neq;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
      _$data.containsKey('neq') ? l$neq : const {},
    ]);
  }
}

class InputBigIntListFilter {
  factory InputBigIntListFilter({
    List<String>? containedBy,
    List<String>? contains,
    List<String>? eq,
    EnumFilterIs? $is,
    List<String>? overlaps,
  }) => InputBigIntListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputBigIntListFilter._(this._$data);

  factory InputBigIntListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return InputBigIntListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get containedBy => (_$data['containedBy'] as List<String>?);

  List<String>? get contains => (_$data['contains'] as List<String>?);

  List<String>? get eq => (_$data['eq'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<String>? get overlaps => (_$data['overlaps'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputBigIntListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

class InputBooleanFilter {
  factory InputBooleanFilter({bool? eq, EnumFilterIs? $is}) =>
      InputBooleanFilter._({if (eq != null) r'eq': eq, if ($is != null) r'is': $is});

  InputBooleanFilter._(this._$data);

  factory InputBooleanFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as bool?);
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    return InputBooleanFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  bool? get eq => (_$data['eq'] as bool?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputBooleanFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$$is = $is;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('is') ? l$$is : const {},
    ]);
  }
}

class InputBooleanListFilter {
  factory InputBooleanListFilter({
    List<bool>? containedBy,
    List<bool>? contains,
    List<bool>? eq,
    EnumFilterIs? $is,
    List<bool>? overlaps,
  }) => InputBooleanListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputBooleanListFilter._(this._$data);

  factory InputBooleanListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as bool))
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)?.map((e) => (e as bool)).toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as bool)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)?.map((e) => (e as bool)).toList();
    }
    return InputBooleanListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<bool>? get containedBy => (_$data['containedBy'] as List<bool>?);

  List<bool>? get contains => (_$data['contains'] as List<bool>?);

  List<bool>? get eq => (_$data['eq'] as List<bool>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<bool>? get overlaps => (_$data['overlaps'] as List<bool>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputBooleanListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

class InputDateFilter {
  factory InputDateFilter({
    String? eq,
    String? gt,
    String? gte,
    List<String>? $in,
    EnumFilterIs? $is,
    String? lt,
    String? lte,
    String? neq,
  }) => InputDateFilter._({
    if (eq != null) r'eq': eq,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if ($in != null) r'in': $in,
    if ($is != null) r'is': $is,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
    if (neq != null) r'neq': neq,
  });

  InputDateFilter._(this._$data);

  factory InputDateFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as String?);
    }
    return InputDateFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  List<String>? get $in => (_$data['in'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  String? get neq => (_$data['neq'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputDateFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$gt = gt;
    final l$gte = gte;
    final l$$in = $in;
    final l$$is = $is;
    final l$lt = lt;
    final l$lte = lte;
    final l$neq = neq;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
      _$data.containsKey('neq') ? l$neq : const {},
    ]);
  }
}

class InputDateListFilter {
  factory InputDateListFilter({
    List<String>? containedBy,
    List<String>? contains,
    List<String>? eq,
    EnumFilterIs? $is,
    List<String>? overlaps,
  }) => InputDateListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputDateListFilter._(this._$data);

  factory InputDateListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return InputDateListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get containedBy => (_$data['containedBy'] as List<String>?);

  List<String>? get contains => (_$data['contains'] as List<String>?);

  List<String>? get eq => (_$data['eq'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<String>? get overlaps => (_$data['overlaps'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputDateListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

class InputDatetimeFilter {
  factory InputDatetimeFilter({
    String? eq,
    String? gt,
    String? gte,
    List<String>? $in,
    EnumFilterIs? $is,
    String? lt,
    String? lte,
    String? neq,
  }) => InputDatetimeFilter._({
    if (eq != null) r'eq': eq,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if ($in != null) r'in': $in,
    if ($is != null) r'is': $is,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
    if (neq != null) r'neq': neq,
  });

  InputDatetimeFilter._(this._$data);

  factory InputDatetimeFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as String?);
    }
    return InputDatetimeFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  List<String>? get $in => (_$data['in'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  String? get neq => (_$data['neq'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputDatetimeFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$gt = gt;
    final l$gte = gte;
    final l$$in = $in;
    final l$$is = $is;
    final l$lt = lt;
    final l$lte = lte;
    final l$neq = neq;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
      _$data.containsKey('neq') ? l$neq : const {},
    ]);
  }
}

class InputDatetimeListFilter {
  factory InputDatetimeListFilter({
    List<String>? containedBy,
    List<String>? contains,
    List<String>? eq,
    EnumFilterIs? $is,
    List<String>? overlaps,
  }) => InputDatetimeListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputDatetimeListFilter._(this._$data);

  factory InputDatetimeListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return InputDatetimeListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get containedBy => (_$data['containedBy'] as List<String>?);

  List<String>? get contains => (_$data['contains'] as List<String>?);

  List<String>? get eq => (_$data['eq'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<String>? get overlaps => (_$data['overlaps'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputDatetimeListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

class InputFloatFilter {
  factory InputFloatFilter({
    double? eq,
    double? gt,
    double? gte,
    List<double>? $in,
    EnumFilterIs? $is,
    double? lt,
    double? lte,
    double? neq,
  }) => InputFloatFilter._({
    if (eq != null) r'eq': eq,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if ($in != null) r'in': $in,
    if ($is != null) r'is': $is,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
    if (neq != null) r'neq': neq,
  });

  InputFloatFilter._(this._$data);

  factory InputFloatFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as num?)?.toDouble();
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as num?)?.toDouble();
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as num?)?.toDouble();
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as num?)?.toDouble();
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as num?)?.toDouble();
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as num?)?.toDouble();
    }
    return InputFloatFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  double? get eq => (_$data['eq'] as double?);

  double? get gt => (_$data['gt'] as double?);

  double? get gte => (_$data['gte'] as double?);

  List<double>? get $in => (_$data['in'] as List<double>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  double? get lt => (_$data['lt'] as double?);

  double? get lte => (_$data['lte'] as double?);

  double? get neq => (_$data['neq'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputFloatFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$gt = gt;
    final l$gte = gte;
    final l$$in = $in;
    final l$$is = $is;
    final l$lt = lt;
    final l$lte = lte;
    final l$neq = neq;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
      _$data.containsKey('neq') ? l$neq : const {},
    ]);
  }
}

class InputFloatListFilter {
  factory InputFloatListFilter({
    List<double>? containedBy,
    List<double>? contains,
    List<double>? eq,
    EnumFilterIs? $is,
    List<double>? overlaps,
  }) => InputFloatListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputFloatListFilter._(this._$data);

  factory InputFloatListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList();
    }
    return InputFloatListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<double>? get containedBy => (_$data['containedBy'] as List<double>?);

  List<double>? get contains => (_$data['contains'] as List<double>?);

  List<double>? get eq => (_$data['eq'] as List<double>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<double>? get overlaps => (_$data['overlaps'] as List<double>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputFloatListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

class InputIDFilter {
  factory InputIDFilter({String? eq}) => InputIDFilter._({if (eq != null) r'eq': eq});

  InputIDFilter._(this._$data);

  factory InputIDFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    return InputIDFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputIDFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    return Object.hashAll([_$data.containsKey('eq') ? l$eq : const {}]);
  }
}

class InputIntFilter {
  factory InputIntFilter({
    int? eq,
    int? gt,
    int? gte,
    List<int>? $in,
    EnumFilterIs? $is,
    int? lt,
    int? lte,
    int? neq,
  }) => InputIntFilter._({
    if (eq != null) r'eq': eq,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if ($in != null) r'in': $in,
    if ($is != null) r'is': $is,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
    if (neq != null) r'neq': neq,
  });

  InputIntFilter._(this._$data);

  factory InputIntFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as int?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as int?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as int?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)?.map((e) => (e as int)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as int?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as int?);
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as int?);
    }
    return InputIntFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get eq => (_$data['eq'] as int?);

  int? get gt => (_$data['gt'] as int?);

  int? get gte => (_$data['gte'] as int?);

  List<int>? get $in => (_$data['in'] as List<int>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  int? get lt => (_$data['lt'] as int?);

  int? get lte => (_$data['lte'] as int?);

  int? get neq => (_$data['neq'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputIntFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$gt = gt;
    final l$gte = gte;
    final l$$in = $in;
    final l$$is = $is;
    final l$lt = lt;
    final l$lte = lte;
    final l$neq = neq;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
      _$data.containsKey('neq') ? l$neq : const {},
    ]);
  }
}

class InputIntListFilter {
  factory InputIntListFilter({
    List<int>? containedBy,
    List<int>? contains,
    List<int>? eq,
    EnumFilterIs? $is,
    List<int>? overlaps,
  }) => InputIntListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputIntListFilter._(this._$data);

  factory InputIntListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as int))
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)?.map((e) => (e as int)).toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as int)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)?.map((e) => (e as int)).toList();
    }
    return InputIntListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<int>? get containedBy => (_$data['containedBy'] as List<int>?);

  List<int>? get contains => (_$data['contains'] as List<int>?);

  List<int>? get eq => (_$data['eq'] as List<int>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<int>? get overlaps => (_$data['overlaps'] as List<int>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputIntListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

class InputOpaqueFilter {
  factory InputOpaqueFilter({String? eq, EnumFilterIs? $is}) =>
      InputOpaqueFilter._({if (eq != null) r'eq': eq, if ($is != null) r'is': $is});

  InputOpaqueFilter._(this._$data);

  factory InputOpaqueFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    return InputOpaqueFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputOpaqueFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$$is = $is;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('is') ? l$$is : const {},
    ]);
  }
}

class InputpostsFilter {
  factory InputpostsFilter({
    InputUUIDFilter? id,
    InputStringFilter? content,
    InputStringFilter? title,
    InputStringFilter? author_image_url,
    InputIDFilter? nodeId,
    List<InputpostsFilter>? and,
    List<InputpostsFilter>? or,
    InputpostsFilter? not,
  }) => InputpostsFilter._({
    if (id != null) r'id': id,
    if (content != null) r'content': content,
    if (title != null) r'title': title,
    if (author_image_url != null) r'author_image_url': author_image_url,
    if (nodeId != null) r'nodeId': nodeId,
    if (and != null) r'and': and,
    if (or != null) r'or': or,
    if (not != null) r'not': not,
  });

  InputpostsFilter._(this._$data);

  factory InputpostsFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = l$id == null
          ? null
          : InputUUIDFilter.fromJson((l$id as Map<String, dynamic>));
    }
    if (data.containsKey('content')) {
      final l$content = data['content'];
      result$data['content'] = l$content == null
          ? null
          : InputStringFilter.fromJson((l$content as Map<String, dynamic>));
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = l$title == null
          ? null
          : InputStringFilter.fromJson((l$title as Map<String, dynamic>));
    }
    if (data.containsKey('author_image_url')) {
      final l$author_image_url = data['author_image_url'];
      result$data['author_image_url'] = l$author_image_url == null
          ? null
          : InputStringFilter.fromJson((l$author_image_url as Map<String, dynamic>));
    }
    if (data.containsKey('nodeId')) {
      final l$nodeId = data['nodeId'];
      result$data['nodeId'] = l$nodeId == null
          ? null
          : InputIDFilter.fromJson((l$nodeId as Map<String, dynamic>));
    }
    if (data.containsKey('and')) {
      final l$and = data['and'];
      result$data['and'] = (l$and as List<dynamic>?)
          ?.map((e) => InputpostsFilter.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('or')) {
      final l$or = data['or'];
      result$data['or'] = (l$or as List<dynamic>?)
          ?.map((e) => InputpostsFilter.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('not')) {
      final l$not = data['not'];
      result$data['not'] = l$not == null
          ? null
          : InputpostsFilter.fromJson((l$not as Map<String, dynamic>));
    }
    return InputpostsFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  InputUUIDFilter? get id => (_$data['id'] as InputUUIDFilter?);

  InputStringFilter? get content => (_$data['content'] as InputStringFilter?);

  InputStringFilter? get title => (_$data['title'] as InputStringFilter?);

  InputStringFilter? get author_image_url => (_$data['author_image_url'] as InputStringFilter?);

  InputIDFilter? get nodeId => (_$data['nodeId'] as InputIDFilter?);

  List<InputpostsFilter>? get and => (_$data['and'] as List<InputpostsFilter>?);

  List<InputpostsFilter>? get or => (_$data['or'] as List<InputpostsFilter>?);

  InputpostsFilter? get not => (_$data['not'] as InputpostsFilter?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id?.toJson();
    }
    if (_$data.containsKey('content')) {
      final l$content = content;
      result$data['content'] = l$content?.toJson();
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title?.toJson();
    }
    if (_$data.containsKey('author_image_url')) {
      final l$author_image_url = author_image_url;
      result$data['author_image_url'] = l$author_image_url?.toJson();
    }
    if (_$data.containsKey('nodeId')) {
      final l$nodeId = nodeId;
      result$data['nodeId'] = l$nodeId?.toJson();
    }
    if (_$data.containsKey('and')) {
      final l$and = and;
      result$data['and'] = l$and?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('or')) {
      final l$or = or;
      result$data['or'] = l$or?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('not')) {
      final l$not = not;
      result$data['not'] = l$not?.toJson();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputpostsFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (_$data.containsKey('content') != other._$data.containsKey('content')) {
      return false;
    }
    if (l$content != lOther$content) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$author_image_url = author_image_url;
    final lOther$author_image_url = other.author_image_url;
    if (_$data.containsKey('author_image_url') != other._$data.containsKey('author_image_url')) {
      return false;
    }
    if (l$author_image_url != lOther$author_image_url) {
      return false;
    }
    final l$nodeId = nodeId;
    final lOther$nodeId = other.nodeId;
    if (_$data.containsKey('nodeId') != other._$data.containsKey('nodeId')) {
      return false;
    }
    if (l$nodeId != lOther$nodeId) {
      return false;
    }
    final l$and = and;
    final lOther$and = other.and;
    if (_$data.containsKey('and') != other._$data.containsKey('and')) {
      return false;
    }
    if (l$and != null && lOther$and != null) {
      if (l$and.length != lOther$and.length) {
        return false;
      }
      for (int i = 0; i < l$and.length; i++) {
        final l$and$entry = l$and[i];
        final lOther$and$entry = lOther$and[i];
        if (l$and$entry != lOther$and$entry) {
          return false;
        }
      }
    } else if (l$and != lOther$and) {
      return false;
    }
    final l$or = or;
    final lOther$or = other.or;
    if (_$data.containsKey('or') != other._$data.containsKey('or')) {
      return false;
    }
    if (l$or != null && lOther$or != null) {
      if (l$or.length != lOther$or.length) {
        return false;
      }
      for (int i = 0; i < l$or.length; i++) {
        final l$or$entry = l$or[i];
        final lOther$or$entry = lOther$or[i];
        if (l$or$entry != lOther$or$entry) {
          return false;
        }
      }
    } else if (l$or != lOther$or) {
      return false;
    }
    final l$not = not;
    final lOther$not = other.not;
    if (_$data.containsKey('not') != other._$data.containsKey('not')) {
      return false;
    }
    if (l$not != lOther$not) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$content = content;
    final l$title = title;
    final l$author_image_url = author_image_url;
    final l$nodeId = nodeId;
    final l$and = and;
    final l$or = or;
    final l$not = not;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('content') ? l$content : const {},
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('author_image_url') ? l$author_image_url : const {},
      _$data.containsKey('nodeId') ? l$nodeId : const {},
      _$data.containsKey('and')
          ? l$and == null
                ? null
                : Object.hashAll(l$and.map((v) => v))
          : const {},
      _$data.containsKey('or')
          ? l$or == null
                ? null
                : Object.hashAll(l$or.map((v) => v))
          : const {},
      _$data.containsKey('not') ? l$not : const {},
    ]);
  }
}

class InputpostsInsertInput {
  factory InputpostsInsertInput({
    String? id,
    String? content,
    String? title,
    String? author_image_url,
  }) => InputpostsInsertInput._({
    if (id != null) r'id': id,
    if (content != null) r'content': content,
    if (title != null) r'title': title,
    if (author_image_url != null) r'author_image_url': author_image_url,
  });

  InputpostsInsertInput._(this._$data);

  factory InputpostsInsertInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('content')) {
      final l$content = data['content'];
      result$data['content'] = (l$content as String?);
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('author_image_url')) {
      final l$author_image_url = data['author_image_url'];
      result$data['author_image_url'] = (l$author_image_url as String?);
    }
    return InputpostsInsertInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get content => (_$data['content'] as String?);

  String? get title => (_$data['title'] as String?);

  String? get author_image_url => (_$data['author_image_url'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('content')) {
      final l$content = content;
      result$data['content'] = l$content;
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('author_image_url')) {
      final l$author_image_url = author_image_url;
      result$data['author_image_url'] = l$author_image_url;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputpostsInsertInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (_$data.containsKey('content') != other._$data.containsKey('content')) {
      return false;
    }
    if (l$content != lOther$content) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$author_image_url = author_image_url;
    final lOther$author_image_url = other.author_image_url;
    if (_$data.containsKey('author_image_url') != other._$data.containsKey('author_image_url')) {
      return false;
    }
    if (l$author_image_url != lOther$author_image_url) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$content = content;
    final l$title = title;
    final l$author_image_url = author_image_url;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('content') ? l$content : const {},
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('author_image_url') ? l$author_image_url : const {},
    ]);
  }
}

class InputpostsOrderBy {
  factory InputpostsOrderBy({
    EnumOrderByDirection? id,
    EnumOrderByDirection? content,
    EnumOrderByDirection? title,
    EnumOrderByDirection? author_image_url,
  }) => InputpostsOrderBy._({
    if (id != null) r'id': id,
    if (content != null) r'content': content,
    if (title != null) r'title': title,
    if (author_image_url != null) r'author_image_url': author_image_url,
  });

  InputpostsOrderBy._(this._$data);

  factory InputpostsOrderBy.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = l$id == null ? null : fromJsonEnumOrderByDirection((l$id as String));
    }
    if (data.containsKey('content')) {
      final l$content = data['content'];
      result$data['content'] = l$content == null
          ? null
          : fromJsonEnumOrderByDirection((l$content as String));
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = l$title == null
          ? null
          : fromJsonEnumOrderByDirection((l$title as String));
    }
    if (data.containsKey('author_image_url')) {
      final l$author_image_url = data['author_image_url'];
      result$data['author_image_url'] = l$author_image_url == null
          ? null
          : fromJsonEnumOrderByDirection((l$author_image_url as String));
    }
    return InputpostsOrderBy._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumOrderByDirection? get id => (_$data['id'] as EnumOrderByDirection?);

  EnumOrderByDirection? get content => (_$data['content'] as EnumOrderByDirection?);

  EnumOrderByDirection? get title => (_$data['title'] as EnumOrderByDirection?);

  EnumOrderByDirection? get author_image_url =>
      (_$data['author_image_url'] as EnumOrderByDirection?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id == null ? null : toJsonEnumOrderByDirection(l$id);
    }
    if (_$data.containsKey('content')) {
      final l$content = content;
      result$data['content'] = l$content == null ? null : toJsonEnumOrderByDirection(l$content);
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title == null ? null : toJsonEnumOrderByDirection(l$title);
    }
    if (_$data.containsKey('author_image_url')) {
      final l$author_image_url = author_image_url;
      result$data['author_image_url'] = l$author_image_url == null
          ? null
          : toJsonEnumOrderByDirection(l$author_image_url);
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputpostsOrderBy || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (_$data.containsKey('content') != other._$data.containsKey('content')) {
      return false;
    }
    if (l$content != lOther$content) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$author_image_url = author_image_url;
    final lOther$author_image_url = other.author_image_url;
    if (_$data.containsKey('author_image_url') != other._$data.containsKey('author_image_url')) {
      return false;
    }
    if (l$author_image_url != lOther$author_image_url) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$content = content;
    final l$title = title;
    final l$author_image_url = author_image_url;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('content') ? l$content : const {},
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('author_image_url') ? l$author_image_url : const {},
    ]);
  }
}

class InputpostsUpdateInput {
  factory InputpostsUpdateInput({
    String? id,
    String? content,
    String? title,
    String? author_image_url,
  }) => InputpostsUpdateInput._({
    if (id != null) r'id': id,
    if (content != null) r'content': content,
    if (title != null) r'title': title,
    if (author_image_url != null) r'author_image_url': author_image_url,
  });

  InputpostsUpdateInput._(this._$data);

  factory InputpostsUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('content')) {
      final l$content = data['content'];
      result$data['content'] = (l$content as String?);
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('author_image_url')) {
      final l$author_image_url = data['author_image_url'];
      result$data['author_image_url'] = (l$author_image_url as String?);
    }
    return InputpostsUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get content => (_$data['content'] as String?);

  String? get title => (_$data['title'] as String?);

  String? get author_image_url => (_$data['author_image_url'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('content')) {
      final l$content = content;
      result$data['content'] = l$content;
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('author_image_url')) {
      final l$author_image_url = author_image_url;
      result$data['author_image_url'] = l$author_image_url;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputpostsUpdateInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (_$data.containsKey('content') != other._$data.containsKey('content')) {
      return false;
    }
    if (l$content != lOther$content) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$author_image_url = author_image_url;
    final lOther$author_image_url = other.author_image_url;
    if (_$data.containsKey('author_image_url') != other._$data.containsKey('author_image_url')) {
      return false;
    }
    if (l$author_image_url != lOther$author_image_url) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$content = content;
    final l$title = title;
    final l$author_image_url = author_image_url;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('content') ? l$content : const {},
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('author_image_url') ? l$author_image_url : const {},
    ]);
  }
}

class InputStringFilter {
  factory InputStringFilter({
    String? eq,
    String? gt,
    String? gte,
    String? ilike,
    List<String>? $in,
    String? iregex,
    EnumFilterIs? $is,
    String? like,
    String? lt,
    String? lte,
    String? neq,
    String? regex,
    String? startsWith,
  }) => InputStringFilter._({
    if (eq != null) r'eq': eq,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (ilike != null) r'ilike': ilike,
    if ($in != null) r'in': $in,
    if (iregex != null) r'iregex': iregex,
    if ($is != null) r'is': $is,
    if (like != null) r'like': like,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
    if (neq != null) r'neq': neq,
    if (regex != null) r'regex': regex,
    if (startsWith != null) r'startsWith': startsWith,
  });

  InputStringFilter._(this._$data);

  factory InputStringFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('ilike')) {
      final l$ilike = data['ilike'];
      result$data['ilike'] = (l$ilike as String?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('iregex')) {
      final l$iregex = data['iregex'];
      result$data['iregex'] = (l$iregex as String?);
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('like')) {
      final l$like = data['like'];
      result$data['like'] = (l$like as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as String?);
    }
    if (data.containsKey('regex')) {
      final l$regex = data['regex'];
      result$data['regex'] = (l$regex as String?);
    }
    if (data.containsKey('startsWith')) {
      final l$startsWith = data['startsWith'];
      result$data['startsWith'] = (l$startsWith as String?);
    }
    return InputStringFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get ilike => (_$data['ilike'] as String?);

  List<String>? get $in => (_$data['in'] as List<String>?);

  String? get iregex => (_$data['iregex'] as String?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  String? get like => (_$data['like'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  String? get neq => (_$data['neq'] as String?);

  String? get regex => (_$data['regex'] as String?);

  String? get startsWith => (_$data['startsWith'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('ilike')) {
      final l$ilike = ilike;
      result$data['ilike'] = l$ilike;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('iregex')) {
      final l$iregex = iregex;
      result$data['iregex'] = l$iregex;
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('like')) {
      final l$like = like;
      result$data['like'] = l$like;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    if (_$data.containsKey('regex')) {
      final l$regex = regex;
      result$data['regex'] = l$regex;
    }
    if (_$data.containsKey('startsWith')) {
      final l$startsWith = startsWith;
      result$data['startsWith'] = l$startsWith;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputStringFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$ilike = ilike;
    final lOther$ilike = other.ilike;
    if (_$data.containsKey('ilike') != other._$data.containsKey('ilike')) {
      return false;
    }
    if (l$ilike != lOther$ilike) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$iregex = iregex;
    final lOther$iregex = other.iregex;
    if (_$data.containsKey('iregex') != other._$data.containsKey('iregex')) {
      return false;
    }
    if (l$iregex != lOther$iregex) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$like = like;
    final lOther$like = other.like;
    if (_$data.containsKey('like') != other._$data.containsKey('like')) {
      return false;
    }
    if (l$like != lOther$like) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    final l$regex = regex;
    final lOther$regex = other.regex;
    if (_$data.containsKey('regex') != other._$data.containsKey('regex')) {
      return false;
    }
    if (l$regex != lOther$regex) {
      return false;
    }
    final l$startsWith = startsWith;
    final lOther$startsWith = other.startsWith;
    if (_$data.containsKey('startsWith') != other._$data.containsKey('startsWith')) {
      return false;
    }
    if (l$startsWith != lOther$startsWith) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$gt = gt;
    final l$gte = gte;
    final l$ilike = ilike;
    final l$$in = $in;
    final l$iregex = iregex;
    final l$$is = $is;
    final l$like = like;
    final l$lt = lt;
    final l$lte = lte;
    final l$neq = neq;
    final l$regex = regex;
    final l$startsWith = startsWith;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('ilike') ? l$ilike : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('iregex') ? l$iregex : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('like') ? l$like : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
      _$data.containsKey('neq') ? l$neq : const {},
      _$data.containsKey('regex') ? l$regex : const {},
      _$data.containsKey('startsWith') ? l$startsWith : const {},
    ]);
  }
}

class InputStringListFilter {
  factory InputStringListFilter({
    List<String>? containedBy,
    List<String>? contains,
    List<String>? eq,
    EnumFilterIs? $is,
    List<String>? overlaps,
  }) => InputStringListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputStringListFilter._(this._$data);

  factory InputStringListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return InputStringListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get containedBy => (_$data['containedBy'] as List<String>?);

  List<String>? get contains => (_$data['contains'] as List<String>?);

  List<String>? get eq => (_$data['eq'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<String>? get overlaps => (_$data['overlaps'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputStringListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

class InputTimeFilter {
  factory InputTimeFilter({
    String? eq,
    String? gt,
    String? gte,
    List<String>? $in,
    EnumFilterIs? $is,
    String? lt,
    String? lte,
    String? neq,
  }) => InputTimeFilter._({
    if (eq != null) r'eq': eq,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if ($in != null) r'in': $in,
    if ($is != null) r'is': $is,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
    if (neq != null) r'neq': neq,
  });

  InputTimeFilter._(this._$data);

  factory InputTimeFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as String?);
    }
    return InputTimeFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  List<String>? get $in => (_$data['in'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  String? get neq => (_$data['neq'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputTimeFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$gt = gt;
    final l$gte = gte;
    final l$$in = $in;
    final l$$is = $is;
    final l$lt = lt;
    final l$lte = lte;
    final l$neq = neq;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
      _$data.containsKey('neq') ? l$neq : const {},
    ]);
  }
}

class InputTimeListFilter {
  factory InputTimeListFilter({
    List<String>? containedBy,
    List<String>? contains,
    List<String>? eq,
    EnumFilterIs? $is,
    List<String>? overlaps,
  }) => InputTimeListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputTimeListFilter._(this._$data);

  factory InputTimeListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return InputTimeListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get containedBy => (_$data['containedBy'] as List<String>?);

  List<String>? get contains => (_$data['contains'] as List<String>?);

  List<String>? get eq => (_$data['eq'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<String>? get overlaps => (_$data['overlaps'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputTimeListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

class InputUUIDFilter {
  factory InputUUIDFilter({String? eq, List<String>? $in, EnumFilterIs? $is, String? neq}) =>
      InputUUIDFilter._({
        if (eq != null) r'eq': eq,
        if ($in != null) r'in': $in,
        if ($is != null) r'is': $is,
        if (neq != null) r'neq': neq,
      });

  InputUUIDFilter._(this._$data);

  factory InputUUIDFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] = (l$$in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as String?);
    }
    return InputUUIDFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);

  List<String>? get $in => (_$data['in'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  String? get neq => (_$data['neq'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputUUIDFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$$in = $in;
    final l$$is = $is;
    final l$neq = neq;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('in')
          ? l$$in == null
                ? null
                : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('neq') ? l$neq : const {},
    ]);
  }
}

class InputUUIDListFilter {
  factory InputUUIDListFilter({
    List<String>? containedBy,
    List<String>? contains,
    List<String>? eq,
    EnumFilterIs? $is,
    List<String>? overlaps,
  }) => InputUUIDListFilter._({
    if (containedBy != null) r'containedBy': containedBy,
    if (contains != null) r'contains': contains,
    if (eq != null) r'eq': eq,
    if ($is != null) r'is': $is,
    if (overlaps != null) r'overlaps': overlaps,
  });

  InputUUIDListFilter._(this._$data);

  factory InputUUIDListFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('containedBy')) {
      final l$containedBy = data['containedBy'];
      result$data['containedBy'] = (l$containedBy as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('is')) {
      final l$$is = data['is'];
      result$data['is'] = l$$is == null ? null : fromJsonEnumFilterIs((l$$is as String));
    }
    if (data.containsKey('overlaps')) {
      final l$overlaps = data['overlaps'];
      result$data['overlaps'] = (l$overlaps as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return InputUUIDListFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get containedBy => (_$data['containedBy'] as List<String>?);

  List<String>? get contains => (_$data['contains'] as List<String>?);

  List<String>? get eq => (_$data['eq'] as List<String>?);

  EnumFilterIs? get $is => (_$data['is'] as EnumFilterIs?);

  List<String>? get overlaps => (_$data['overlaps'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('containedBy')) {
      final l$containedBy = containedBy;
      result$data['containedBy'] = l$containedBy?.map((e) => e).toList();
    }
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains?.map((e) => e).toList();
    }
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq?.map((e) => e).toList();
    }
    if (_$data.containsKey('is')) {
      final l$$is = $is;
      result$data['is'] = l$$is == null ? null : toJsonEnumFilterIs(l$$is);
    }
    if (_$data.containsKey('overlaps')) {
      final l$overlaps = overlaps;
      result$data['overlaps'] = l$overlaps?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputUUIDListFilter || runtimeType != other.runtimeType) {
      return false;
    }
    final l$containedBy = containedBy;
    final lOther$containedBy = other.containedBy;
    if (_$data.containsKey('containedBy') != other._$data.containsKey('containedBy')) {
      return false;
    }
    if (l$containedBy != null && lOther$containedBy != null) {
      if (l$containedBy.length != lOther$containedBy.length) {
        return false;
      }
      for (int i = 0; i < l$containedBy.length; i++) {
        final l$containedBy$entry = l$containedBy[i];
        final lOther$containedBy$entry = lOther$containedBy[i];
        if (l$containedBy$entry != lOther$containedBy$entry) {
          return false;
        }
      }
    } else if (l$containedBy != lOther$containedBy) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') != other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != null && lOther$contains != null) {
      if (l$contains.length != lOther$contains.length) {
        return false;
      }
      for (int i = 0; i < l$contains.length; i++) {
        final l$contains$entry = l$contains[i];
        final lOther$contains$entry = lOther$contains[i];
        if (l$contains$entry != lOther$contains$entry) {
          return false;
        }
      }
    } else if (l$contains != lOther$contains) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != null && lOther$eq != null) {
      if (l$eq.length != lOther$eq.length) {
        return false;
      }
      for (int i = 0; i < l$eq.length; i++) {
        final l$eq$entry = l$eq[i];
        final lOther$eq$entry = lOther$eq[i];
        if (l$eq$entry != lOther$eq$entry) {
          return false;
        }
      }
    } else if (l$eq != lOther$eq) {
      return false;
    }
    final l$$is = $is;
    final lOther$$is = other.$is;
    if (_$data.containsKey('is') != other._$data.containsKey('is')) {
      return false;
    }
    if (l$$is != lOther$$is) {
      return false;
    }
    final l$overlaps = overlaps;
    final lOther$overlaps = other.overlaps;
    if (_$data.containsKey('overlaps') != other._$data.containsKey('overlaps')) {
      return false;
    }
    if (l$overlaps != null && lOther$overlaps != null) {
      if (l$overlaps.length != lOther$overlaps.length) {
        return false;
      }
      for (int i = 0; i < l$overlaps.length; i++) {
        final l$overlaps$entry = l$overlaps[i];
        final lOther$overlaps$entry = lOther$overlaps[i];
        if (l$overlaps$entry != lOther$overlaps$entry) {
          return false;
        }
      }
    } else if (l$overlaps != lOther$overlaps) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$containedBy = containedBy;
    final l$contains = contains;
    final l$eq = eq;
    final l$$is = $is;
    final l$overlaps = overlaps;
    return Object.hashAll([
      _$data.containsKey('containedBy')
          ? l$containedBy == null
                ? null
                : Object.hashAll(l$containedBy.map((v) => v))
          : const {},
      _$data.containsKey('contains')
          ? l$contains == null
                ? null
                : Object.hashAll(l$contains.map((v) => v))
          : const {},
      _$data.containsKey('eq')
          ? l$eq == null
                ? null
                : Object.hashAll(l$eq.map((v) => v))
          : const {},
      _$data.containsKey('is') ? l$$is : const {},
      _$data.containsKey('overlaps')
          ? l$overlaps == null
                ? null
                : Object.hashAll(l$overlaps.map((v) => v))
          : const {},
    ]);
  }
}

enum EnumFilterIs {
  NULL,
  NOT_NULL,
  $unknown;

  factory EnumFilterIs.fromJson(String value) => fromJsonEnumFilterIs(value);

  String toJson() => toJsonEnumFilterIs(this);
}

String toJsonEnumFilterIs(EnumFilterIs e) {
  switch (e) {
    case EnumFilterIs.NULL:
      return r'NULL';
    case EnumFilterIs.NOT_NULL:
      return r'NOT_NULL';
    case EnumFilterIs.$unknown:
      return r'$unknown';
  }
}

EnumFilterIs fromJsonEnumFilterIs(String value) {
  switch (value) {
    case r'NULL':
      return EnumFilterIs.NULL;
    case r'NOT_NULL':
      return EnumFilterIs.NOT_NULL;
    default:
      return EnumFilterIs.$unknown;
  }
}

enum EnumOrderByDirection {
  AscNullsFirst,
  AscNullsLast,
  DescNullsFirst,
  DescNullsLast,
  $unknown;

  factory EnumOrderByDirection.fromJson(String value) => fromJsonEnumOrderByDirection(value);

  String toJson() => toJsonEnumOrderByDirection(this);
}

String toJsonEnumOrderByDirection(EnumOrderByDirection e) {
  switch (e) {
    case EnumOrderByDirection.AscNullsFirst:
      return r'AscNullsFirst';
    case EnumOrderByDirection.AscNullsLast:
      return r'AscNullsLast';
    case EnumOrderByDirection.DescNullsFirst:
      return r'DescNullsFirst';
    case EnumOrderByDirection.DescNullsLast:
      return r'DescNullsLast';
    case EnumOrderByDirection.$unknown:
      return r'$unknown';
  }
}

EnumOrderByDirection fromJsonEnumOrderByDirection(String value) {
  switch (value) {
    case r'AscNullsFirst':
      return EnumOrderByDirection.AscNullsFirst;
    case r'AscNullsLast':
      return EnumOrderByDirection.AscNullsLast;
    case r'DescNullsFirst':
      return EnumOrderByDirection.DescNullsFirst;
    case r'DescNullsLast':
      return EnumOrderByDirection.DescNullsLast;
    default:
      return EnumOrderByDirection.$unknown;
  }
}

enum Enum__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum__TypeKind.fromJson(String value) => fromJsonEnum__TypeKind(value);

  String toJson() => toJsonEnum__TypeKind(this);
}

String toJsonEnum__TypeKind(Enum__TypeKind e) {
  switch (e) {
    case Enum__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum__TypeKind.UNION:
      return r'UNION';
    case Enum__TypeKind.ENUM:
      return r'ENUM';
    case Enum__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum__TypeKind.LIST:
      return r'LIST';
    case Enum__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum__TypeKind fromJsonEnum__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum__TypeKind.INTERFACE;
    case r'UNION':
      return Enum__TypeKind.UNION;
    case r'ENUM':
      return Enum__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum__TypeKind.LIST;
    case r'NON_NULL':
      return Enum__TypeKind.NON_NULL;
    default:
      return Enum__TypeKind.$unknown;
  }
}

enum Enum__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum__DirectiveLocation.fromJson(String value) => fromJsonEnum__DirectiveLocation(value);

  String toJson() => toJsonEnum__DirectiveLocation(this);
}

String toJsonEnum__DirectiveLocation(Enum__DirectiveLocation e) {
  switch (e) {
    case Enum__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum__DirectiveLocation.UNION:
      return r'UNION';
    case Enum__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum__DirectiveLocation fromJsonEnum__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'Node': {'posts'},
};
