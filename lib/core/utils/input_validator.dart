class InputValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    if (value.length < 2) {
      return 'Name is too short';
    }
    return null;
  }

  static String? validateAnalysisText(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text to analyze';
    }
    if (value.trim().split(' ').length < 3) {
      return 'Please enter at least 3 words for a better analysis';
    }
    if (value.length > 5000) {
      return 'Text is too long (max 5000 characters)';
    }
    return null;
  }

  static String? validateDietNotes(String? value) {
    if (value != null && value.length > 500) {
      return 'Notes are too long (max 500 characters)';
    }
    return null;
  }

  static String? validateMinutes(String? value) {
    if (value == null || value.isEmpty) {
      return 'Duration is required';
    }
    final minutes = int.tryParse(value);
    if (minutes == null) {
      return 'Please enter a valid number';
    }
    if (minutes <= 0) {
      return 'Duration must be greater than 0';
    }
    if (minutes > 1440) {
      return 'Duration cannot exceed 24 hours (1440 mins)';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value != null && value.isNotEmpty) {
      final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
      if (!phoneRegex.hasMatch(value)) {
        return 'Please enter a valid phone number';
      }
    }
    return null;
  }

  static String sanitize(String input) {
    return input.replaceAll(RegExp(r'[\x00-\x1F\x7F]'), '').trim();
  }
}
