abstract class BaseConverter<Json, T> {
  const BaseConverter();
  T fromJson(Json json);
  Json toJson(T object);
}
