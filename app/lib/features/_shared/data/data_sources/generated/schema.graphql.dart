class InputAppFilterInput {
  factory InputAppFilterInput({String? clientId}) => InputAppFilterInput._({
        if (clientId != null) r'clientId': clientId,
      });

  InputAppFilterInput._(this._$data);

  factory InputAppFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('clientId')) {
      final l$clientId = data['clientId'];
      result$data['clientId'] = (l$clientId as String?);
    }
    return InputAppFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get clientId => (_$data['clientId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('clientId')) {
      final l$clientId = clientId;
      result$data['clientId'] = l$clientId;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputAppFilterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$clientId = clientId;
    final lOther$clientId = other.clientId;
    if (_$data.containsKey('clientId') !=
        other._$data.containsKey('clientId')) {
      return false;
    }
    if (l$clientId != lOther$clientId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$clientId = clientId;
    return Object.hashAll(
        [_$data.containsKey('clientId') ? l$clientId : const {}]);
  }
}

class InputChannelMessagesStatisticsFilterInput {
  factory InputChannelMessagesStatisticsFilterInput({
    DateTime? beginDate,
    String? channel,
    DateTime? finalDate,
  }) =>
      InputChannelMessagesStatisticsFilterInput._({
        if (beginDate != null) r'beginDate': beginDate,
        if (channel != null) r'channel': channel,
        if (finalDate != null) r'finalDate': finalDate,
      });

  InputChannelMessagesStatisticsFilterInput._(this._$data);

  factory InputChannelMessagesStatisticsFilterInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('beginDate')) {
      final l$beginDate = data['beginDate'];
      result$data['beginDate'] =
          l$beginDate == null ? null : DateTime.parse((l$beginDate as String));
    }
    if (data.containsKey('channel')) {
      final l$channel = data['channel'];
      result$data['channel'] = (l$channel as String?);
    }
    if (data.containsKey('finalDate')) {
      final l$finalDate = data['finalDate'];
      result$data['finalDate'] =
          l$finalDate == null ? null : DateTime.parse((l$finalDate as String));
    }
    return InputChannelMessagesStatisticsFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get beginDate => (_$data['beginDate'] as DateTime?);

  String? get channel => (_$data['channel'] as String?);

  DateTime? get finalDate => (_$data['finalDate'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('beginDate')) {
      final l$beginDate = beginDate;
      result$data['beginDate'] = l$beginDate?.toIso8601String();
    }
    if (_$data.containsKey('channel')) {
      final l$channel = channel;
      result$data['channel'] = l$channel;
    }
    if (_$data.containsKey('finalDate')) {
      final l$finalDate = finalDate;
      result$data['finalDate'] = l$finalDate?.toIso8601String();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputChannelMessagesStatisticsFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$beginDate = beginDate;
    final lOther$beginDate = other.beginDate;
    if (_$data.containsKey('beginDate') !=
        other._$data.containsKey('beginDate')) {
      return false;
    }
    if (l$beginDate != lOther$beginDate) {
      return false;
    }
    final l$channel = channel;
    final lOther$channel = other.channel;
    if (_$data.containsKey('channel') != other._$data.containsKey('channel')) {
      return false;
    }
    if (l$channel != lOther$channel) {
      return false;
    }
    final l$finalDate = finalDate;
    final lOther$finalDate = other.finalDate;
    if (_$data.containsKey('finalDate') !=
        other._$data.containsKey('finalDate')) {
      return false;
    }
    if (l$finalDate != lOther$finalDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$beginDate = beginDate;
    final l$channel = channel;
    final l$finalDate = finalDate;
    return Object.hashAll([
      _$data.containsKey('beginDate') ? l$beginDate : const {},
      _$data.containsKey('channel') ? l$channel : const {},
      _$data.containsKey('finalDate') ? l$finalDate : const {},
    ]);
  }
}

class InputUserBiasedMessagesFilterInput {
  factory InputUserBiasedMessagesFilterInput({
    DateTime? beginDate,
    String? channel,
    DateTime? finalDate,
    required String userName,
  }) =>
      InputUserBiasedMessagesFilterInput._({
        if (beginDate != null) r'beginDate': beginDate,
        if (channel != null) r'channel': channel,
        if (finalDate != null) r'finalDate': finalDate,
        r'userName': userName,
      });

  InputUserBiasedMessagesFilterInput._(this._$data);

  factory InputUserBiasedMessagesFilterInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('beginDate')) {
      final l$beginDate = data['beginDate'];
      result$data['beginDate'] =
          l$beginDate == null ? null : DateTime.parse((l$beginDate as String));
    }
    if (data.containsKey('channel')) {
      final l$channel = data['channel'];
      result$data['channel'] = (l$channel as String?);
    }
    if (data.containsKey('finalDate')) {
      final l$finalDate = data['finalDate'];
      result$data['finalDate'] =
          l$finalDate == null ? null : DateTime.parse((l$finalDate as String));
    }
    final l$userName = data['userName'];
    result$data['userName'] = (l$userName as String);
    return InputUserBiasedMessagesFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get beginDate => (_$data['beginDate'] as DateTime?);

  String? get channel => (_$data['channel'] as String?);

  DateTime? get finalDate => (_$data['finalDate'] as DateTime?);

  String get userName => (_$data['userName'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('beginDate')) {
      final l$beginDate = beginDate;
      result$data['beginDate'] = l$beginDate?.toIso8601String();
    }
    if (_$data.containsKey('channel')) {
      final l$channel = channel;
      result$data['channel'] = l$channel;
    }
    if (_$data.containsKey('finalDate')) {
      final l$finalDate = finalDate;
      result$data['finalDate'] = l$finalDate?.toIso8601String();
    }
    final l$userName = userName;
    result$data['userName'] = l$userName;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputUserBiasedMessagesFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$beginDate = beginDate;
    final lOther$beginDate = other.beginDate;
    if (_$data.containsKey('beginDate') !=
        other._$data.containsKey('beginDate')) {
      return false;
    }
    if (l$beginDate != lOther$beginDate) {
      return false;
    }
    final l$channel = channel;
    final lOther$channel = other.channel;
    if (_$data.containsKey('channel') != other._$data.containsKey('channel')) {
      return false;
    }
    if (l$channel != lOther$channel) {
      return false;
    }
    final l$finalDate = finalDate;
    final lOther$finalDate = other.finalDate;
    if (_$data.containsKey('finalDate') !=
        other._$data.containsKey('finalDate')) {
      return false;
    }
    if (l$finalDate != lOther$finalDate) {
      return false;
    }
    final l$userName = userName;
    final lOther$userName = other.userName;
    if (l$userName != lOther$userName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$beginDate = beginDate;
    final l$channel = channel;
    final l$finalDate = finalDate;
    final l$userName = userName;
    return Object.hashAll([
      _$data.containsKey('beginDate') ? l$beginDate : const {},
      _$data.containsKey('channel') ? l$channel : const {},
      _$data.containsKey('finalDate') ? l$finalDate : const {},
      l$userName,
    ]);
  }
}

class InputUserMessagesStatisticsFilterInput {
  factory InputUserMessagesStatisticsFilterInput({
    DateTime? beginDate,
    String? channel,
    DateTime? finalDate,
    required String userName,
  }) =>
      InputUserMessagesStatisticsFilterInput._({
        if (beginDate != null) r'beginDate': beginDate,
        if (channel != null) r'channel': channel,
        if (finalDate != null) r'finalDate': finalDate,
        r'userName': userName,
      });

  InputUserMessagesStatisticsFilterInput._(this._$data);

  factory InputUserMessagesStatisticsFilterInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('beginDate')) {
      final l$beginDate = data['beginDate'];
      result$data['beginDate'] =
          l$beginDate == null ? null : DateTime.parse((l$beginDate as String));
    }
    if (data.containsKey('channel')) {
      final l$channel = data['channel'];
      result$data['channel'] = (l$channel as String?);
    }
    if (data.containsKey('finalDate')) {
      final l$finalDate = data['finalDate'];
      result$data['finalDate'] =
          l$finalDate == null ? null : DateTime.parse((l$finalDate as String));
    }
    final l$userName = data['userName'];
    result$data['userName'] = (l$userName as String);
    return InputUserMessagesStatisticsFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get beginDate => (_$data['beginDate'] as DateTime?);

  String? get channel => (_$data['channel'] as String?);

  DateTime? get finalDate => (_$data['finalDate'] as DateTime?);

  String get userName => (_$data['userName'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('beginDate')) {
      final l$beginDate = beginDate;
      result$data['beginDate'] = l$beginDate?.toIso8601String();
    }
    if (_$data.containsKey('channel')) {
      final l$channel = channel;
      result$data['channel'] = l$channel;
    }
    if (_$data.containsKey('finalDate')) {
      final l$finalDate = finalDate;
      result$data['finalDate'] = l$finalDate?.toIso8601String();
    }
    final l$userName = userName;
    result$data['userName'] = l$userName;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputUserMessagesStatisticsFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$beginDate = beginDate;
    final lOther$beginDate = other.beginDate;
    if (_$data.containsKey('beginDate') !=
        other._$data.containsKey('beginDate')) {
      return false;
    }
    if (l$beginDate != lOther$beginDate) {
      return false;
    }
    final l$channel = channel;
    final lOther$channel = other.channel;
    if (_$data.containsKey('channel') != other._$data.containsKey('channel')) {
      return false;
    }
    if (l$channel != lOther$channel) {
      return false;
    }
    final l$finalDate = finalDate;
    final lOther$finalDate = other.finalDate;
    if (_$data.containsKey('finalDate') !=
        other._$data.containsKey('finalDate')) {
      return false;
    }
    if (l$finalDate != lOther$finalDate) {
      return false;
    }
    final l$userName = userName;
    final lOther$userName = other.userName;
    if (l$userName != lOther$userName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$beginDate = beginDate;
    final l$channel = channel;
    final l$finalDate = finalDate;
    final l$userName = userName;
    return Object.hashAll([
      _$data.containsKey('beginDate') ? l$beginDate : const {},
      _$data.containsKey('channel') ? l$channel : const {},
      _$data.containsKey('finalDate') ? l$finalDate : const {},
      l$userName,
    ]);
  }
}

class InputTermVersionFilterInput {
  factory InputTermVersionFilterInput({
    InputStringFilterInput? body,
    InputDateTimeFilterInput? createdAt,
    InputStringFilterInput? description,
    InputStringFilterInput? title,
    List<String>? versions,
  }) =>
      InputTermVersionFilterInput._({
        if (body != null) r'body': body,
        if (createdAt != null) r'createdAt': createdAt,
        if (description != null) r'description': description,
        if (title != null) r'title': title,
        if (versions != null) r'versions': versions,
      });

  InputTermVersionFilterInput._(this._$data);

  factory InputTermVersionFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('body')) {
      final l$body = data['body'];
      result$data['body'] = l$body == null
          ? null
          : InputStringFilterInput.fromJson((l$body as Map<String, dynamic>));
    }
    if (data.containsKey('createdAt')) {
      final l$createdAt = data['createdAt'];
      result$data['createdAt'] = l$createdAt == null
          ? null
          : InputDateTimeFilterInput.fromJson(
              (l$createdAt as Map<String, dynamic>));
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = l$description == null
          ? null
          : InputStringFilterInput.fromJson(
              (l$description as Map<String, dynamic>));
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = l$title == null
          ? null
          : InputStringFilterInput.fromJson((l$title as Map<String, dynamic>));
    }
    if (data.containsKey('versions')) {
      final l$versions = data['versions'];
      result$data['versions'] =
          (l$versions as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return InputTermVersionFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  InputStringFilterInput? get body =>
      (_$data['body'] as InputStringFilterInput?);

  InputDateTimeFilterInput? get createdAt =>
      (_$data['createdAt'] as InputDateTimeFilterInput?);

  InputStringFilterInput? get description =>
      (_$data['description'] as InputStringFilterInput?);

  InputStringFilterInput? get title =>
      (_$data['title'] as InputStringFilterInput?);

  List<String>? get versions => (_$data['versions'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('body')) {
      final l$body = body;
      result$data['body'] = l$body?.toJson();
    }
    if (_$data.containsKey('createdAt')) {
      final l$createdAt = createdAt;
      result$data['createdAt'] = l$createdAt?.toJson();
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description?.toJson();
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title?.toJson();
    }
    if (_$data.containsKey('versions')) {
      final l$versions = versions;
      result$data['versions'] = l$versions?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputTermVersionFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (_$data.containsKey('body') != other._$data.containsKey('body')) {
      return false;
    }
    if (l$body != lOther$body) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (_$data.containsKey('createdAt') !=
        other._$data.containsKey('createdAt')) {
      return false;
    }
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
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
    final l$versions = versions;
    final lOther$versions = other.versions;
    if (_$data.containsKey('versions') !=
        other._$data.containsKey('versions')) {
      return false;
    }
    if (l$versions != null && lOther$versions != null) {
      if (l$versions.length != lOther$versions.length) {
        return false;
      }
      for (int i = 0; i < l$versions.length; i++) {
        final l$versions$entry = l$versions[i];
        final lOther$versions$entry = lOther$versions[i];
        if (l$versions$entry != lOther$versions$entry) {
          return false;
        }
      }
    } else if (l$versions != lOther$versions) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$body = body;
    final l$createdAt = createdAt;
    final l$description = description;
    final l$title = title;
    final l$versions = versions;
    return Object.hashAll([
      _$data.containsKey('body') ? l$body : const {},
      _$data.containsKey('createdAt') ? l$createdAt : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('versions')
          ? l$versions == null
              ? null
              : Object.hashAll(l$versions.map((v) => v))
          : const {},
    ]);
  }
}

class InputStringFilterInput {
  factory InputStringFilterInput({
    String? contains,
    String? endsWith,
    String? equals,
    String? startsWith,
  }) =>
      InputStringFilterInput._({
        if (contains != null) r'contains': contains,
        if (endsWith != null) r'endsWith': endsWith,
        if (equals != null) r'equals': equals,
        if (startsWith != null) r'startsWith': startsWith,
      });

  InputStringFilterInput._(this._$data);

  factory InputStringFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as String?);
    }
    if (data.containsKey('endsWith')) {
      final l$endsWith = data['endsWith'];
      result$data['endsWith'] = (l$endsWith as String?);
    }
    if (data.containsKey('equals')) {
      final l$equals = data['equals'];
      result$data['equals'] = (l$equals as String?);
    }
    if (data.containsKey('startsWith')) {
      final l$startsWith = data['startsWith'];
      result$data['startsWith'] = (l$startsWith as String?);
    }
    return InputStringFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get contains => (_$data['contains'] as String?);

  String? get endsWith => (_$data['endsWith'] as String?);

  String? get equals => (_$data['equals'] as String?);

  String? get startsWith => (_$data['startsWith'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains;
    }
    if (_$data.containsKey('endsWith')) {
      final l$endsWith = endsWith;
      result$data['endsWith'] = l$endsWith;
    }
    if (_$data.containsKey('equals')) {
      final l$equals = equals;
      result$data['equals'] = l$equals;
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
    if (other is! InputStringFilterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') !=
        other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != lOther$contains) {
      return false;
    }
    final l$endsWith = endsWith;
    final lOther$endsWith = other.endsWith;
    if (_$data.containsKey('endsWith') !=
        other._$data.containsKey('endsWith')) {
      return false;
    }
    if (l$endsWith != lOther$endsWith) {
      return false;
    }
    final l$equals = equals;
    final lOther$equals = other.equals;
    if (_$data.containsKey('equals') != other._$data.containsKey('equals')) {
      return false;
    }
    if (l$equals != lOther$equals) {
      return false;
    }
    final l$startsWith = startsWith;
    final lOther$startsWith = other.startsWith;
    if (_$data.containsKey('startsWith') !=
        other._$data.containsKey('startsWith')) {
      return false;
    }
    if (l$startsWith != lOther$startsWith) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$contains = contains;
    final l$endsWith = endsWith;
    final l$equals = equals;
    final l$startsWith = startsWith;
    return Object.hashAll([
      _$data.containsKey('contains') ? l$contains : const {},
      _$data.containsKey('endsWith') ? l$endsWith : const {},
      _$data.containsKey('equals') ? l$equals : const {},
      _$data.containsKey('startsWith') ? l$startsWith : const {},
    ]);
  }
}

class InputDateTimeFilterInput {
  factory InputDateTimeFilterInput({
    InputDateTimeRangeFilterInput? between,
    DateTime? equals,
    DateTime? greaterThan,
    DateTime? greaterThanOrEqual,
    DateTime? lessThan,
    DateTime? lessThanOrEqual,
  }) =>
      InputDateTimeFilterInput._({
        if (between != null) r'between': between,
        if (equals != null) r'equals': equals,
        if (greaterThan != null) r'greaterThan': greaterThan,
        if (greaterThanOrEqual != null)
          r'greaterThanOrEqual': greaterThanOrEqual,
        if (lessThan != null) r'lessThan': lessThan,
        if (lessThanOrEqual != null) r'lessThanOrEqual': lessThanOrEqual,
      });

  InputDateTimeFilterInput._(this._$data);

  factory InputDateTimeFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = l$between == null
          ? null
          : InputDateTimeRangeFilterInput.fromJson(
              (l$between as Map<String, dynamic>));
    }
    if (data.containsKey('equals')) {
      final l$equals = data['equals'];
      result$data['equals'] =
          l$equals == null ? null : DateTime.parse((l$equals as String));
    }
    if (data.containsKey('greaterThan')) {
      final l$greaterThan = data['greaterThan'];
      result$data['greaterThan'] = l$greaterThan == null
          ? null
          : DateTime.parse((l$greaterThan as String));
    }
    if (data.containsKey('greaterThanOrEqual')) {
      final l$greaterThanOrEqual = data['greaterThanOrEqual'];
      result$data['greaterThanOrEqual'] = l$greaterThanOrEqual == null
          ? null
          : DateTime.parse((l$greaterThanOrEqual as String));
    }
    if (data.containsKey('lessThan')) {
      final l$lessThan = data['lessThan'];
      result$data['lessThan'] =
          l$lessThan == null ? null : DateTime.parse((l$lessThan as String));
    }
    if (data.containsKey('lessThanOrEqual')) {
      final l$lessThanOrEqual = data['lessThanOrEqual'];
      result$data['lessThanOrEqual'] = l$lessThanOrEqual == null
          ? null
          : DateTime.parse((l$lessThanOrEqual as String));
    }
    return InputDateTimeFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  InputDateTimeRangeFilterInput? get between =>
      (_$data['between'] as InputDateTimeRangeFilterInput?);

  DateTime? get equals => (_$data['equals'] as DateTime?);

  DateTime? get greaterThan => (_$data['greaterThan'] as DateTime?);

  DateTime? get greaterThanOrEqual =>
      (_$data['greaterThanOrEqual'] as DateTime?);

  DateTime? get lessThan => (_$data['lessThan'] as DateTime?);

  DateTime? get lessThanOrEqual => (_$data['lessThanOrEqual'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between?.toJson();
    }
    if (_$data.containsKey('equals')) {
      final l$equals = equals;
      result$data['equals'] = l$equals?.toIso8601String();
    }
    if (_$data.containsKey('greaterThan')) {
      final l$greaterThan = greaterThan;
      result$data['greaterThan'] = l$greaterThan?.toIso8601String();
    }
    if (_$data.containsKey('greaterThanOrEqual')) {
      final l$greaterThanOrEqual = greaterThanOrEqual;
      result$data['greaterThanOrEqual'] =
          l$greaterThanOrEqual?.toIso8601String();
    }
    if (_$data.containsKey('lessThan')) {
      final l$lessThan = lessThan;
      result$data['lessThan'] = l$lessThan?.toIso8601String();
    }
    if (_$data.containsKey('lessThanOrEqual')) {
      final l$lessThanOrEqual = lessThanOrEqual;
      result$data['lessThanOrEqual'] = l$lessThanOrEqual?.toIso8601String();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputDateTimeFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$equals = equals;
    final lOther$equals = other.equals;
    if (_$data.containsKey('equals') != other._$data.containsKey('equals')) {
      return false;
    }
    if (l$equals != lOther$equals) {
      return false;
    }
    final l$greaterThan = greaterThan;
    final lOther$greaterThan = other.greaterThan;
    if (_$data.containsKey('greaterThan') !=
        other._$data.containsKey('greaterThan')) {
      return false;
    }
    if (l$greaterThan != lOther$greaterThan) {
      return false;
    }
    final l$greaterThanOrEqual = greaterThanOrEqual;
    final lOther$greaterThanOrEqual = other.greaterThanOrEqual;
    if (_$data.containsKey('greaterThanOrEqual') !=
        other._$data.containsKey('greaterThanOrEqual')) {
      return false;
    }
    if (l$greaterThanOrEqual != lOther$greaterThanOrEqual) {
      return false;
    }
    final l$lessThan = lessThan;
    final lOther$lessThan = other.lessThan;
    if (_$data.containsKey('lessThan') !=
        other._$data.containsKey('lessThan')) {
      return false;
    }
    if (l$lessThan != lOther$lessThan) {
      return false;
    }
    final l$lessThanOrEqual = lessThanOrEqual;
    final lOther$lessThanOrEqual = other.lessThanOrEqual;
    if (_$data.containsKey('lessThanOrEqual') !=
        other._$data.containsKey('lessThanOrEqual')) {
      return false;
    }
    if (l$lessThanOrEqual != lOther$lessThanOrEqual) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$equals = equals;
    final l$greaterThan = greaterThan;
    final l$greaterThanOrEqual = greaterThanOrEqual;
    final l$lessThan = lessThan;
    final l$lessThanOrEqual = lessThanOrEqual;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('equals') ? l$equals : const {},
      _$data.containsKey('greaterThan') ? l$greaterThan : const {},
      _$data.containsKey('greaterThanOrEqual')
          ? l$greaterThanOrEqual
          : const {},
      _$data.containsKey('lessThan') ? l$lessThan : const {},
      _$data.containsKey('lessThanOrEqual') ? l$lessThanOrEqual : const {},
    ]);
  }
}

class InputDateTimeRangeFilterInput {
  factory InputDateTimeRangeFilterInput({
    DateTime? end,
    DateTime? start,
  }) =>
      InputDateTimeRangeFilterInput._({
        if (end != null) r'end': end,
        if (start != null) r'start': start,
      });

  InputDateTimeRangeFilterInput._(this._$data);

  factory InputDateTimeRangeFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('end')) {
      final l$end = data['end'];
      result$data['end'] =
          l$end == null ? null : DateTime.parse((l$end as String));
    }
    if (data.containsKey('start')) {
      final l$start = data['start'];
      result$data['start'] =
          l$start == null ? null : DateTime.parse((l$start as String));
    }
    return InputDateTimeRangeFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get end => (_$data['end'] as DateTime?);

  DateTime? get start => (_$data['start'] as DateTime?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('end')) {
      final l$end = end;
      result$data['end'] = l$end?.toIso8601String();
    }
    if (_$data.containsKey('start')) {
      final l$start = start;
      result$data['start'] = l$start?.toIso8601String();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputDateTimeRangeFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$end = end;
    final lOther$end = other.end;
    if (_$data.containsKey('end') != other._$data.containsKey('end')) {
      return false;
    }
    if (l$end != lOther$end) {
      return false;
    }
    final l$start = start;
    final lOther$start = other.start;
    if (_$data.containsKey('start') != other._$data.containsKey('start')) {
      return false;
    }
    if (l$start != lOther$start) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$end = end;
    final l$start = start;
    return Object.hashAll([
      _$data.containsKey('end') ? l$end : const {},
      _$data.containsKey('start') ? l$start : const {},
    ]);
  }
}

class InputTermVersionOrderInput {
  factory InputTermVersionOrderInput({
    required EnumOrderableTermVersionFields field,
    required EnumOrderInput type,
  }) =>
      InputTermVersionOrderInput._({
        r'field': field,
        r'type': type,
      });

  InputTermVersionOrderInput._(this._$data);

  factory InputTermVersionOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$field = data['field'];
    result$data['field'] =
        fromJsonEnumOrderableTermVersionFields((l$field as String));
    final l$type = data['type'];
    result$data['type'] = fromJsonEnumOrderInput((l$type as String));
    return InputTermVersionOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumOrderableTermVersionFields get field =>
      (_$data['field'] as EnumOrderableTermVersionFields);

  EnumOrderInput get type => (_$data['type'] as EnumOrderInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$field = field;
    result$data['field'] = toJsonEnumOrderableTermVersionFields(l$field);
    final l$type = type;
    result$data['type'] = toJsonEnumOrderInput(l$type);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputTermVersionOrderInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$field = field;
    final l$type = type;
    return Object.hashAll([
      l$field,
      l$type,
    ]);
  }
}

class InputUserOrganizationEdgeFilterInput {
  factory InputUserOrganizationEdgeFilterInput(
          {EnumUserOrganizationEdgeStatus? userOrganizationEdgeStatus}) =>
      InputUserOrganizationEdgeFilterInput._({
        if (userOrganizationEdgeStatus != null)
          r'userOrganizationEdgeStatus': userOrganizationEdgeStatus,
      });

  InputUserOrganizationEdgeFilterInput._(this._$data);

  factory InputUserOrganizationEdgeFilterInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('userOrganizationEdgeStatus')) {
      final l$userOrganizationEdgeStatus = data['userOrganizationEdgeStatus'];
      result$data['userOrganizationEdgeStatus'] =
          l$userOrganizationEdgeStatus == null
              ? null
              : fromJsonEnumUserOrganizationEdgeStatus(
                  (l$userOrganizationEdgeStatus as String));
    }
    return InputUserOrganizationEdgeFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumUserOrganizationEdgeStatus? get userOrganizationEdgeStatus =>
      (_$data['userOrganizationEdgeStatus'] as EnumUserOrganizationEdgeStatus?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('userOrganizationEdgeStatus')) {
      final l$userOrganizationEdgeStatus = userOrganizationEdgeStatus;
      result$data['userOrganizationEdgeStatus'] =
          l$userOrganizationEdgeStatus == null
              ? null
              : toJsonEnumUserOrganizationEdgeStatus(
                  l$userOrganizationEdgeStatus);
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputUserOrganizationEdgeFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userOrganizationEdgeStatus = userOrganizationEdgeStatus;
    final lOther$userOrganizationEdgeStatus = other.userOrganizationEdgeStatus;
    if (_$data.containsKey('userOrganizationEdgeStatus') !=
        other._$data.containsKey('userOrganizationEdgeStatus')) {
      return false;
    }
    if (l$userOrganizationEdgeStatus != lOther$userOrganizationEdgeStatus) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userOrganizationEdgeStatus = userOrganizationEdgeStatus;
    return Object.hashAll([
      _$data.containsKey('userOrganizationEdgeStatus')
          ? l$userOrganizationEdgeStatus
          : const {}
    ]);
  }
}

class InputOrganizationFilterInput {
  factory InputOrganizationFilterInput({
    InputStringFilterInput? corporateTaxpayerRegistry,
    InputStringFilterInput? email,
    InputStringFilterInput? name,
    EnumOrganizationStatus? status,
    List<String>? tags,
    InputStringFilterInput? tradingName,
  }) =>
      InputOrganizationFilterInput._({
        if (corporateTaxpayerRegistry != null)
          r'corporateTaxpayerRegistry': corporateTaxpayerRegistry,
        if (email != null) r'email': email,
        if (name != null) r'name': name,
        if (status != null) r'status': status,
        if (tags != null) r'tags': tags,
        if (tradingName != null) r'tradingName': tradingName,
      });

  InputOrganizationFilterInput._(this._$data);

  factory InputOrganizationFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('corporateTaxpayerRegistry')) {
      final l$corporateTaxpayerRegistry = data['corporateTaxpayerRegistry'];
      result$data['corporateTaxpayerRegistry'] =
          l$corporateTaxpayerRegistry == null
              ? null
              : InputStringFilterInput.fromJson(
                  (l$corporateTaxpayerRegistry as Map<String, dynamic>));
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = l$email == null
          ? null
          : InputStringFilterInput.fromJson((l$email as Map<String, dynamic>));
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = l$name == null
          ? null
          : InputStringFilterInput.fromJson((l$name as Map<String, dynamic>));
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJsonEnumOrganizationStatus((l$status as String));
    }
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] =
          (l$tags as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('tradingName')) {
      final l$tradingName = data['tradingName'];
      result$data['tradingName'] = l$tradingName == null
          ? null
          : InputStringFilterInput.fromJson(
              (l$tradingName as Map<String, dynamic>));
    }
    return InputOrganizationFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  InputStringFilterInput? get corporateTaxpayerRegistry =>
      (_$data['corporateTaxpayerRegistry'] as InputStringFilterInput?);

  InputStringFilterInput? get email =>
      (_$data['email'] as InputStringFilterInput?);

  InputStringFilterInput? get name =>
      (_$data['name'] as InputStringFilterInput?);

  EnumOrganizationStatus? get status =>
      (_$data['status'] as EnumOrganizationStatus?);

  List<String>? get tags => (_$data['tags'] as List<String>?);

  InputStringFilterInput? get tradingName =>
      (_$data['tradingName'] as InputStringFilterInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('corporateTaxpayerRegistry')) {
      final l$corporateTaxpayerRegistry = corporateTaxpayerRegistry;
      result$data['corporateTaxpayerRegistry'] =
          l$corporateTaxpayerRegistry?.toJson();
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email?.toJson();
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name?.toJson();
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] =
          l$status == null ? null : toJsonEnumOrganizationStatus(l$status);
    }
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    if (_$data.containsKey('tradingName')) {
      final l$tradingName = tradingName;
      result$data['tradingName'] = l$tradingName?.toJson();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputOrganizationFilterInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$corporateTaxpayerRegistry = corporateTaxpayerRegistry;
    final lOther$corporateTaxpayerRegistry = other.corporateTaxpayerRegistry;
    if (_$data.containsKey('corporateTaxpayerRegistry') !=
        other._$data.containsKey('corporateTaxpayerRegistry')) {
      return false;
    }
    if (l$corporateTaxpayerRegistry != lOther$corporateTaxpayerRegistry) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
    if (l$tags != null && lOther$tags != null) {
      if (l$tags.length != lOther$tags.length) {
        return false;
      }
      for (int i = 0; i < l$tags.length; i++) {
        final l$tags$entry = l$tags[i];
        final lOther$tags$entry = lOther$tags[i];
        if (l$tags$entry != lOther$tags$entry) {
          return false;
        }
      }
    } else if (l$tags != lOther$tags) {
      return false;
    }
    final l$tradingName = tradingName;
    final lOther$tradingName = other.tradingName;
    if (_$data.containsKey('tradingName') !=
        other._$data.containsKey('tradingName')) {
      return false;
    }
    if (l$tradingName != lOther$tradingName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$corporateTaxpayerRegistry = corporateTaxpayerRegistry;
    final l$email = email;
    final l$name = name;
    final l$status = status;
    final l$tags = tags;
    final l$tradingName = tradingName;
    return Object.hashAll([
      _$data.containsKey('corporateTaxpayerRegistry')
          ? l$corporateTaxpayerRegistry
          : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('tags')
          ? l$tags == null
              ? null
              : Object.hashAll(l$tags.map((v) => v))
          : const {},
      _$data.containsKey('tradingName') ? l$tradingName : const {},
    ]);
  }
}

class InputOrganizationOrderInput {
  factory InputOrganizationOrderInput({
    required EnumOrderableOrganizationFields field,
    required EnumOrderInput type,
  }) =>
      InputOrganizationOrderInput._({
        r'field': field,
        r'type': type,
      });

  InputOrganizationOrderInput._(this._$data);

  factory InputOrganizationOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$field = data['field'];
    result$data['field'] =
        fromJsonEnumOrderableOrganizationFields((l$field as String));
    final l$type = data['type'];
    result$data['type'] = fromJsonEnumOrderInput((l$type as String));
    return InputOrganizationOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumOrderableOrganizationFields get field =>
      (_$data['field'] as EnumOrderableOrganizationFields);

  EnumOrderInput get type => (_$data['type'] as EnumOrderInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$field = field;
    result$data['field'] = toJsonEnumOrderableOrganizationFields(l$field);
    final l$type = type;
    result$data['type'] = toJsonEnumOrderInput(l$type);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputOrganizationOrderInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$field = field;
    final l$type = type;
    return Object.hashAll([
      l$field,
      l$type,
    ]);
  }
}

class InputPostFilterInput {
  factory InputPostFilterInput({List<String>? organizations}) =>
      InputPostFilterInput._({
        if (organizations != null) r'organizations': organizations,
      });

  InputPostFilterInput._(this._$data);

  factory InputPostFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('organizations')) {
      final l$organizations = data['organizations'];
      result$data['organizations'] = (l$organizations as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    return InputPostFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get organizations => (_$data['organizations'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('organizations')) {
      final l$organizations = organizations;
      result$data['organizations'] = l$organizations?.map((e) => e).toList();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputPostFilterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$organizations = organizations;
    final lOther$organizations = other.organizations;
    if (_$data.containsKey('organizations') !=
        other._$data.containsKey('organizations')) {
      return false;
    }
    if (l$organizations != null && lOther$organizations != null) {
      if (l$organizations.length != lOther$organizations.length) {
        return false;
      }
      for (int i = 0; i < l$organizations.length; i++) {
        final l$organizations$entry = l$organizations[i];
        final lOther$organizations$entry = lOther$organizations[i];
        if (l$organizations$entry != lOther$organizations$entry) {
          return false;
        }
      }
    } else if (l$organizations != lOther$organizations) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$organizations = organizations;
    return Object.hashAll([
      _$data.containsKey('organizations')
          ? l$organizations == null
              ? null
              : Object.hashAll(l$organizations.map((v) => v))
          : const {}
    ]);
  }
}

class InputTermFilterInput {
  factory InputTermFilterInput({
    InputStringFilterInput? description,
    List<String>? tags,
    InputStringFilterInput? title,
  }) =>
      InputTermFilterInput._({
        if (description != null) r'description': description,
        if (tags != null) r'tags': tags,
        if (title != null) r'title': title,
      });

  InputTermFilterInput._(this._$data);

  factory InputTermFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = l$description == null
          ? null
          : InputStringFilterInput.fromJson(
              (l$description as Map<String, dynamic>));
    }
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] =
          (l$tags as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = l$title == null
          ? null
          : InputStringFilterInput.fromJson((l$title as Map<String, dynamic>));
    }
    return InputTermFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  InputStringFilterInput? get description =>
      (_$data['description'] as InputStringFilterInput?);

  List<String>? get tags => (_$data['tags'] as List<String>?);

  InputStringFilterInput? get title =>
      (_$data['title'] as InputStringFilterInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description?.toJson();
    }
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title?.toJson();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputTermFilterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
    if (l$tags != null && lOther$tags != null) {
      if (l$tags.length != lOther$tags.length) {
        return false;
      }
      for (int i = 0; i < l$tags.length; i++) {
        final l$tags$entry = l$tags[i];
        final lOther$tags$entry = lOther$tags[i];
        if (l$tags$entry != lOther$tags$entry) {
          return false;
        }
      }
    } else if (l$tags != lOther$tags) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$tags = tags;
    final l$title = title;
    return Object.hashAll([
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('tags')
          ? l$tags == null
              ? null
              : Object.hashAll(l$tags.map((v) => v))
          : const {},
      _$data.containsKey('title') ? l$title : const {},
    ]);
  }
}

class InputTermOrderInput {
  factory InputTermOrderInput({
    required EnumOrderableTermFields field,
    required EnumOrderInput type,
  }) =>
      InputTermOrderInput._({
        r'field': field,
        r'type': type,
      });

  InputTermOrderInput._(this._$data);

  factory InputTermOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$field = data['field'];
    result$data['field'] = fromJsonEnumOrderableTermFields((l$field as String));
    final l$type = data['type'];
    result$data['type'] = fromJsonEnumOrderInput((l$type as String));
    return InputTermOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumOrderableTermFields get field =>
      (_$data['field'] as EnumOrderableTermFields);

  EnumOrderInput get type => (_$data['type'] as EnumOrderInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$field = field;
    result$data['field'] = toJsonEnumOrderableTermFields(l$field);
    final l$type = type;
    result$data['type'] = toJsonEnumOrderInput(l$type);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputTermOrderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != lOther$field) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$field = field;
    final l$type = type;
    return Object.hashAll([
      l$field,
      l$type,
    ]);
  }
}

class InputUserFilterInput {
  factory InputUserFilterInput({
    InputStringFilterInput? email,
    InputStringFilterInput? name,
    InputStringFilterInput? username,
  }) =>
      InputUserFilterInput._({
        if (email != null) r'email': email,
        if (name != null) r'name': name,
        if (username != null) r'username': username,
      });

  InputUserFilterInput._(this._$data);

  factory InputUserFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = l$email == null
          ? null
          : InputStringFilterInput.fromJson((l$email as Map<String, dynamic>));
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = l$name == null
          ? null
          : InputStringFilterInput.fromJson((l$name as Map<String, dynamic>));
    }
    if (data.containsKey('username')) {
      final l$username = data['username'];
      result$data['username'] = l$username == null
          ? null
          : InputStringFilterInput.fromJson(
              (l$username as Map<String, dynamic>));
    }
    return InputUserFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  InputStringFilterInput? get email =>
      (_$data['email'] as InputStringFilterInput?);

  InputStringFilterInput? get name =>
      (_$data['name'] as InputStringFilterInput?);

  InputStringFilterInput? get username =>
      (_$data['username'] as InputStringFilterInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email?.toJson();
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name?.toJson();
    }
    if (_$data.containsKey('username')) {
      final l$username = username;
      result$data['username'] = l$username?.toJson();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputUserFilterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (_$data.containsKey('username') !=
        other._$data.containsKey('username')) {
      return false;
    }
    if (l$username != lOther$username) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$name = name;
    final l$username = username;
    return Object.hashAll([
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('username') ? l$username : const {},
    ]);
  }
}

class InputWebhookFilterInput {
  factory InputWebhookFilterInput({
    bool? active,
    List<EnumSubscribableEvents>? events,
    InputStringFilterInput? name,
  }) =>
      InputWebhookFilterInput._({
        if (active != null) r'active': active,
        if (events != null) r'events': events,
        if (name != null) r'name': name,
      });

  InputWebhookFilterInput._(this._$data);

  factory InputWebhookFilterInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('active')) {
      final l$active = data['active'];
      result$data['active'] = (l$active as bool?);
    }
    if (data.containsKey('events')) {
      final l$events = data['events'];
      result$data['events'] = (l$events as List<dynamic>?)
          ?.map((e) => fromJsonEnumSubscribableEvents((e as String)))
          .toList();
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = l$name == null
          ? null
          : InputStringFilterInput.fromJson((l$name as Map<String, dynamic>));
    }
    return InputWebhookFilterInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool? get active => (_$data['active'] as bool?);

  List<EnumSubscribableEvents>? get events =>
      (_$data['events'] as List<EnumSubscribableEvents>?);

  InputStringFilterInput? get name =>
      (_$data['name'] as InputStringFilterInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('active')) {
      final l$active = active;
      result$data['active'] = l$active;
    }
    if (_$data.containsKey('events')) {
      final l$events = events;
      result$data['events'] =
          l$events?.map((e) => toJsonEnumSubscribableEvents(e)).toList();
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name?.toJson();
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputWebhookFilterInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$active = active;
    final lOther$active = other.active;
    if (_$data.containsKey('active') != other._$data.containsKey('active')) {
      return false;
    }
    if (l$active != lOther$active) {
      return false;
    }
    final l$events = events;
    final lOther$events = other.events;
    if (_$data.containsKey('events') != other._$data.containsKey('events')) {
      return false;
    }
    if (l$events != null && lOther$events != null) {
      if (l$events.length != lOther$events.length) {
        return false;
      }
      for (int i = 0; i < l$events.length; i++) {
        final l$events$entry = l$events[i];
        final lOther$events$entry = lOther$events[i];
        if (l$events$entry != lOther$events$entry) {
          return false;
        }
      }
    } else if (l$events != lOther$events) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$active = active;
    final l$events = events;
    final l$name = name;
    return Object.hashAll([
      _$data.containsKey('active') ? l$active : const {},
      _$data.containsKey('events')
          ? l$events == null
              ? null
              : Object.hashAll(l$events.map((v) => v))
          : const {},
      _$data.containsKey('name') ? l$name : const {},
    ]);
  }
}

class InputActivateUserInput {
  factory InputActivateUserInput({required String userId}) =>
      InputActivateUserInput._({
        r'userId': userId,
      });

  InputActivateUserInput._(this._$data);

  factory InputActivateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return InputActivateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputActivateUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }
}

class InputAddOrUpdateUserProfilePictureInput {
  factory InputAddOrUpdateUserProfilePictureInput({
    required String profilePicture,
    String? userId,
  }) =>
      InputAddOrUpdateUserProfilePictureInput._({
        r'profilePicture': profilePicture,
        if (userId != null) r'userId': userId,
      });

  InputAddOrUpdateUserProfilePictureInput._(this._$data);

  factory InputAddOrUpdateUserProfilePictureInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$profilePicture = data['profilePicture'];
    result$data['profilePicture'] = (l$profilePicture as String);
    if (data.containsKey('userId')) {
      final l$userId = data['userId'];
      result$data['userId'] = (l$userId as String?);
    }
    return InputAddOrUpdateUserProfilePictureInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get profilePicture => (_$data['profilePicture'] as String);

  String? get userId => (_$data['userId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$profilePicture = profilePicture;
    result$data['profilePicture'] = l$profilePicture;
    if (_$data.containsKey('userId')) {
      final l$userId = userId;
      result$data['userId'] = l$userId;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputAddOrUpdateUserProfilePictureInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$profilePicture = profilePicture;
    final lOther$profilePicture = other.profilePicture;
    if (l$profilePicture != lOther$profilePicture) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (_$data.containsKey('userId') != other._$data.containsKey('userId')) {
      return false;
    }
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$profilePicture = profilePicture;
    final l$userId = userId;
    return Object.hashAll([
      l$profilePicture,
      _$data.containsKey('userId') ? l$userId : const {},
    ]);
  }
}

class InputAddUserToOrganizationInput {
  factory InputAddUserToOrganizationInput({
    required String organizationId,
    EnumUserOrganizationRole? role,
    required String userId,
  }) =>
      InputAddUserToOrganizationInput._({
        r'organizationId': organizationId,
        if (role != null) r'role': role,
        r'userId': userId,
      });

  InputAddUserToOrganizationInput._(this._$data);

  factory InputAddUserToOrganizationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$organizationId = data['organizationId'];
    result$data['organizationId'] = (l$organizationId as String);
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] =
          fromJsonEnumUserOrganizationRole((l$role as String));
    }
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return InputAddUserToOrganizationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get organizationId => (_$data['organizationId'] as String);

  EnumUserOrganizationRole? get role =>
      (_$data['role'] as EnumUserOrganizationRole?);

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$organizationId = organizationId;
    result$data['organizationId'] = l$organizationId;
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] =
          toJsonEnumUserOrganizationRole((l$role as EnumUserOrganizationRole));
    }
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputAddUserToOrganizationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$organizationId = organizationId;
    final lOther$organizationId = other.organizationId;
    if (l$organizationId != lOther$organizationId) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$organizationId = organizationId;
    final l$role = role;
    final l$userId = userId;
    return Object.hashAll([
      l$organizationId,
      _$data.containsKey('role') ? l$role : const {},
      l$userId,
    ]);
  }
}

class InputAgreeOrDisagreeToTermVersionInput {
  factory InputAgreeOrDisagreeToTermVersionInput({
    required bool agree,
    required String termVersionId,
  }) =>
      InputAgreeOrDisagreeToTermVersionInput._({
        r'agree': agree,
        r'termVersionId': termVersionId,
      });

  InputAgreeOrDisagreeToTermVersionInput._(this._$data);

  factory InputAgreeOrDisagreeToTermVersionInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$agree = data['agree'];
    result$data['agree'] = (l$agree as bool);
    final l$termVersionId = data['termVersionId'];
    result$data['termVersionId'] = (l$termVersionId as String);
    return InputAgreeOrDisagreeToTermVersionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get agree => (_$data['agree'] as bool);

  String get termVersionId => (_$data['termVersionId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$agree = agree;
    result$data['agree'] = l$agree;
    final l$termVersionId = termVersionId;
    result$data['termVersionId'] = l$termVersionId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputAgreeOrDisagreeToTermVersionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$agree = agree;
    final lOther$agree = other.agree;
    if (l$agree != lOther$agree) {
      return false;
    }
    final l$termVersionId = termVersionId;
    final lOther$termVersionId = other.termVersionId;
    if (l$termVersionId != lOther$termVersionId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$agree = agree;
    final l$termVersionId = termVersionId;
    return Object.hashAll([
      l$agree,
      l$termVersionId,
    ]);
  }
}

class InputChangeOrganizationStatusInput {
  factory InputChangeOrganizationStatusInput({
    required String ifMatchesETag,
    required String organizationId,
    required EnumOrganizationStatus status,
  }) =>
      InputChangeOrganizationStatusInput._({
        r'ifMatchesETag': ifMatchesETag,
        r'organizationId': organizationId,
        r'status': status,
      });

  InputChangeOrganizationStatusInput._(this._$data);

  factory InputChangeOrganizationStatusInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$ifMatchesETag = data['ifMatchesETag'];
    result$data['ifMatchesETag'] = (l$ifMatchesETag as String);
    final l$organizationId = data['organizationId'];
    result$data['organizationId'] = (l$organizationId as String);
    final l$status = data['status'];
    result$data['status'] =
        fromJsonEnumOrganizationStatus((l$status as String));
    return InputChangeOrganizationStatusInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get ifMatchesETag => (_$data['ifMatchesETag'] as String);

  String get organizationId => (_$data['organizationId'] as String);

  EnumOrganizationStatus get status =>
      (_$data['status'] as EnumOrganizationStatus);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ifMatchesETag = ifMatchesETag;
    result$data['ifMatchesETag'] = l$ifMatchesETag;
    final l$organizationId = organizationId;
    result$data['organizationId'] = l$organizationId;
    final l$status = status;
    result$data['status'] = toJsonEnumOrganizationStatus(l$status);
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputChangeOrganizationStatusInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ifMatchesETag = ifMatchesETag;
    final lOther$ifMatchesETag = other.ifMatchesETag;
    if (l$ifMatchesETag != lOther$ifMatchesETag) {
      return false;
    }
    final l$organizationId = organizationId;
    final lOther$organizationId = other.organizationId;
    if (l$organizationId != lOther$organizationId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ifMatchesETag = ifMatchesETag;
    final l$organizationId = organizationId;
    final l$status = status;
    return Object.hashAll([
      l$ifMatchesETag,
      l$organizationId,
      l$status,
    ]);
  }
}

class InputChangePasswordInput {
  factory InputChangePasswordInput({
    required String newPassword,
    required String oldPassword,
  }) =>
      InputChangePasswordInput._({
        r'newPassword': newPassword,
        r'oldPassword': oldPassword,
      });

  InputChangePasswordInput._(this._$data);

  factory InputChangePasswordInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$newPassword = data['newPassword'];
    result$data['newPassword'] = (l$newPassword as String);
    final l$oldPassword = data['oldPassword'];
    result$data['oldPassword'] = (l$oldPassword as String);
    return InputChangePasswordInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get newPassword => (_$data['newPassword'] as String);

  String get oldPassword => (_$data['oldPassword'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$newPassword = newPassword;
    result$data['newPassword'] = l$newPassword;
    final l$oldPassword = oldPassword;
    result$data['oldPassword'] = l$oldPassword;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputChangePasswordInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$newPassword = newPassword;
    final lOther$newPassword = other.newPassword;
    if (l$newPassword != lOther$newPassword) {
      return false;
    }
    final l$oldPassword = oldPassword;
    final lOther$oldPassword = other.oldPassword;
    if (l$oldPassword != lOther$oldPassword) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$newPassword = newPassword;
    final l$oldPassword = oldPassword;
    return Object.hashAll([
      l$newPassword,
      l$oldPassword,
    ]);
  }
}

class InputChangeUserOrganizationEdgeStatusInput {
  factory InputChangeUserOrganizationEdgeStatusInput({
    required String organizationId,
    required EnumUserOrganizationEdgeStatus status,
    required String userId,
  }) =>
      InputChangeUserOrganizationEdgeStatusInput._({
        r'organizationId': organizationId,
        r'status': status,
        r'userId': userId,
      });

  InputChangeUserOrganizationEdgeStatusInput._(this._$data);

  factory InputChangeUserOrganizationEdgeStatusInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$organizationId = data['organizationId'];
    result$data['organizationId'] = (l$organizationId as String);
    final l$status = data['status'];
    result$data['status'] =
        fromJsonEnumUserOrganizationEdgeStatus((l$status as String));
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return InputChangeUserOrganizationEdgeStatusInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get organizationId => (_$data['organizationId'] as String);

  EnumUserOrganizationEdgeStatus get status =>
      (_$data['status'] as EnumUserOrganizationEdgeStatus);

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$organizationId = organizationId;
    result$data['organizationId'] = l$organizationId;
    final l$status = status;
    result$data['status'] = toJsonEnumUserOrganizationEdgeStatus(l$status);
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputChangeUserOrganizationEdgeStatusInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$organizationId = organizationId;
    final lOther$organizationId = other.organizationId;
    if (l$organizationId != lOther$organizationId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$organizationId = organizationId;
    final l$status = status;
    final l$userId = userId;
    return Object.hashAll([
      l$organizationId,
      l$status,
      l$userId,
    ]);
  }
}

class InputCreateAppInput {
  factory InputCreateAppInput({
    required String description,
    required bool enabled,
    required String name,
    required List<String> redirectURL,
  }) =>
      InputCreateAppInput._({
        r'description': description,
        r'enabled': enabled,
        r'name': name,
        r'redirectURL': redirectURL,
      });

  InputCreateAppInput._(this._$data);

  factory InputCreateAppInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$description = data['description'];
    result$data['description'] = (l$description as String);
    final l$enabled = data['enabled'];
    result$data['enabled'] = (l$enabled as bool);
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$redirectURL = data['redirectURL'];
    result$data['redirectURL'] =
        (l$redirectURL as List<dynamic>).map((e) => (e as String)).toList();
    return InputCreateAppInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get description => (_$data['description'] as String);

  bool get enabled => (_$data['enabled'] as bool);

  String get name => (_$data['name'] as String);

  List<String> get redirectURL => (_$data['redirectURL'] as List<String>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$description = description;
    result$data['description'] = l$description;
    final l$enabled = enabled;
    result$data['enabled'] = l$enabled;
    final l$name = name;
    result$data['name'] = l$name;
    final l$redirectURL = redirectURL;
    result$data['redirectURL'] = l$redirectURL.map((e) => e).toList();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputCreateAppInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$enabled = enabled;
    final lOther$enabled = other.enabled;
    if (l$enabled != lOther$enabled) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$redirectURL = redirectURL;
    final lOther$redirectURL = other.redirectURL;
    if (l$redirectURL.length != lOther$redirectURL.length) {
      return false;
    }
    for (int i = 0; i < l$redirectURL.length; i++) {
      final l$redirectURL$entry = l$redirectURL[i];
      final lOther$redirectURL$entry = lOther$redirectURL[i];
      if (l$redirectURL$entry != lOther$redirectURL$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$enabled = enabled;
    final l$name = name;
    final l$redirectURL = redirectURL;
    return Object.hashAll([
      l$description,
      l$enabled,
      l$name,
      Object.hashAll(l$redirectURL.map((v) => v)),
    ]);
  }
}

class InputCreateOrganizationInput {
  factory InputCreateOrganizationInput({
    required String corporateTaxpayerRegistry,
    required String description,
    required String email,
    String? logo,
    required String name,
    EnumUserOrganizationRole? role,
    required EnumOrganizationStatus status,
    required List<String> tags,
    required String tradingName,
  }) =>
      InputCreateOrganizationInput._({
        r'corporateTaxpayerRegistry': corporateTaxpayerRegistry,
        r'description': description,
        r'email': email,
        if (logo != null) r'logo': logo,
        r'name': name,
        if (role != null) r'role': role,
        r'status': status,
        r'tags': tags,
        r'tradingName': tradingName,
      });

  InputCreateOrganizationInput._(this._$data);

  factory InputCreateOrganizationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$corporateTaxpayerRegistry = data['corporateTaxpayerRegistry'];
    result$data['corporateTaxpayerRegistry'] =
        (l$corporateTaxpayerRegistry as String);
    final l$description = data['description'];
    result$data['description'] = (l$description as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    if (data.containsKey('logo')) {
      final l$logo = data['logo'];
      result$data['logo'] = (l$logo as String?);
    }
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] =
          fromJsonEnumUserOrganizationRole((l$role as String));
    }
    final l$status = data['status'];
    result$data['status'] =
        fromJsonEnumOrganizationStatus((l$status as String));
    final l$tags = data['tags'];
    result$data['tags'] =
        (l$tags as List<dynamic>).map((e) => (e as String)).toList();
    final l$tradingName = data['tradingName'];
    result$data['tradingName'] = (l$tradingName as String);
    return InputCreateOrganizationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get corporateTaxpayerRegistry =>
      (_$data['corporateTaxpayerRegistry'] as String);

  String get description => (_$data['description'] as String);

  String get email => (_$data['email'] as String);

  String? get logo => (_$data['logo'] as String?);

  String get name => (_$data['name'] as String);

  EnumUserOrganizationRole? get role =>
      (_$data['role'] as EnumUserOrganizationRole?);

  EnumOrganizationStatus get status =>
      (_$data['status'] as EnumOrganizationStatus);

  List<String> get tags => (_$data['tags'] as List<String>);

  String get tradingName => (_$data['tradingName'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$corporateTaxpayerRegistry = corporateTaxpayerRegistry;
    result$data['corporateTaxpayerRegistry'] = l$corporateTaxpayerRegistry;
    final l$description = description;
    result$data['description'] = l$description;
    final l$email = email;
    result$data['email'] = l$email;
    if (_$data.containsKey('logo')) {
      final l$logo = logo;
      result$data['logo'] = l$logo;
    }
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] =
          toJsonEnumUserOrganizationRole((l$role as EnumUserOrganizationRole));
    }
    final l$status = status;
    result$data['status'] = toJsonEnumOrganizationStatus(l$status);
    final l$tags = tags;
    result$data['tags'] = l$tags.map((e) => e).toList();
    final l$tradingName = tradingName;
    result$data['tradingName'] = l$tradingName;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputCreateOrganizationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$corporateTaxpayerRegistry = corporateTaxpayerRegistry;
    final lOther$corporateTaxpayerRegistry = other.corporateTaxpayerRegistry;
    if (l$corporateTaxpayerRegistry != lOther$corporateTaxpayerRegistry) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$logo = logo;
    final lOther$logo = other.logo;
    if (_$data.containsKey('logo') != other._$data.containsKey('logo')) {
      return false;
    }
    if (l$logo != lOther$logo) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags.length != lOther$tags.length) {
      return false;
    }
    for (int i = 0; i < l$tags.length; i++) {
      final l$tags$entry = l$tags[i];
      final lOther$tags$entry = lOther$tags[i];
      if (l$tags$entry != lOther$tags$entry) {
        return false;
      }
    }
    final l$tradingName = tradingName;
    final lOther$tradingName = other.tradingName;
    if (l$tradingName != lOther$tradingName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$corporateTaxpayerRegistry = corporateTaxpayerRegistry;
    final l$description = description;
    final l$email = email;
    final l$logo = logo;
    final l$name = name;
    final l$role = role;
    final l$status = status;
    final l$tags = tags;
    final l$tradingName = tradingName;
    return Object.hashAll([
      l$corporateTaxpayerRegistry,
      l$description,
      l$email,
      _$data.containsKey('logo') ? l$logo : const {},
      l$name,
      _$data.containsKey('role') ? l$role : const {},
      l$status,
      Object.hashAll(l$tags.map((v) => v)),
      l$tradingName,
    ]);
  }
}

class InputCreatePostInput {
  factory InputCreatePostInput({
    required String body,
    List<String>? images,
    String? organizationId,
    required String title,
  }) =>
      InputCreatePostInput._({
        r'body': body,
        if (images != null) r'images': images,
        if (organizationId != null) r'organizationId': organizationId,
        r'title': title,
      });

  InputCreatePostInput._(this._$data);

  factory InputCreatePostInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    if (data.containsKey('images')) {
      final l$images = data['images'];
      result$data['images'] =
          (l$images as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('organizationId')) {
      final l$organizationId = data['organizationId'];
      result$data['organizationId'] = (l$organizationId as String?);
    }
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    return InputCreatePostInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get body => (_$data['body'] as String);

  List<String>? get images => (_$data['images'] as List<String>?);

  String? get organizationId => (_$data['organizationId'] as String?);

  String get title => (_$data['title'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$body = body;
    result$data['body'] = l$body;
    if (_$data.containsKey('images')) {
      final l$images = images;
      result$data['images'] = l$images?.map((e) => e).toList();
    }
    if (_$data.containsKey('organizationId')) {
      final l$organizationId = organizationId;
      result$data['organizationId'] = l$organizationId;
    }
    final l$title = title;
    result$data['title'] = l$title;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputCreatePostInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$images = images;
    final lOther$images = other.images;
    if (_$data.containsKey('images') != other._$data.containsKey('images')) {
      return false;
    }
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
      return false;
    }
    final l$organizationId = organizationId;
    final lOther$organizationId = other.organizationId;
    if (_$data.containsKey('organizationId') !=
        other._$data.containsKey('organizationId')) {
      return false;
    }
    if (l$organizationId != lOther$organizationId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$body = body;
    final l$images = images;
    final l$organizationId = organizationId;
    final l$title = title;
    return Object.hashAll([
      l$body,
      _$data.containsKey('images')
          ? l$images == null
              ? null
              : Object.hashAll(l$images.map((v) => v))
          : const {},
      _$data.containsKey('organizationId') ? l$organizationId : const {},
      l$title,
    ]);
  }
}

class InputCreateTermInput {
  factory InputCreateTermInput({
    required InputTermInput term,
    required InputTermVersionInput termVersion,
  }) =>
      InputCreateTermInput._({
        r'term': term,
        r'termVersion': termVersion,
      });

  InputCreateTermInput._(this._$data);

  factory InputCreateTermInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$term = data['term'];
    result$data['term'] =
        InputTermInput.fromJson((l$term as Map<String, dynamic>));
    final l$termVersion = data['termVersion'];
    result$data['termVersion'] =
        InputTermVersionInput.fromJson((l$termVersion as Map<String, dynamic>));
    return InputCreateTermInput._(result$data);
  }

  Map<String, dynamic> _$data;

  InputTermInput get term => (_$data['term'] as InputTermInput);

  InputTermVersionInput get termVersion =>
      (_$data['termVersion'] as InputTermVersionInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$term = term;
    result$data['term'] = l$term.toJson();
    final l$termVersion = termVersion;
    result$data['termVersion'] = l$termVersion.toJson();
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputCreateTermInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$term = term;
    final lOther$term = other.term;
    if (l$term != lOther$term) {
      return false;
    }
    final l$termVersion = termVersion;
    final lOther$termVersion = other.termVersion;
    if (l$termVersion != lOther$termVersion) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$term = term;
    final l$termVersion = termVersion;
    return Object.hashAll([
      l$term,
      l$termVersion,
    ]);
  }
}

class InputTermInput {
  factory InputTermInput({
    required String description,
    List<String>? tags,
    required String title,
  }) =>
      InputTermInput._({
        r'description': description,
        if (tags != null) r'tags': tags,
        r'title': title,
      });

  InputTermInput._(this._$data);

  factory InputTermInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$description = data['description'];
    result$data['description'] = (l$description as String);
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] =
          (l$tags as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    return InputTermInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get description => (_$data['description'] as String);

  List<String>? get tags => (_$data['tags'] as List<String>?);

  String get title => (_$data['title'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$description = description;
    result$data['description'] = l$description;
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    final l$title = title;
    result$data['title'] = l$title;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputTermInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
    if (l$tags != null && lOther$tags != null) {
      if (l$tags.length != lOther$tags.length) {
        return false;
      }
      for (int i = 0; i < l$tags.length; i++) {
        final l$tags$entry = l$tags[i];
        final lOther$tags$entry = lOther$tags[i];
        if (l$tags$entry != lOther$tags$entry) {
          return false;
        }
      }
    } else if (l$tags != lOther$tags) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$tags = tags;
    final l$title = title;
    return Object.hashAll([
      l$description,
      _$data.containsKey('tags')
          ? l$tags == null
              ? null
              : Object.hashAll(l$tags.map((v) => v))
          : const {},
      l$title,
    ]);
  }
}

class InputTermVersionInput {
  factory InputTermVersionInput({
    required String body,
    required String description,
    required String version,
  }) =>
      InputTermVersionInput._({
        r'body': body,
        r'description': description,
        r'version': version,
      });

  InputTermVersionInput._(this._$data);

  factory InputTermVersionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    final l$description = data['description'];
    result$data['description'] = (l$description as String);
    final l$version = data['version'];
    result$data['version'] = (l$version as String);
    return InputTermVersionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get body => (_$data['body'] as String);

  String get description => (_$data['description'] as String);

  String get version => (_$data['version'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$body = body;
    result$data['body'] = l$body;
    final l$description = description;
    result$data['description'] = l$description;
    final l$version = version;
    result$data['version'] = l$version;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputTermVersionInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (l$version != lOther$version) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$body = body;
    final l$description = description;
    final l$version = version;
    return Object.hashAll([
      l$body,
      l$description,
      l$version,
    ]);
  }
}

class InputCreateTermVersionInput {
  factory InputCreateTermVersionInput({
    required String body,
    required String description,
    required String termId,
    required String version,
  }) =>
      InputCreateTermVersionInput._({
        r'body': body,
        r'description': description,
        r'termId': termId,
        r'version': version,
      });

  InputCreateTermVersionInput._(this._$data);

  factory InputCreateTermVersionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    final l$description = data['description'];
    result$data['description'] = (l$description as String);
    final l$termId = data['termId'];
    result$data['termId'] = (l$termId as String);
    final l$version = data['version'];
    result$data['version'] = (l$version as String);
    return InputCreateTermVersionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get body => (_$data['body'] as String);

  String get description => (_$data['description'] as String);

  String get termId => (_$data['termId'] as String);

  String get version => (_$data['version'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$body = body;
    result$data['body'] = l$body;
    final l$description = description;
    result$data['description'] = l$description;
    final l$termId = termId;
    result$data['termId'] = l$termId;
    final l$version = version;
    result$data['version'] = l$version;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputCreateTermVersionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$termId = termId;
    final lOther$termId = other.termId;
    if (l$termId != lOther$termId) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (l$version != lOther$version) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$body = body;
    final l$description = description;
    final l$termId = termId;
    final l$version = version;
    return Object.hashAll([
      l$body,
      l$description,
      l$termId,
      l$version,
    ]);
  }
}

class InputCreateUserInput {
  factory InputCreateUserInput({
    required String email,
    bool? enabled,
    String? firstName,
    String? lastName,
    required String password,
    List<String>? requiredActions,
    required String username,
  }) =>
      InputCreateUserInput._({
        r'email': email,
        if (enabled != null) r'enabled': enabled,
        if (firstName != null) r'firstName': firstName,
        if (lastName != null) r'lastName': lastName,
        r'password': password,
        if (requiredActions != null) r'requiredActions': requiredActions,
        r'username': username,
      });

  InputCreateUserInput._(this._$data);

  factory InputCreateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    if (data.containsKey('enabled')) {
      final l$enabled = data['enabled'];
      result$data['enabled'] = (l$enabled as bool);
    }
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    if (data.containsKey('requiredActions')) {
      final l$requiredActions = data['requiredActions'];
      result$data['requiredActions'] = (l$requiredActions as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    final l$username = data['username'];
    result$data['username'] = (l$username as String);
    return InputCreateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  bool? get enabled => (_$data['enabled'] as bool?);

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  String get password => (_$data['password'] as String);

  List<String>? get requiredActions =>
      (_$data['requiredActions'] as List<String>?);

  String get username => (_$data['username'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    if (_$data.containsKey('enabled')) {
      final l$enabled = enabled;
      result$data['enabled'] = (l$enabled as bool);
    }
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    final l$password = password;
    result$data['password'] = l$password;
    if (_$data.containsKey('requiredActions')) {
      final l$requiredActions = requiredActions;
      result$data['requiredActions'] =
          l$requiredActions?.map((e) => e).toList();
    }
    final l$username = username;
    result$data['username'] = l$username;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputCreateUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$enabled = enabled;
    final lOther$enabled = other.enabled;
    if (_$data.containsKey('enabled') != other._$data.containsKey('enabled')) {
      return false;
    }
    if (l$enabled != lOther$enabled) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    final l$requiredActions = requiredActions;
    final lOther$requiredActions = other.requiredActions;
    if (_$data.containsKey('requiredActions') !=
        other._$data.containsKey('requiredActions')) {
      return false;
    }
    if (l$requiredActions != null && lOther$requiredActions != null) {
      if (l$requiredActions.length != lOther$requiredActions.length) {
        return false;
      }
      for (int i = 0; i < l$requiredActions.length; i++) {
        final l$requiredActions$entry = l$requiredActions[i];
        final lOther$requiredActions$entry = lOther$requiredActions[i];
        if (l$requiredActions$entry != lOther$requiredActions$entry) {
          return false;
        }
      }
    } else if (l$requiredActions != lOther$requiredActions) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$enabled = enabled;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$password = password;
    final l$requiredActions = requiredActions;
    final l$username = username;
    return Object.hashAll([
      l$email,
      _$data.containsKey('enabled') ? l$enabled : const {},
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
      l$password,
      _$data.containsKey('requiredActions')
          ? l$requiredActions == null
              ? null
              : Object.hashAll(l$requiredActions.map((v) => v))
          : const {},
      l$username,
    ]);
  }
}

class InputDeactivateUserInput {
  factory InputDeactivateUserInput({required String userId}) =>
      InputDeactivateUserInput._({
        r'userId': userId,
      });

  InputDeactivateUserInput._(this._$data);

  factory InputDeactivateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return InputDeactivateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputDeactivateUserInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }
}

class InputDeleteOrganizationInput {
  factory InputDeleteOrganizationInput({required String organizationId}) =>
      InputDeleteOrganizationInput._({
        r'organizationId': organizationId,
      });

  InputDeleteOrganizationInput._(this._$data);

  factory InputDeleteOrganizationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$organizationId = data['organizationId'];
    result$data['organizationId'] = (l$organizationId as String);
    return InputDeleteOrganizationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get organizationId => (_$data['organizationId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$organizationId = organizationId;
    result$data['organizationId'] = l$organizationId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputDeleteOrganizationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$organizationId = organizationId;
    final lOther$organizationId = other.organizationId;
    if (l$organizationId != lOther$organizationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$organizationId = organizationId;
    return Object.hashAll([l$organizationId]);
  }
}

class InputLoginInput {
  factory InputLoginInput({
    required String password,
    required String username,
  }) =>
      InputLoginInput._({
        r'password': password,
        r'username': username,
      });

  InputLoginInput._(this._$data);

  factory InputLoginInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    final l$username = data['username'];
    result$data['username'] = (l$username as String);
    return InputLoginInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get password => (_$data['password'] as String);

  String get username => (_$data['username'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$password = password;
    result$data['password'] = l$password;
    final l$username = username;
    result$data['username'] = l$username;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputLoginInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$password = password;
    final l$username = username;
    return Object.hashAll([
      l$password,
      l$username,
    ]);
  }
}

class InputModerateTextInput {
  factory InputModerateTextInput({required String message}) =>
      InputModerateTextInput._({
        r'message': message,
      });

  InputModerateTextInput._(this._$data);

  factory InputModerateTextInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$message = data['message'];
    result$data['message'] = (l$message as String);
    return InputModerateTextInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get message => (_$data['message'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$message = message;
    result$data['message'] = l$message;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputModerateTextInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$message = message;
    return Object.hashAll([l$message]);
  }
}

class InputPublishTermVersionInput {
  factory InputPublishTermVersionInput({
    required String ifMatchesETag,
    required String termVersionId,
  }) =>
      InputPublishTermVersionInput._({
        r'ifMatchesETag': ifMatchesETag,
        r'termVersionId': termVersionId,
      });

  InputPublishTermVersionInput._(this._$data);

  factory InputPublishTermVersionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$ifMatchesETag = data['ifMatchesETag'];
    result$data['ifMatchesETag'] = (l$ifMatchesETag as String);
    final l$termVersionId = data['termVersionId'];
    result$data['termVersionId'] = (l$termVersionId as String);
    return InputPublishTermVersionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get ifMatchesETag => (_$data['ifMatchesETag'] as String);

  String get termVersionId => (_$data['termVersionId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ifMatchesETag = ifMatchesETag;
    result$data['ifMatchesETag'] = l$ifMatchesETag;
    final l$termVersionId = termVersionId;
    result$data['termVersionId'] = l$termVersionId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputPublishTermVersionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ifMatchesETag = ifMatchesETag;
    final lOther$ifMatchesETag = other.ifMatchesETag;
    if (l$ifMatchesETag != lOther$ifMatchesETag) {
      return false;
    }
    final l$termVersionId = termVersionId;
    final lOther$termVersionId = other.termVersionId;
    if (l$termVersionId != lOther$termVersionId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ifMatchesETag = ifMatchesETag;
    final l$termVersionId = termVersionId;
    return Object.hashAll([
      l$ifMatchesETag,
      l$termVersionId,
    ]);
  }
}

class InputRefreshInput {
  factory InputRefreshInput({required String token}) => InputRefreshInput._({
        r'token': token,
      });

  InputRefreshInput._(this._$data);

  factory InputRefreshInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    return InputRefreshInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get token => (_$data['token'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$token = token;
    result$data['token'] = l$token;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputRefreshInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$token = token;
    return Object.hashAll([l$token]);
  }
}

class InputRegisterWebhookInput {
  factory InputRegisterWebhookInput({
    required bool active,
    required InputWebhookConfigInput config,
    required List<EnumSubscribableEvents> events,
    required String name,
  }) =>
      InputRegisterWebhookInput._({
        r'active': active,
        r'config': config,
        r'events': events,
        r'name': name,
      });

  InputRegisterWebhookInput._(this._$data);

  factory InputRegisterWebhookInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$active = data['active'];
    result$data['active'] = (l$active as bool);
    final l$config = data['config'];
    result$data['config'] =
        InputWebhookConfigInput.fromJson((l$config as Map<String, dynamic>));
    final l$events = data['events'];
    result$data['events'] = (l$events as List<dynamic>)
        .map((e) => fromJsonEnumSubscribableEvents((e as String)))
        .toList();
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    return InputRegisterWebhookInput._(result$data);
  }

  Map<String, dynamic> _$data;

  bool get active => (_$data['active'] as bool);

  InputWebhookConfigInput get config =>
      (_$data['config'] as InputWebhookConfigInput);

  List<EnumSubscribableEvents> get events =>
      (_$data['events'] as List<EnumSubscribableEvents>);

  String get name => (_$data['name'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$active = active;
    result$data['active'] = l$active;
    final l$config = config;
    result$data['config'] = l$config.toJson();
    final l$events = events;
    result$data['events'] =
        l$events.map((e) => toJsonEnumSubscribableEvents(e)).toList();
    final l$name = name;
    result$data['name'] = l$name;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputRegisterWebhookInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$active = active;
    final lOther$active = other.active;
    if (l$active != lOther$active) {
      return false;
    }
    final l$config = config;
    final lOther$config = other.config;
    if (l$config != lOther$config) {
      return false;
    }
    final l$events = events;
    final lOther$events = other.events;
    if (l$events.length != lOther$events.length) {
      return false;
    }
    for (int i = 0; i < l$events.length; i++) {
      final l$events$entry = l$events[i];
      final lOther$events$entry = lOther$events[i];
      if (l$events$entry != lOther$events$entry) {
        return false;
      }
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$active = active;
    final l$config = config;
    final l$events = events;
    final l$name = name;
    return Object.hashAll([
      l$active,
      l$config,
      Object.hashAll(l$events.map((v) => v)),
      l$name,
    ]);
  }
}

class InputWebhookConfigInput {
  factory InputWebhookConfigInput({
    required EnumWebhookRequestMethod method,
    required String url,
  }) =>
      InputWebhookConfigInput._({
        r'method': method,
        r'url': url,
      });

  InputWebhookConfigInput._(this._$data);

  factory InputWebhookConfigInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$method = data['method'];
    result$data['method'] =
        fromJsonEnumWebhookRequestMethod((l$method as String));
    final l$url = data['url'];
    result$data['url'] = (l$url as String);
    return InputWebhookConfigInput._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumWebhookRequestMethod get method =>
      (_$data['method'] as EnumWebhookRequestMethod);

  String get url => (_$data['url'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$method = method;
    result$data['method'] = toJsonEnumWebhookRequestMethod(l$method);
    final l$url = url;
    result$data['url'] = l$url;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputWebhookConfigInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$method = method;
    final lOther$method = other.method;
    if (l$method != lOther$method) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$method = method;
    final l$url = url;
    return Object.hashAll([
      l$method,
      l$url,
    ]);
  }
}

class InputRemovePostInput {
  factory InputRemovePostInput({
    required String id,
    required String reason,
  }) =>
      InputRemovePostInput._({
        r'id': id,
        r'reason': reason,
      });

  InputRemovePostInput._(this._$data);

  factory InputRemovePostInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$reason = data['reason'];
    result$data['reason'] = (l$reason as String);
    return InputRemovePostInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get reason => (_$data['reason'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$reason = reason;
    result$data['reason'] = l$reason;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputRemovePostInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (l$reason != lOther$reason) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$reason = reason;
    return Object.hashAll([
      l$id,
      l$reason,
    ]);
  }
}

class InputRemoveUserFromOrganizationInput {
  factory InputRemoveUserFromOrganizationInput({
    required String organizationId,
    required String userId,
  }) =>
      InputRemoveUserFromOrganizationInput._({
        r'organizationId': organizationId,
        r'userId': userId,
      });

  InputRemoveUserFromOrganizationInput._(this._$data);

  factory InputRemoveUserFromOrganizationInput.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$organizationId = data['organizationId'];
    result$data['organizationId'] = (l$organizationId as String);
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return InputRemoveUserFromOrganizationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get organizationId => (_$data['organizationId'] as String);

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$organizationId = organizationId;
    result$data['organizationId'] = l$organizationId;
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputRemoveUserFromOrganizationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$organizationId = organizationId;
    final lOther$organizationId = other.organizationId;
    if (l$organizationId != lOther$organizationId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$organizationId = organizationId;
    final l$userId = userId;
    return Object.hashAll([
      l$organizationId,
      l$userId,
    ]);
  }
}

class InputResetPasswordInput {
  factory InputResetPasswordInput({required String email}) =>
      InputResetPasswordInput._({
        r'email': email,
      });

  InputResetPasswordInput._(this._$data);

  factory InputResetPasswordInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    return InputResetPasswordInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputResetPasswordInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    return Object.hashAll([l$email]);
  }
}

class InputRestorePostInput {
  factory InputRestorePostInput({required String id}) =>
      InputRestorePostInput._({
        r'id': id,
      });

  InputRestorePostInput._(this._$data);

  factory InputRestorePostInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return InputRestorePostInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputRestorePostInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

class InputTriggerWebhookEvent {
  factory InputTriggerWebhookEvent({
    required EnumSubscribableEvents triggerEvent,
    required String webhookId,
    required Map<String, dynamic> webhookJsonData,
  }) =>
      InputTriggerWebhookEvent._({
        r'triggerEvent': triggerEvent,
        r'webhookId': webhookId,
        r'webhookJsonData': webhookJsonData,
      });

  InputTriggerWebhookEvent._(this._$data);

  factory InputTriggerWebhookEvent.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$triggerEvent = data['triggerEvent'];
    result$data['triggerEvent'] =
        fromJsonEnumSubscribableEvents((l$triggerEvent as String));
    final l$webhookId = data['webhookId'];
    result$data['webhookId'] = (l$webhookId as String);
    final l$webhookJsonData = data['webhookJsonData'];
    result$data['webhookJsonData'] =
        (l$webhookJsonData as Map<String, dynamic>);
    return InputTriggerWebhookEvent._(result$data);
  }

  Map<String, dynamic> _$data;

  EnumSubscribableEvents get triggerEvent =>
      (_$data['triggerEvent'] as EnumSubscribableEvents);

  String get webhookId => (_$data['webhookId'] as String);

  Map<String, dynamic> get webhookJsonData =>
      (_$data['webhookJsonData'] as Map<String, dynamic>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$triggerEvent = triggerEvent;
    result$data['triggerEvent'] = toJsonEnumSubscribableEvents(l$triggerEvent);
    final l$webhookId = webhookId;
    result$data['webhookId'] = l$webhookId;
    final l$webhookJsonData = webhookJsonData;
    result$data['webhookJsonData'] = l$webhookJsonData;
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputTriggerWebhookEvent ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$triggerEvent = triggerEvent;
    final lOther$triggerEvent = other.triggerEvent;
    if (l$triggerEvent != lOther$triggerEvent) {
      return false;
    }
    final l$webhookId = webhookId;
    final lOther$webhookId = other.webhookId;
    if (l$webhookId != lOther$webhookId) {
      return false;
    }
    final l$webhookJsonData = webhookJsonData;
    final lOther$webhookJsonData = other.webhookJsonData;
    if (l$webhookJsonData != lOther$webhookJsonData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$triggerEvent = triggerEvent;
    final l$webhookId = webhookId;
    final l$webhookJsonData = webhookJsonData;
    return Object.hashAll([
      l$triggerEvent,
      l$webhookId,
      l$webhookJsonData,
    ]);
  }
}

class InputUpdateOrganizationInput {
  factory InputUpdateOrganizationInput({
    String? corporateTaxpayerRegistry,
    String? description,
    String? email,
    required String ifMatchesETag,
    String? logo,
    String? name,
    required String organizationId,
    EnumOrganizationStatus? status,
    List<String>? tags,
    String? tradingName,
  }) =>
      InputUpdateOrganizationInput._({
        if (corporateTaxpayerRegistry != null)
          r'corporateTaxpayerRegistry': corporateTaxpayerRegistry,
        if (description != null) r'description': description,
        if (email != null) r'email': email,
        r'ifMatchesETag': ifMatchesETag,
        if (logo != null) r'logo': logo,
        if (name != null) r'name': name,
        r'organizationId': organizationId,
        if (status != null) r'status': status,
        if (tags != null) r'tags': tags,
        if (tradingName != null) r'tradingName': tradingName,
      });

  InputUpdateOrganizationInput._(this._$data);

  factory InputUpdateOrganizationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('corporateTaxpayerRegistry')) {
      final l$corporateTaxpayerRegistry = data['corporateTaxpayerRegistry'];
      result$data['corporateTaxpayerRegistry'] =
          (l$corporateTaxpayerRegistry as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    final l$ifMatchesETag = data['ifMatchesETag'];
    result$data['ifMatchesETag'] = (l$ifMatchesETag as String);
    if (data.containsKey('logo')) {
      final l$logo = data['logo'];
      result$data['logo'] = (l$logo as String?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    final l$organizationId = data['organizationId'];
    result$data['organizationId'] = (l$organizationId as String);
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJsonEnumOrganizationStatus((l$status as String));
    }
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] =
          (l$tags as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('tradingName')) {
      final l$tradingName = data['tradingName'];
      result$data['tradingName'] = (l$tradingName as String?);
    }
    return InputUpdateOrganizationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get corporateTaxpayerRegistry =>
      (_$data['corporateTaxpayerRegistry'] as String?);

  String? get description => (_$data['description'] as String?);

  String? get email => (_$data['email'] as String?);

  String get ifMatchesETag => (_$data['ifMatchesETag'] as String);

  String? get logo => (_$data['logo'] as String?);

  String? get name => (_$data['name'] as String?);

  String get organizationId => (_$data['organizationId'] as String);

  EnumOrganizationStatus? get status =>
      (_$data['status'] as EnumOrganizationStatus?);

  List<String>? get tags => (_$data['tags'] as List<String>?);

  String? get tradingName => (_$data['tradingName'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('corporateTaxpayerRegistry')) {
      final l$corporateTaxpayerRegistry = corporateTaxpayerRegistry;
      result$data['corporateTaxpayerRegistry'] = l$corporateTaxpayerRegistry;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    final l$ifMatchesETag = ifMatchesETag;
    result$data['ifMatchesETag'] = l$ifMatchesETag;
    if (_$data.containsKey('logo')) {
      final l$logo = logo;
      result$data['logo'] = l$logo;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    final l$organizationId = organizationId;
    result$data['organizationId'] = l$organizationId;
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] =
          l$status == null ? null : toJsonEnumOrganizationStatus(l$status);
    }
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    if (_$data.containsKey('tradingName')) {
      final l$tradingName = tradingName;
      result$data['tradingName'] = l$tradingName;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputUpdateOrganizationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$corporateTaxpayerRegistry = corporateTaxpayerRegistry;
    final lOther$corporateTaxpayerRegistry = other.corporateTaxpayerRegistry;
    if (_$data.containsKey('corporateTaxpayerRegistry') !=
        other._$data.containsKey('corporateTaxpayerRegistry')) {
      return false;
    }
    if (l$corporateTaxpayerRegistry != lOther$corporateTaxpayerRegistry) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$ifMatchesETag = ifMatchesETag;
    final lOther$ifMatchesETag = other.ifMatchesETag;
    if (l$ifMatchesETag != lOther$ifMatchesETag) {
      return false;
    }
    final l$logo = logo;
    final lOther$logo = other.logo;
    if (_$data.containsKey('logo') != other._$data.containsKey('logo')) {
      return false;
    }
    if (l$logo != lOther$logo) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$organizationId = organizationId;
    final lOther$organizationId = other.organizationId;
    if (l$organizationId != lOther$organizationId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
    if (l$tags != null && lOther$tags != null) {
      if (l$tags.length != lOther$tags.length) {
        return false;
      }
      for (int i = 0; i < l$tags.length; i++) {
        final l$tags$entry = l$tags[i];
        final lOther$tags$entry = lOther$tags[i];
        if (l$tags$entry != lOther$tags$entry) {
          return false;
        }
      }
    } else if (l$tags != lOther$tags) {
      return false;
    }
    final l$tradingName = tradingName;
    final lOther$tradingName = other.tradingName;
    if (_$data.containsKey('tradingName') !=
        other._$data.containsKey('tradingName')) {
      return false;
    }
    if (l$tradingName != lOther$tradingName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$corporateTaxpayerRegistry = corporateTaxpayerRegistry;
    final l$description = description;
    final l$email = email;
    final l$ifMatchesETag = ifMatchesETag;
    final l$logo = logo;
    final l$name = name;
    final l$organizationId = organizationId;
    final l$status = status;
    final l$tags = tags;
    final l$tradingName = tradingName;
    return Object.hashAll([
      _$data.containsKey('corporateTaxpayerRegistry')
          ? l$corporateTaxpayerRegistry
          : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('email') ? l$email : const {},
      l$ifMatchesETag,
      _$data.containsKey('logo') ? l$logo : const {},
      _$data.containsKey('name') ? l$name : const {},
      l$organizationId,
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('tags')
          ? l$tags == null
              ? null
              : Object.hashAll(l$tags.map((v) => v))
          : const {},
      _$data.containsKey('tradingName') ? l$tradingName : const {},
    ]);
  }
}

class InputUpdateTermVersionInput {
  factory InputUpdateTermVersionInput({
    String? body,
    String? description,
    required String ifMatchesETag,
    required String termVersionId,
    String? version,
  }) =>
      InputUpdateTermVersionInput._({
        if (body != null) r'body': body,
        if (description != null) r'description': description,
        r'ifMatchesETag': ifMatchesETag,
        r'termVersionId': termVersionId,
        if (version != null) r'version': version,
      });

  InputUpdateTermVersionInput._(this._$data);

  factory InputUpdateTermVersionInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('body')) {
      final l$body = data['body'];
      result$data['body'] = (l$body as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$ifMatchesETag = data['ifMatchesETag'];
    result$data['ifMatchesETag'] = (l$ifMatchesETag as String);
    final l$termVersionId = data['termVersionId'];
    result$data['termVersionId'] = (l$termVersionId as String);
    if (data.containsKey('version')) {
      final l$version = data['version'];
      result$data['version'] = (l$version as String?);
    }
    return InputUpdateTermVersionInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get body => (_$data['body'] as String?);

  String? get description => (_$data['description'] as String?);

  String get ifMatchesETag => (_$data['ifMatchesETag'] as String);

  String get termVersionId => (_$data['termVersionId'] as String);

  String? get version => (_$data['version'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('body')) {
      final l$body = body;
      result$data['body'] = l$body;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$ifMatchesETag = ifMatchesETag;
    result$data['ifMatchesETag'] = l$ifMatchesETag;
    final l$termVersionId = termVersionId;
    result$data['termVersionId'] = l$termVersionId;
    if (_$data.containsKey('version')) {
      final l$version = version;
      result$data['version'] = l$version;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputUpdateTermVersionInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (_$data.containsKey('body') != other._$data.containsKey('body')) {
      return false;
    }
    if (l$body != lOther$body) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$ifMatchesETag = ifMatchesETag;
    final lOther$ifMatchesETag = other.ifMatchesETag;
    if (l$ifMatchesETag != lOther$ifMatchesETag) {
      return false;
    }
    final l$termVersionId = termVersionId;
    final lOther$termVersionId = other.termVersionId;
    if (l$termVersionId != lOther$termVersionId) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (_$data.containsKey('version') != other._$data.containsKey('version')) {
      return false;
    }
    if (l$version != lOther$version) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$body = body;
    final l$description = description;
    final l$ifMatchesETag = ifMatchesETag;
    final l$termVersionId = termVersionId;
    final l$version = version;
    return Object.hashAll([
      _$data.containsKey('body') ? l$body : const {},
      _$data.containsKey('description') ? l$description : const {},
      l$ifMatchesETag,
      l$termVersionId,
      _$data.containsKey('version') ? l$version : const {},
    ]);
  }
}

class InputUpdateUserInput {
  factory InputUpdateUserInput({
    String? email,
    String? firstName,
    String? lastName,
    String? userId,
  }) =>
      InputUpdateUserInput._({
        if (email != null) r'email': email,
        if (firstName != null) r'firstName': firstName,
        if (lastName != null) r'lastName': lastName,
        if (userId != null) r'userId': userId,
      });

  InputUpdateUserInput._(this._$data);

  factory InputUpdateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    if (data.containsKey('userId')) {
      final l$userId = data['userId'];
      result$data['userId'] = (l$userId as String?);
    }
    return InputUpdateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get email => (_$data['email'] as String?);

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  String? get userId => (_$data['userId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    if (_$data.containsKey('userId')) {
      final l$userId = userId;
      result$data['userId'] = l$userId;
    }
    return result$data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! InputUpdateUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (_$data.containsKey('userId') != other._$data.containsKey('userId')) {
      return false;
    }
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$userId = userId;
    return Object.hashAll([
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
      _$data.containsKey('userId') ? l$userId : const {},
    ]);
  }
}

enum EnumCategoryNameType {
  DEATH_HARM_TRAGEDY,
  DEFAULT,
  DEROGATORY,
  FINANCE,
  FIREARMS_WEAPONS,
  HEALTH,
  ILLICIT_DRUGS,
  INSULT,
  LEGAL,
  POLITICS,
  PROFANITY,
  PUBLIC_SAFETY,
  RELIGION_BELIEF,
  SEXUAL,
  TOXIC,
  VIOLENT,
  WAR_CONFLICT,
  $unknown;

  factory EnumCategoryNameType.fromJson(String value) =>
      fromJsonEnumCategoryNameType(value);

  String toJson() => toJsonEnumCategoryNameType(this);
}

String toJsonEnumCategoryNameType(EnumCategoryNameType e) {
  switch (e) {
    case EnumCategoryNameType.DEATH_HARM_TRAGEDY:
      return r'DEATH_HARM_TRAGEDY';
    case EnumCategoryNameType.DEFAULT:
      return r'DEFAULT';
    case EnumCategoryNameType.DEROGATORY:
      return r'DEROGATORY';
    case EnumCategoryNameType.FINANCE:
      return r'FINANCE';
    case EnumCategoryNameType.FIREARMS_WEAPONS:
      return r'FIREARMS_WEAPONS';
    case EnumCategoryNameType.HEALTH:
      return r'HEALTH';
    case EnumCategoryNameType.ILLICIT_DRUGS:
      return r'ILLICIT_DRUGS';
    case EnumCategoryNameType.INSULT:
      return r'INSULT';
    case EnumCategoryNameType.LEGAL:
      return r'LEGAL';
    case EnumCategoryNameType.POLITICS:
      return r'POLITICS';
    case EnumCategoryNameType.PROFANITY:
      return r'PROFANITY';
    case EnumCategoryNameType.PUBLIC_SAFETY:
      return r'PUBLIC_SAFETY';
    case EnumCategoryNameType.RELIGION_BELIEF:
      return r'RELIGION_BELIEF';
    case EnumCategoryNameType.SEXUAL:
      return r'SEXUAL';
    case EnumCategoryNameType.TOXIC:
      return r'TOXIC';
    case EnumCategoryNameType.VIOLENT:
      return r'VIOLENT';
    case EnumCategoryNameType.WAR_CONFLICT:
      return r'WAR_CONFLICT';
    case EnumCategoryNameType.$unknown:
      return r'$unknown';
  }
}

EnumCategoryNameType fromJsonEnumCategoryNameType(String value) {
  switch (value) {
    case r'DEATH_HARM_TRAGEDY':
      return EnumCategoryNameType.DEATH_HARM_TRAGEDY;
    case r'DEFAULT':
      return EnumCategoryNameType.DEFAULT;
    case r'DEROGATORY':
      return EnumCategoryNameType.DEROGATORY;
    case r'FINANCE':
      return EnumCategoryNameType.FINANCE;
    case r'FIREARMS_WEAPONS':
      return EnumCategoryNameType.FIREARMS_WEAPONS;
    case r'HEALTH':
      return EnumCategoryNameType.HEALTH;
    case r'ILLICIT_DRUGS':
      return EnumCategoryNameType.ILLICIT_DRUGS;
    case r'INSULT':
      return EnumCategoryNameType.INSULT;
    case r'LEGAL':
      return EnumCategoryNameType.LEGAL;
    case r'POLITICS':
      return EnumCategoryNameType.POLITICS;
    case r'PROFANITY':
      return EnumCategoryNameType.PROFANITY;
    case r'PUBLIC_SAFETY':
      return EnumCategoryNameType.PUBLIC_SAFETY;
    case r'RELIGION_BELIEF':
      return EnumCategoryNameType.RELIGION_BELIEF;
    case r'SEXUAL':
      return EnumCategoryNameType.SEXUAL;
    case r'TOXIC':
      return EnumCategoryNameType.TOXIC;
    case r'VIOLENT':
      return EnumCategoryNameType.VIOLENT;
    case r'WAR_CONFLICT':
      return EnumCategoryNameType.WAR_CONFLICT;
    default:
      return EnumCategoryNameType.$unknown;
  }
}

enum EnumHomeElementTextKind {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  $unknown;

  factory EnumHomeElementTextKind.fromJson(String value) =>
      fromJsonEnumHomeElementTextKind(value);

  String toJson() => toJsonEnumHomeElementTextKind(this);
}

String toJsonEnumHomeElementTextKind(EnumHomeElementTextKind e) {
  switch (e) {
    case EnumHomeElementTextKind.h1:
      return r'h1';
    case EnumHomeElementTextKind.h2:
      return r'h2';
    case EnumHomeElementTextKind.h3:
      return r'h3';
    case EnumHomeElementTextKind.h4:
      return r'h4';
    case EnumHomeElementTextKind.h5:
      return r'h5';
    case EnumHomeElementTextKind.h6:
      return r'h6';
    case EnumHomeElementTextKind.$unknown:
      return r'$unknown';
  }
}

EnumHomeElementTextKind fromJsonEnumHomeElementTextKind(String value) {
  switch (value) {
    case r'h1':
      return EnumHomeElementTextKind.h1;
    case r'h2':
      return EnumHomeElementTextKind.h2;
    case r'h3':
      return EnumHomeElementTextKind.h3;
    case r'h4':
      return EnumHomeElementTextKind.h4;
    case r'h5':
      return EnumHomeElementTextKind.h5;
    case r'h6':
      return EnumHomeElementTextKind.h6;
    default:
      return EnumHomeElementTextKind.$unknown;
  }
}

enum EnumOrderableTermVersionFields {
  BODY,
  CREATED_AT,
  DESCRIPTION,
  ETAG,
  ID,
  IS_PUBLISHED,
  UPDATED_AT,
  VERSION,
  $unknown;

  factory EnumOrderableTermVersionFields.fromJson(String value) =>
      fromJsonEnumOrderableTermVersionFields(value);

  String toJson() => toJsonEnumOrderableTermVersionFields(this);
}

String toJsonEnumOrderableTermVersionFields(EnumOrderableTermVersionFields e) {
  switch (e) {
    case EnumOrderableTermVersionFields.BODY:
      return r'BODY';
    case EnumOrderableTermVersionFields.CREATED_AT:
      return r'CREATED_AT';
    case EnumOrderableTermVersionFields.DESCRIPTION:
      return r'DESCRIPTION';
    case EnumOrderableTermVersionFields.ETAG:
      return r'ETAG';
    case EnumOrderableTermVersionFields.ID:
      return r'ID';
    case EnumOrderableTermVersionFields.IS_PUBLISHED:
      return r'IS_PUBLISHED';
    case EnumOrderableTermVersionFields.UPDATED_AT:
      return r'UPDATED_AT';
    case EnumOrderableTermVersionFields.VERSION:
      return r'VERSION';
    case EnumOrderableTermVersionFields.$unknown:
      return r'$unknown';
  }
}

EnumOrderableTermVersionFields fromJsonEnumOrderableTermVersionFields(
    String value) {
  switch (value) {
    case r'BODY':
      return EnumOrderableTermVersionFields.BODY;
    case r'CREATED_AT':
      return EnumOrderableTermVersionFields.CREATED_AT;
    case r'DESCRIPTION':
      return EnumOrderableTermVersionFields.DESCRIPTION;
    case r'ETAG':
      return EnumOrderableTermVersionFields.ETAG;
    case r'ID':
      return EnumOrderableTermVersionFields.ID;
    case r'IS_PUBLISHED':
      return EnumOrderableTermVersionFields.IS_PUBLISHED;
    case r'UPDATED_AT':
      return EnumOrderableTermVersionFields.UPDATED_AT;
    case r'VERSION':
      return EnumOrderableTermVersionFields.VERSION;
    default:
      return EnumOrderableTermVersionFields.$unknown;
  }
}

enum EnumOrderInput {
  ASC,
  DESC,
  $unknown;

  factory EnumOrderInput.fromJson(String value) =>
      fromJsonEnumOrderInput(value);

  String toJson() => toJsonEnumOrderInput(this);
}

String toJsonEnumOrderInput(EnumOrderInput e) {
  switch (e) {
    case EnumOrderInput.ASC:
      return r'ASC';
    case EnumOrderInput.DESC:
      return r'DESC';
    case EnumOrderInput.$unknown:
      return r'$unknown';
  }
}

EnumOrderInput fromJsonEnumOrderInput(String value) {
  switch (value) {
    case r'ASC':
      return EnumOrderInput.ASC;
    case r'DESC':
      return EnumOrderInput.DESC;
    default:
      return EnumOrderInput.$unknown;
  }
}

enum EnumOrganizationStatus {
  ACTIVE,
  INACTIVE,
  $unknown;

  factory EnumOrganizationStatus.fromJson(String value) =>
      fromJsonEnumOrganizationStatus(value);

  String toJson() => toJsonEnumOrganizationStatus(this);
}

String toJsonEnumOrganizationStatus(EnumOrganizationStatus e) {
  switch (e) {
    case EnumOrganizationStatus.ACTIVE:
      return r'ACTIVE';
    case EnumOrganizationStatus.INACTIVE:
      return r'INACTIVE';
    case EnumOrganizationStatus.$unknown:
      return r'$unknown';
  }
}

EnumOrganizationStatus fromJsonEnumOrganizationStatus(String value) {
  switch (value) {
    case r'ACTIVE':
      return EnumOrganizationStatus.ACTIVE;
    case r'INACTIVE':
      return EnumOrganizationStatus.INACTIVE;
    default:
      return EnumOrganizationStatus.$unknown;
  }
}

enum EnumUserOrganizationEdgeStatus {
  ACTIVE,
  INACTIVE,
  $unknown;

  factory EnumUserOrganizationEdgeStatus.fromJson(String value) =>
      fromJsonEnumUserOrganizationEdgeStatus(value);

  String toJson() => toJsonEnumUserOrganizationEdgeStatus(this);
}

String toJsonEnumUserOrganizationEdgeStatus(EnumUserOrganizationEdgeStatus e) {
  switch (e) {
    case EnumUserOrganizationEdgeStatus.ACTIVE:
      return r'ACTIVE';
    case EnumUserOrganizationEdgeStatus.INACTIVE:
      return r'INACTIVE';
    case EnumUserOrganizationEdgeStatus.$unknown:
      return r'$unknown';
  }
}

EnumUserOrganizationEdgeStatus fromJsonEnumUserOrganizationEdgeStatus(
    String value) {
  switch (value) {
    case r'ACTIVE':
      return EnumUserOrganizationEdgeStatus.ACTIVE;
    case r'INACTIVE':
      return EnumUserOrganizationEdgeStatus.INACTIVE;
    default:
      return EnumUserOrganizationEdgeStatus.$unknown;
  }
}

enum EnumUserOrganizationRole {
  ADMIN,
  USER,
  $unknown;

  factory EnumUserOrganizationRole.fromJson(String value) =>
      fromJsonEnumUserOrganizationRole(value);

  String toJson() => toJsonEnumUserOrganizationRole(this);
}

String toJsonEnumUserOrganizationRole(EnumUserOrganizationRole e) {
  switch (e) {
    case EnumUserOrganizationRole.ADMIN:
      return r'ADMIN';
    case EnumUserOrganizationRole.USER:
      return r'USER';
    case EnumUserOrganizationRole.$unknown:
      return r'$unknown';
  }
}

EnumUserOrganizationRole fromJsonEnumUserOrganizationRole(String value) {
  switch (value) {
    case r'ADMIN':
      return EnumUserOrganizationRole.ADMIN;
    case r'USER':
      return EnumUserOrganizationRole.USER;
    default:
      return EnumUserOrganizationRole.$unknown;
  }
}

enum EnumOrderableOrganizationFields {
  CORPORATE_TAXPAYER_REGISTRY,
  DESCRIPTION,
  EMAIL,
  ETAG,
  ID,
  NAME,
  TAGS,
  TRADING_NAME,
  $unknown;

  factory EnumOrderableOrganizationFields.fromJson(String value) =>
      fromJsonEnumOrderableOrganizationFields(value);

  String toJson() => toJsonEnumOrderableOrganizationFields(this);
}

String toJsonEnumOrderableOrganizationFields(
    EnumOrderableOrganizationFields e) {
  switch (e) {
    case EnumOrderableOrganizationFields.CORPORATE_TAXPAYER_REGISTRY:
      return r'CORPORATE_TAXPAYER_REGISTRY';
    case EnumOrderableOrganizationFields.DESCRIPTION:
      return r'DESCRIPTION';
    case EnumOrderableOrganizationFields.EMAIL:
      return r'EMAIL';
    case EnumOrderableOrganizationFields.ETAG:
      return r'ETAG';
    case EnumOrderableOrganizationFields.ID:
      return r'ID';
    case EnumOrderableOrganizationFields.NAME:
      return r'NAME';
    case EnumOrderableOrganizationFields.TAGS:
      return r'TAGS';
    case EnumOrderableOrganizationFields.TRADING_NAME:
      return r'TRADING_NAME';
    case EnumOrderableOrganizationFields.$unknown:
      return r'$unknown';
  }
}

EnumOrderableOrganizationFields fromJsonEnumOrderableOrganizationFields(
    String value) {
  switch (value) {
    case r'CORPORATE_TAXPAYER_REGISTRY':
      return EnumOrderableOrganizationFields.CORPORATE_TAXPAYER_REGISTRY;
    case r'DESCRIPTION':
      return EnumOrderableOrganizationFields.DESCRIPTION;
    case r'EMAIL':
      return EnumOrderableOrganizationFields.EMAIL;
    case r'ETAG':
      return EnumOrderableOrganizationFields.ETAG;
    case r'ID':
      return EnumOrderableOrganizationFields.ID;
    case r'NAME':
      return EnumOrderableOrganizationFields.NAME;
    case r'TAGS':
      return EnumOrderableOrganizationFields.TAGS;
    case r'TRADING_NAME':
      return EnumOrderableOrganizationFields.TRADING_NAME;
    default:
      return EnumOrderableOrganizationFields.$unknown;
  }
}

enum EnumVideoStatus {
  ERROR,
  PROCESSING,
  READY,
  $unknown;

  factory EnumVideoStatus.fromJson(String value) =>
      fromJsonEnumVideoStatus(value);

  String toJson() => toJsonEnumVideoStatus(this);
}

String toJsonEnumVideoStatus(EnumVideoStatus e) {
  switch (e) {
    case EnumVideoStatus.ERROR:
      return r'ERROR';
    case EnumVideoStatus.PROCESSING:
      return r'PROCESSING';
    case EnumVideoStatus.READY:
      return r'READY';
    case EnumVideoStatus.$unknown:
      return r'$unknown';
  }
}

EnumVideoStatus fromJsonEnumVideoStatus(String value) {
  switch (value) {
    case r'ERROR':
      return EnumVideoStatus.ERROR;
    case r'PROCESSING':
      return EnumVideoStatus.PROCESSING;
    case r'READY':
      return EnumVideoStatus.READY;
    default:
      return EnumVideoStatus.$unknown;
  }
}

enum EnumOrderableTermFields {
  DESCRIPTION,
  ID,
  TAGS,
  TITLE,
  $unknown;

  factory EnumOrderableTermFields.fromJson(String value) =>
      fromJsonEnumOrderableTermFields(value);

  String toJson() => toJsonEnumOrderableTermFields(this);
}

String toJsonEnumOrderableTermFields(EnumOrderableTermFields e) {
  switch (e) {
    case EnumOrderableTermFields.DESCRIPTION:
      return r'DESCRIPTION';
    case EnumOrderableTermFields.ID:
      return r'ID';
    case EnumOrderableTermFields.TAGS:
      return r'TAGS';
    case EnumOrderableTermFields.TITLE:
      return r'TITLE';
    case EnumOrderableTermFields.$unknown:
      return r'$unknown';
  }
}

EnumOrderableTermFields fromJsonEnumOrderableTermFields(String value) {
  switch (value) {
    case r'DESCRIPTION':
      return EnumOrderableTermFields.DESCRIPTION;
    case r'ID':
      return EnumOrderableTermFields.ID;
    case r'TAGS':
      return EnumOrderableTermFields.TAGS;
    case r'TITLE':
      return EnumOrderableTermFields.TITLE;
    default:
      return EnumOrderableTermFields.$unknown;
  }
}

enum EnumSubscribableEvents {
  ADD_USER_TO_ORGANIZATION,
  REMOVE_USER_FROM_ORGANIZATION,
  $unknown;

  factory EnumSubscribableEvents.fromJson(String value) =>
      fromJsonEnumSubscribableEvents(value);

  String toJson() => toJsonEnumSubscribableEvents(this);
}

String toJsonEnumSubscribableEvents(EnumSubscribableEvents e) {
  switch (e) {
    case EnumSubscribableEvents.ADD_USER_TO_ORGANIZATION:
      return r'ADD_USER_TO_ORGANIZATION';
    case EnumSubscribableEvents.REMOVE_USER_FROM_ORGANIZATION:
      return r'REMOVE_USER_FROM_ORGANIZATION';
    case EnumSubscribableEvents.$unknown:
      return r'$unknown';
  }
}

EnumSubscribableEvents fromJsonEnumSubscribableEvents(String value) {
  switch (value) {
    case r'ADD_USER_TO_ORGANIZATION':
      return EnumSubscribableEvents.ADD_USER_TO_ORGANIZATION;
    case r'REMOVE_USER_FROM_ORGANIZATION':
      return EnumSubscribableEvents.REMOVE_USER_FROM_ORGANIZATION;
    default:
      return EnumSubscribableEvents.$unknown;
  }
}

enum EnumWebhookRequestMethod {
  POST,
  PUT,
  $unknown;

  factory EnumWebhookRequestMethod.fromJson(String value) =>
      fromJsonEnumWebhookRequestMethod(value);

  String toJson() => toJsonEnumWebhookRequestMethod(this);
}

String toJsonEnumWebhookRequestMethod(EnumWebhookRequestMethod e) {
  switch (e) {
    case EnumWebhookRequestMethod.POST:
      return r'POST';
    case EnumWebhookRequestMethod.PUT:
      return r'PUT';
    case EnumWebhookRequestMethod.$unknown:
      return r'$unknown';
  }
}

EnumWebhookRequestMethod fromJsonEnumWebhookRequestMethod(String value) {
  switch (value) {
    case r'POST':
      return EnumWebhookRequestMethod.POST;
    case r'PUT':
      return EnumWebhookRequestMethod.PUT;
    default:
      return EnumWebhookRequestMethod.$unknown;
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

  factory Enum__TypeKind.fromJson(String value) =>
      fromJsonEnum__TypeKind(value);

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

  factory Enum__DirectiveLocation.fromJson(String value) =>
      fromJsonEnum__DirectiveLocation(value);

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

enum EnumForeignNodeIdValidateDirectivePolicy {
  RESOLVER,
  THROW,
  $unknown;

  factory EnumForeignNodeIdValidateDirectivePolicy.fromJson(String value) =>
      fromJsonEnumForeignNodeIdValidateDirectivePolicy(value);

  String toJson() => toJsonEnumForeignNodeIdValidateDirectivePolicy(this);
}

String toJsonEnumForeignNodeIdValidateDirectivePolicy(
    EnumForeignNodeIdValidateDirectivePolicy e) {
  switch (e) {
    case EnumForeignNodeIdValidateDirectivePolicy.RESOLVER:
      return r'RESOLVER';
    case EnumForeignNodeIdValidateDirectivePolicy.THROW:
      return r'THROW';
    case EnumForeignNodeIdValidateDirectivePolicy.$unknown:
      return r'$unknown';
  }
}

EnumForeignNodeIdValidateDirectivePolicy
    fromJsonEnumForeignNodeIdValidateDirectivePolicy(String value) {
  switch (value) {
    case r'RESOLVER':
      return EnumForeignNodeIdValidateDirectivePolicy.RESOLVER;
    case r'THROW':
      return EnumForeignNodeIdValidateDirectivePolicy.THROW;
    default:
      return EnumForeignNodeIdValidateDirectivePolicy.$unknown;
  }
}

enum EnumHasPermissionsDirectivePolicy {
  RESOLVER,
  THROW,
  $unknown;

  factory EnumHasPermissionsDirectivePolicy.fromJson(String value) =>
      fromJsonEnumHasPermissionsDirectivePolicy(value);

  String toJson() => toJsonEnumHasPermissionsDirectivePolicy(this);
}

String toJsonEnumHasPermissionsDirectivePolicy(
    EnumHasPermissionsDirectivePolicy e) {
  switch (e) {
    case EnumHasPermissionsDirectivePolicy.RESOLVER:
      return r'RESOLVER';
    case EnumHasPermissionsDirectivePolicy.THROW:
      return r'THROW';
    case EnumHasPermissionsDirectivePolicy.$unknown:
      return r'$unknown';
  }
}

EnumHasPermissionsDirectivePolicy fromJsonEnumHasPermissionsDirectivePolicy(
    String value) {
  switch (value) {
    case r'RESOLVER':
      return EnumHasPermissionsDirectivePolicy.RESOLVER;
    case r'THROW':
      return EnumHasPermissionsDirectivePolicy.THROW;
    default:
      return EnumHasPermissionsDirectivePolicy.$unknown;
  }
}

enum EnumListLengthValidateDirectivePolicy {
  RESOLVER,
  THROW,
  $unknown;

  factory EnumListLengthValidateDirectivePolicy.fromJson(String value) =>
      fromJsonEnumListLengthValidateDirectivePolicy(value);

  String toJson() => toJsonEnumListLengthValidateDirectivePolicy(this);
}

String toJsonEnumListLengthValidateDirectivePolicy(
    EnumListLengthValidateDirectivePolicy e) {
  switch (e) {
    case EnumListLengthValidateDirectivePolicy.RESOLVER:
      return r'RESOLVER';
    case EnumListLengthValidateDirectivePolicy.THROW:
      return r'THROW';
    case EnumListLengthValidateDirectivePolicy.$unknown:
      return r'$unknown';
  }
}

EnumListLengthValidateDirectivePolicy
    fromJsonEnumListLengthValidateDirectivePolicy(String value) {
  switch (value) {
    case r'RESOLVER':
      return EnumListLengthValidateDirectivePolicy.RESOLVER;
    case r'THROW':
      return EnumListLengthValidateDirectivePolicy.THROW;
    default:
      return EnumListLengthValidateDirectivePolicy.$unknown;
  }
}

enum EnumPatternValidateDirectivePolicy {
  RESOLVER,
  THROW,
  $unknown;

  factory EnumPatternValidateDirectivePolicy.fromJson(String value) =>
      fromJsonEnumPatternValidateDirectivePolicy(value);

  String toJson() => toJsonEnumPatternValidateDirectivePolicy(this);
}

String toJsonEnumPatternValidateDirectivePolicy(
    EnumPatternValidateDirectivePolicy e) {
  switch (e) {
    case EnumPatternValidateDirectivePolicy.RESOLVER:
      return r'RESOLVER';
    case EnumPatternValidateDirectivePolicy.THROW:
      return r'THROW';
    case EnumPatternValidateDirectivePolicy.$unknown:
      return r'$unknown';
  }
}

EnumPatternValidateDirectivePolicy fromJsonEnumPatternValidateDirectivePolicy(
    String value) {
  switch (value) {
    case r'RESOLVER':
      return EnumPatternValidateDirectivePolicy.RESOLVER;
    case r'THROW':
      return EnumPatternValidateDirectivePolicy.THROW;
    default:
      return EnumPatternValidateDirectivePolicy.$unknown;
  }
}

enum EnumRangeValidateDirectivePolicy {
  RESOLVER,
  THROW,
  $unknown;

  factory EnumRangeValidateDirectivePolicy.fromJson(String value) =>
      fromJsonEnumRangeValidateDirectivePolicy(value);

  String toJson() => toJsonEnumRangeValidateDirectivePolicy(this);
}

String toJsonEnumRangeValidateDirectivePolicy(
    EnumRangeValidateDirectivePolicy e) {
  switch (e) {
    case EnumRangeValidateDirectivePolicy.RESOLVER:
      return r'RESOLVER';
    case EnumRangeValidateDirectivePolicy.THROW:
      return r'THROW';
    case EnumRangeValidateDirectivePolicy.$unknown:
      return r'$unknown';
  }
}

EnumRangeValidateDirectivePolicy fromJsonEnumRangeValidateDirectivePolicy(
    String value) {
  switch (value) {
    case r'RESOLVER':
      return EnumRangeValidateDirectivePolicy.RESOLVER;
    case r'THROW':
      return EnumRangeValidateDirectivePolicy.THROW;
    default:
      return EnumRangeValidateDirectivePolicy.$unknown;
  }
}

enum EnumSelfNodeIdValidateDirectivePolicy {
  RESOLVER,
  THROW,
  $unknown;

  factory EnumSelfNodeIdValidateDirectivePolicy.fromJson(String value) =>
      fromJsonEnumSelfNodeIdValidateDirectivePolicy(value);

  String toJson() => toJsonEnumSelfNodeIdValidateDirectivePolicy(this);
}

String toJsonEnumSelfNodeIdValidateDirectivePolicy(
    EnumSelfNodeIdValidateDirectivePolicy e) {
  switch (e) {
    case EnumSelfNodeIdValidateDirectivePolicy.RESOLVER:
      return r'RESOLVER';
    case EnumSelfNodeIdValidateDirectivePolicy.THROW:
      return r'THROW';
    case EnumSelfNodeIdValidateDirectivePolicy.$unknown:
      return r'$unknown';
  }
}

EnumSelfNodeIdValidateDirectivePolicy
    fromJsonEnumSelfNodeIdValidateDirectivePolicy(String value) {
  switch (value) {
    case r'RESOLVER':
      return EnumSelfNodeIdValidateDirectivePolicy.RESOLVER;
    case r'THROW':
      return EnumSelfNodeIdValidateDirectivePolicy.THROW;
    default:
      return EnumSelfNodeIdValidateDirectivePolicy.$unknown;
  }
}

enum EnumStringLengthValidateDirectivePolicy {
  RESOLVER,
  THROW,
  $unknown;

  factory EnumStringLengthValidateDirectivePolicy.fromJson(String value) =>
      fromJsonEnumStringLengthValidateDirectivePolicy(value);

  String toJson() => toJsonEnumStringLengthValidateDirectivePolicy(this);
}

String toJsonEnumStringLengthValidateDirectivePolicy(
    EnumStringLengthValidateDirectivePolicy e) {
  switch (e) {
    case EnumStringLengthValidateDirectivePolicy.RESOLVER:
      return r'RESOLVER';
    case EnumStringLengthValidateDirectivePolicy.THROW:
      return r'THROW';
    case EnumStringLengthValidateDirectivePolicy.$unknown:
      return r'$unknown';
  }
}

EnumStringLengthValidateDirectivePolicy
    fromJsonEnumStringLengthValidateDirectivePolicy(String value) {
  switch (value) {
    case r'RESOLVER':
      return EnumStringLengthValidateDirectivePolicy.RESOLVER;
    case r'THROW':
      return EnumStringLengthValidateDirectivePolicy.THROW;
    default:
      return EnumStringLengthValidateDirectivePolicy.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'Node': {
    'App',
    'User',
    'TermVersionAgreement',
    'Term',
    'TermVersion',
    'Organization',
    'Post',
    'Playlist',
    'Video',
    'Webhook',
  },
  'HomeElement': {'HomeElementText'},
  'PostOwner': {
    'Organization',
    'User',
  },
  'MaybePost': {
    'Post',
    'RemovedPost',
  },
};
