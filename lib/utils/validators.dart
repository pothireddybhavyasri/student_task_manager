class Validators {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Task title is required";
    }
    return null;
  }
}