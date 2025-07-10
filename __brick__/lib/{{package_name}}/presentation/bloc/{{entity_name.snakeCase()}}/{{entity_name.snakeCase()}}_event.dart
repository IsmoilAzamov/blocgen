{{#has_create}}
import 'package:{{package_name}}/{{package_name}}/domain/entities/{{entity_name.snakeCase()}}/{{entity_name.snakeCase()}}_entity.dart';
{{/has_create}}
{{#has_update}}
{{^has_create}}
import 'package:{{package_name}}/{{package_name}}/domain/entities/{{entity_name.snakeCase()}}/{{entity_name.snakeCase()}}_entity.dart';
{{/has_create}}
{{/has_update}}

sealed class {{entity_name.pascalCase()}}Event {}

{{#has_get_list}}
class {{entity_name.pascalCase()}}LoadListEvent extends {{entity_name.pascalCase()}}Event {}
{{/has_get_list}}

{{#has_get_by_id}}
class {{entity_name.pascalCase()}}LoadEvent extends {{entity_name.pascalCase()}}Event {
final int id;

{{entity_name.pascalCase()}}LoadEvent({required this.id});
}
{{/has_get_by_id}}

{{#has_create}}
class {{entity_name.pascalCase()}}CreateEvent extends {{entity_name.pascalCase()}}Event {
final {{entity_name.pascalCase()}}Entity entity;

{{entity_name.pascalCase()}}CreateEvent({required this.entity});
}
{{/has_create}}

{{#has_update}}
class {{entity_name.pascalCase()}}UpdateEvent extends {{entity_name.pascalCase()}}Event {
final {{entity_name.pascalCase()}}Entity entity;

{{entity_name.pascalCase()}}UpdateEvent({required this.entity});
}
{{/has_update}}

{{#has_delete}}
class {{entity_name.pascalCase()}}DeleteEvent extends {{entity_name.pascalCase()}}Event {
final int id;

{{entity_name.pascalCase()}}DeleteEvent({required this.id});
}
{{/has_delete}}

{{#has_search}}
class {{entity_name.pascalCase()}}SearchEvent extends {{entity_name.pascalCase()}}Event {
final String query;

{{entity_name.pascalCase()}}SearchEvent({required this.query});
}
{{/has_search}}