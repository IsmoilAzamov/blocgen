import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{package_name}}/{{package_name}}/domain/repositories/{{entity_name.snakeCase()}}_repository.dart';
import 'package:{{package_name}}/core/resources/datastate.dart';

import '{{entity_name.snakeCase()}}_event.dart';
import '{{entity_name.snakeCase()}}_state.dart';

class {{entity_name.pascalCase()}}Bloc extends Bloc<{{entity_name.pascalCase()}}Event, {{entity_name.pascalCase()}}State> {
final {{entity_name.pascalCase()}}Repository _repository;

{{entity_name.pascalCase()}}Bloc(this._repository) : super({{entity_name.pascalCase()}}InitialState()) {
{{#has_get_list}}
on<{{entity_name.pascalCase()}}LoadListEvent>(_loadList);
{{/has_get_list}}
{{#has_get_by_id}}
on<{{entity_name.pascalCase()}}LoadEvent>(_load);
{{/has_get_by_id}}
{{#has_create}}
on<{{entity_name.pascalCase()}}CreateEvent>(_create);
{{/has_create}}
{{#has_update}}
on<{{entity_name.pascalCase()}}UpdateEvent>(_update);
{{/has_update}}
{{#has_delete}}
on<{{entity_name.pascalCase()}}DeleteEvent>(_delete);
{{/has_delete}}
{{#has_search}}
on<{{entity_name.pascalCase()}}SearchEvent>(_search);
{{/has_search}}
}

{{#has_get_list}}
Future<void> _loadList({{entity_name.pascalCase()}}LoadListEvent event, Emitter<{{entity_name.pascalCase()}}State> emit) async {
emit({{entity_name.pascalCase()}}LoadingState());

try {
final result = await _repository.getList();

if (result is DataSuccess && result.data != null) {
emit({{entity_name.pascalCase()}}ListLoadedState(items: result.data!));
return;
} else if (result is DataError) {
print(result.error?.message);
emit({{entity_name.pascalCase()}}ErrorState(
result.error?.error.toString() ?? "something_went_wrong".tr(),
));
return;
}
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
} catch (e, stackTrace) {
print(e);
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
}
}
{{/has_get_list}}

{{#has_get_by_id}}
Future<void> _load({{entity_name.pascalCase()}}LoadEvent event, Emitter<{{entity_name.pascalCase()}}State> emit) async {
emit({{entity_name.pascalCase()}}LoadingState());

try {
final result = await _repository.getById(event.id);

if (result is DataSuccess && result.data != null) {
emit({{entity_name.pascalCase()}}LoadedState({{entity_name.camelCase()}}: result.data!));
return;
} else if (result is DataError) {
print(result.error?.message);
emit({{entity_name.pascalCase()}}ErrorState(
result.error?.error.toString() ?? "something_went_wrong".tr(),
));
return;
}
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
} catch (e, stackTrace) {
print(e);
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
}
}
{{/has_get_by_id}}

{{#has_create}}
Future<void> _create({{entity_name.pascalCase()}}CreateEvent event, Emitter<{{entity_name.pascalCase()}}State> emit) async {
emit({{entity_name.pascalCase()}}LoadingState());

try {
final result = await _repository.create(event.entity);

if (result is DataSuccess && result.data != null) {
emit({{entity_name.pascalCase()}}CreatedState({{entity_name.camelCase()}}: result.data!));
return;
} else if (result is DataError) {
print(result.error?.message);
emit({{entity_name.pascalCase()}}ErrorState(
result.error?.error.toString() ?? "something_went_wrong".tr(),
));
return;
}
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
} catch (e, stackTrace) {
print(e);
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
}
}
{{/has_create}}

{{#has_update}}
Future<void> _update({{entity_name.pascalCase()}}UpdateEvent event, Emitter<{{entity_name.pascalCase()}}State> emit) async {
emit({{entity_name.pascalCase()}}LoadingState());

try {
final result = await _repository.update(event.entity);

if (result is DataSuccess && result.data != null) {
emit({{entity_name.pascalCase()}}UpdatedState({{entity_name.camelCase()}}: result.data!));
return;
} else if (result is DataError) {
print(result.error?.message);
emit({{entity_name.pascalCase()}}ErrorState(
result.error?.error.toString() ?? "something_went_wrong".tr(),
));
return;
}
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
} catch (e, stackTrace) {
print(e);
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
}
}
{{/has_update}}

{{#has_delete}}
Future<void> _delete({{entity_name.pascalCase()}}DeleteEvent event, Emitter<{{entity_name.pascalCase()}}State> emit) async {
emit({{entity_name.pascalCase()}}LoadingState());

try {
final result = await _repository.delete(event.id);

if (result is DataSuccess && result.data == true) {
emit({{entity_name.pascalCase()}}DeletedState(deletedId: event.id));
return;
} else if (result is DataError) {
print(result.error?.message);
emit({{entity_name.pascalCase()}}ErrorState(
result.error?.error.toString() ?? "something_went_wrong".tr(),
));
return;
}
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
} catch (e, stackTrace) {
print(e);
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
}
}
{{/has_delete}}

{{#has_search}}
Future<void> _search({{entity_name.pascalCase()}}SearchEvent event, Emitter<{{entity_name.pascalCase()}}State> emit) async {
emit({{entity_name.pascalCase()}}LoadingState());

try {
final result = await _repository.search(event.query);

if (result is DataSuccess && result.data != null) {
emit({{entity_name.pascalCase()}}SearchResultState(results: result.data!));
return;
} else if (result is DataError) {
print(result.error?.message);
emit({{entity_name.pascalCase()}}ErrorState(
result.error?.error.toString() ?? "something_went_wrong".tr(),
));
return;
}
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
} catch (e, stackTrace) {
print(e);
emit({{entity_name.pascalCase()}}ErrorState("something_went_wrong".tr()));
}
}
{{/has_search}}
}