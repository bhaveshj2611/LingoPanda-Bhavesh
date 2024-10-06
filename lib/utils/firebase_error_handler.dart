// lib/utils/error_handler.dart

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      print(error.code);
      switch (error.code) {
        case 'claims-too-large':
          return 'The claims payload is too large. Please reduce the size and try again.';
        case 'email-already-in-use':
          return 'The email address is already in use. Please use a different email.';
        case 'id-token-expired':
          return 'Your session has expired. Please sign in again.';
        case 'id-token-revoked':
          return 'Your session has been revoked. Please sign in again.';
        case 'insufficient-permission':
          return 'Insufficient permissions to access this resource.';
        case 'internal-error':
          return 'An internal error occurred. Please try again later.';
        case 'invalid-argument':
          return 'An invalid argument was provided. Please check your inputs.';
        case 'invalid-claims':
          return 'The provided custom claims are invalid.';
        case 'invalid-continue-uri':
          return 'The continue URL is invalid. Please provide a valid URL.';
        case 'invalid-creation-time':
          return 'The creation time must be a valid UTC date string.';
        case 'invalid-credential':
          return 'The provided credential is invalid.';
        case 'invalid-disabled-field':
          return 'Invalid value for the disabled user property.';
        case 'invalid-display-name':
          return 'The provided display name is invalid. It must be a non-empty string.';
        case 'invalid-dynamic-link-domain':
          return 'The dynamic link domain is not authorized for this project.';
        case 'invalid-email':
          return 'The email address is badly formatted.';
        case 'invalid-email-verified':
          return 'The email verification status is invalid.';
        case 'invalid-hash-algorithm':
          return 'The hash algorithm is invalid.';
        case 'invalid-hash-block-size':
          return 'The hash block size must be a valid number.';
        case 'invalid-hash-derived-key-length':
          return 'The hash derived key length must be a valid number.';
        case 'invalid-hash-key':
          return 'The hash key is invalid.';
        case 'invalid-hash-memory-cost':
          return 'The hash memory cost must be a valid number.';
        case 'invalid-hash-parallelization':
          return 'The hash parallelization must be a valid number.';
        case 'invalid-hash-rounds':
          return 'The hash rounds must be a valid number.';
        case 'invalid-hash-salt-separator':
          return 'The salt separator must be a valid byte buffer.';
        case 'invalid-id-token':
          return 'The provided ID token is not valid.';
        case 'invalid-last-sign-in-time':
          return 'The last sign-in time is invalid.';
        case 'invalid-password':
          return 'The password is invalid. It must be at least six characters.';
        case 'invalid-phone-number':
          return 'The phone number is invalid. It must comply with the E.164 standard.';
        case 'invalid-photo-url':
          return 'The photo URL is invalid.';
        case 'invalid-provider-id':
          return 'The provider ID is not supported.';
        case 'maximum-user-count-exceeded':
          return 'The maximum number of users has been exceeded.';
        case 'missing-android-pkg-name':
          return 'An Android package name is required.';
        case 'missing-continue-uri':
          return 'A valid continue URL must be provided.';
        case 'missing-hash-algorithm':
          return 'The hashing algorithm is required for importing users with password hashes.';
        case 'missing-ios-bundle-id':
          return 'A Bundle ID is required for iOS.';
        case 'missing-uid':
          return 'A UID is required for this operation.';
        case 'operation-not-allowed':
          return 'This sign-in provider is disabled. Please enable it in the Firebase console.';
        case 'phone-number-already-exists':
          return 'This phone number is already in use by another user.';
        case 'project-not-found':
          return 'No Firebase project was found. Please check your credentials.';
        case 'reserved-claims':
          return 'Some custom user claims are reserved and cannot be used.';
        case 'session-cookie-expired':
          return 'The session cookie has expired. Please sign in again.';
        case 'session-cookie-revoked':
          return 'The session cookie has been revoked. Please sign in again.';
        case 'too-many-requests':
          return 'Too many requests. Please try again later.';
        case 'uid-already-exists':
          return 'The UID is already in use by another user.';
        case 'unauthorized-continue-uri':
          return 'The domain of the continue URL is not authorized.';
        case 'user-not-found':
          return 'No user found for the provided identifier.';
        default:
          return 'An error occurred. Please try again.';
      }
    } else if (error is Exception) {
      return error.toString().replaceAll('Exception: ', '');
    }
    return 'An unknown error occurred.';
  }
}
