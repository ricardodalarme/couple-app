import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Supabase Auth error codes a client can receive, from
/// https://supabase.com/docs/guides/auth/debugging/error-codes.
const List<String> _documentedCodes = [
  'anonymous_provider_disabled',
  'bad_code_verifier',
  'bad_json',
  'bad_jwt',
  'bad_oauth_callback',
  'bad_oauth_state',
  'captcha_failed',
  'conflict',
  'email_address_invalid',
  'email_address_not_authorized',
  'email_conflict_identity_not_deletable',
  'email_exists',
  'email_not_confirmed',
  'email_provider_disabled',
  'flow_state_expired',
  'flow_state_not_found',
  'hook_payload_invalid_content_type',
  'hook_payload_over_size_limit',
  'hook_timeout',
  'hook_timeout_after_retry',
  'identity_already_exists',
  'identity_not_found',
  'insufficient_aal',
  'invalid_credentials',
  'invite_not_found',
  'manual_linking_disabled',
  'mfa_challenge_expired',
  'mfa_factor_name_conflict',
  'mfa_factor_not_found',
  'mfa_ip_address_mismatch',
  'mfa_phone_enroll_not_enabled',
  'mfa_phone_verify_not_enabled',
  'mfa_totp_enroll_not_enabled',
  'mfa_totp_verify_not_enabled',
  'mfa_verification_failed',
  'mfa_verification_rejected',
  'mfa_verified_factor_exists',
  'mfa_web_authn_enroll_not_enabled',
  'mfa_web_authn_verify_not_enabled',
  'no_authorization',
  'oauth_provider_not_supported',
  'otp_disabled',
  'otp_expired',
  'over_email_send_rate_limit',
  'over_request_rate_limit',
  'over_sms_send_rate_limit',
  'phone_exists',
  'phone_not_confirmed',
  'phone_provider_disabled',
  'provider_disabled',
  'provider_email_needs_verification',
  'reauthentication_needed',
  'reauthentication_not_valid',
  'refresh_token_already_used',
  'refresh_token_not_found',
  'request_timeout',
  'same_password',
  'saml_assertion_no_email',
  'saml_assertion_no_user_id',
  'saml_idp_not_found',
  'saml_provider_disabled',
  'saml_relay_state_expired',
  'saml_relay_state_not_found',
  'session_expired',
  'session_not_found',
  'signup_disabled',
  'single_identity_not_deletable',
  'sms_send_failed',
  'sso_provider_not_found',
  'too_many_enrolled_mfa_factors',
  'unexpected_failure',
  'user_already_exists',
  'user_banned',
  'user_not_found',
  'user_sso_managed',
  'validation_failed',
  'weak_password',
];

/// App-level codes carried alongside the Supabase ones.
const Set<String> _extraCodes = {'NETWORK', 'other'};

void main() {
  group('authentication error map', () {
    final en = _errorMap('lib/l10n/en/authentication.json');
    final pt = _errorMap('lib/l10n/pt/authentication.json');

    test('every documented code has copy in both locales', () {
      for (final code in _documentedCodes) {
        expect(en[code], isNotEmpty, reason: 'en is missing "$code"');
        expect(pt[code], isNotEmpty, reason: 'pt is missing "$code"');
      }
    });

    test('both locales fall back to other', () {
      expect(en['other'], isNotEmpty);
      expect(pt['other'], isNotEmpty);
    });

    test('both locales carry the same codes', () {
      expect(pt.keys.toSet(), en.keys.toSet());
    });

    test('no code outside the documented snapshot', () {
      final known = {..._documentedCodes, ..._extraCodes};

      expect(en.keys.toSet().difference(known), isEmpty);
    });
  });
}

Map<String, String> _errorMap(String path) {
  final json = jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;

  return (json['errors(map)'] as Map<String, dynamic>).cast<String, String>();
}
