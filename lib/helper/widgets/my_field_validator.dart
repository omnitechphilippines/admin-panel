typedef MyFieldValidator<T> = String? Function(T? value);

abstract class MyFieldValidatorRule<T> {
  String? validate(T? value, bool required, Map<String, Object?> data);
}
