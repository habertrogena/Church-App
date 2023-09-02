class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "an unknown error occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'please enter a strong password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'email is not valid or badly formatted');
      case 'email- already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exist for that email');
      case 'operation-not -allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'operation is not allowed please contact support');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'this user has been disabled please contact support');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
