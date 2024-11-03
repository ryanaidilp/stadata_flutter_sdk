abstract class BaseConverter<Json, T> {
  T fromJson(Json json);
  Json toJson(T object);
}
