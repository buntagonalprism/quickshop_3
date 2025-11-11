import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../models/list_summary.dart';

part 'analytics.g.dart';

@riverpod
Analytics analytics(Ref ref) {
  return Analytics._();
}

class Analytics {
  Analytics._();

  void logEvent(AnalyticsEvent event) {
    if (kDebugMode) {
      print('QSLog-Analytics: ${event.name} ${event.parameters}');
    } else {
      unawaited(FirebaseAnalytics.instance.logEvent(
        name: event.name,
        parameters: event.parameters,
      ));
      Sentry.addBreadcrumb(Breadcrumb(
        message: event.name,
        data: event.parameters,
        level: SentryLevel.info,
      ));
    }
  }
}

class AnalyticsEvent {
  final String name;
  final Map<String, Object> parameters;

  const AnalyticsEvent._(this.name, this.parameters);

  const AnalyticsEvent.registeredEmail() : this._('registered_email', const {});

  const AnalyticsEvent.loginEmail() : this._('login_email', const {});

  const AnalyticsEvent.loginGoogle() : this._('login_google', const {});

  const AnalyticsEvent.logout() : this._('logout', const {});

  AnalyticsEvent.listCreated(ListType type) : this._('list_created', {'type': type.name});

  AnalyticsEvent.listRenamed(ListType type) : this._('list_renamed', {'type': type.name});

  AnalyticsEvent.listDeleted(ListType type) : this._('list_deleted', {'type': type.name});

  AnalyticsEvent.listInviteCreated(ListType type) : this._('list_invite_created', {'type': type.name});

  AnalyticsEvent.listInviteAccepted(ListType type) : this._('list_invite_accepted', {'type': type.name});

  AnalyticsEvent.listInviteDeleted(ListType type) : this._('list_invite_deleted', {'type': type.name});

  AnalyticsEvent.listLeft(ListType type) : this._('list_left', {'type': type.name});

  const AnalyticsEvent.shoppingItemCreated() : this._('shopping_item_created', const {});

  const AnalyticsEvent.shoppingItemUpdated() : this._('shopping_item_updated', const {});

  const AnalyticsEvent.shoppingItemDeleted() : this._('shopping_item_deleted', const {});

  const AnalyticsEvent.shoppingItemsBatchDeleted() : this._('shopping_items_batch_deleted', const {});

  const AnalyticsEvent.checklistItemCreated() : this._('checklist_item_created', const {});
  const AnalyticsEvent.checklistItemUpdated() : this._('checklist_item_updated', const {});
  const AnalyticsEvent.checklistItemDeleted() : this._('checklist_item_deleted', const {});

  const AnalyticsEvent.checklistHeadingCreated() : this._('checklist_heading_created', const {});
  const AnalyticsEvent.checklistHeadingUpdated() : this._('checklist_heading_updated', const {});
  const AnalyticsEvent.checklistHeadingDeleted() : this._('checklist_heading_deleted', const {});

  const AnalyticsEvent.checklistEntryMoved() : this._('checklist_entry_moved', const {});

  const AnalyticsEvent.checklistItemsBatchDeleted() : this._('checklist_items_batch_deleted', const {});
  const AnalyticsEvent.checklistItemsBatchUnchecked() : this._('checklist_items_batch_unchecked', const {});
  AnalyticsEvent.checklistDuplicateSortKeysDetected(int count)
      : this._('checklist_duplicate_sort_keys_detected', {'count': count});

  AnalyticsEvent.httpRetry({required String uri, required String reason})
      : this._('http_retry', {
          'uri': uri,
          'reason': reason,
        });

  AnalyticsEvent.httpConnectionError({required String uri, required int statusCode, required String errorMessage})
      : this._('http_connection_error', {
          'uri': uri,
          'status_code': statusCode,
          'error_message': errorMessage,
        });

  AnalyticsEvent.loginFailed({required String errorCode, required String errorMessage})
      : this._('login_failed', {
          'error_code': errorCode,
          'error_message': errorMessage,
        });
}
