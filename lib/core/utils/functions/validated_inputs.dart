String? validateInput(String? value, [String errorMessage = 'This field is required']) {
  if (value == null || value.trim().isEmpty) {
    return errorMessage;
  }
  return null;
}
