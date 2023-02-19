abstract class SiginUpError implements Exception {}

class WeakPasswordError implements SiginUpError {}

class EmailAlreadyInUseError implements SiginUpError {}

class InvalidEmailError implements SiginUpError {}

class DifferentPasswordsError implements SiginUpError {}
