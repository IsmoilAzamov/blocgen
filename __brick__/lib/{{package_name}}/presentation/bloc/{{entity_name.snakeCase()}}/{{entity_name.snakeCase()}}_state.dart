import 'package:{{package_name}}/{{package_name}}/domain/entities/{{entity_name.snakeCase()}}/{{entity_name.snakeCase()}}_entity.dart';

sealed class {{entity_name.pascalCase()}}State {}

class {{entity_name.pascalCase()}}InitialState extends {{entity_name.pascalCase()}}State {}

class {{entity_name.pascalCase()}}LoadingState extends {{entity_name.pascalCase()}}State {}

{{#has_get_list}}
class {{entity_name.pascalCase()}}ListLoadedState extends {{entity_name.pascalCase()}}State {
final List<{{entity_name.pascalCase()}}Entity> items;

{{entity_name.pascalCase()}}ListLoadedState({required this.items});
}
{{/has_get_list}}

{{#has_get_by_id}}
class {{entity_name.pascalCase()}}LoadedState extends {{entity_name.pascalCase()}}State {
final {{entity_name.pascalCase()}}Entity {{entity_name.camelCase()}};

{{entity_name.pascalCase()}}LoadedState({required this.{{entity_name.camelCase()}}});
}
{{/has_get_by_id}}

{{#has_create}}
class {{entity_name.pascalCase()}}CreatedState extends {{entity_name.pascalCase()}}State {
final {{entity_name.pascalCase()}}Entity {{entity_name.camelCase()}};

{{entity_name.pascalCase()}}CreatedState({required this.{{entity_name.camelCase()}}});
}
{{/has_create}}

{{#has_update}}
class {{entity_name.pascalCase()}}UpdatedState extends {{entity_name.pascalCase()}}State {
final {{entity_name.pascalCase()}}Entity {{entity_name.camelCase()}};

{{entity_name.pascalCase()}}UpdatedState({required this.{{entity_name.camelCase()}}});
}
{{/has_update}}

{{#has_delete}}
class {{entity_name.pascalCase()}}DeletedState extends {{entity_name.pascalCase()}}State {
final int deletedId;

{{entity_name.pascalCase()}}DeletedState({required this.deletedId});
}
{{/has_delete}}

{{#has_search}}
class {{entity_name.pascalCase()}}SearchResultState extends {{entity_name.pascalCase()}}State {
final List<{{entity_name.pascalCase()}}Entity> results;

{{entity_name.pascalCase()}}SearchResultState({required this.results});
}
{{/has_search}}

class {{entity_name.pascalCase()}}ErrorState extends {{entity_name.pascalCase()}}State {
final String message;

{{entity_name.pascalCase()}}ErrorState(this.message);
}