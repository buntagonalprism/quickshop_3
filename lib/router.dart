import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'analytics/crash_reporter.dart';
import 'analytics/logger.dart';
import 'pages/favourites/favourites_page.dart';
import 'pages/home/home_page.dart';
import 'pages/lists/checklist/checklist_page.dart';
import 'pages/lists/edit_list_page.dart';
import 'pages/lists/invites/list_invite_details_page.dart';
import 'pages/lists/items/shopping_item_create_page.dart';
import 'pages/lists/items/shopping_item_edit_page.dart';
import 'pages/lists/list_detail_page.dart';
import 'pages/lists/lists_page.dart';
import 'pages/lists/new_list_page.dart';
import 'pages/lists/sharing/list_sharing_page.dart';
import 'pages/login/login_email_page.dart';
import 'pages/login/login_landing_page.dart';
import 'pages/login/login_name_page.dart';
import 'pages/not_found/not_found_page.dart';
import 'pages/recipes/new_recipe_page.dart';
import 'pages/recipes/recipe_detail_page.dart';
import 'pages/recipes/recipes_page.dart';
import 'pages/settings/settings_page.dart';
import 'repositories/user_repo.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _listsNavigatorKey = GlobalKey<NavigatorState>();

/// The invite ID when a deep link to a list invite is opened, but the user must login first
/// before viewing the invite.
String? _pendingListInviteId;

@riverpod
GoRouter router(Ref ref) {
  final loggedInNotifier = ValueNotifier<bool>(false);
  ref.listen<bool>(
    loggedInProvider,
    (_, loggedIn) => loggedInNotifier.value = loggedIn,
    fireImmediately: true,
  );
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) {
          return HomePage(navigationShell: shell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _listsNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.lists,
                builder: (context, state) => const ListsPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'new',
                    builder: (context, state) => const NewListPage(),
                  ),
                  GoRoute(
                    path: '${_RouteSegments.invites}/:${_RouteParams.inviteId}',
                    builder: (context, state) => ListInviteDetailsPage(
                      inviteId: state.pathParameters[_RouteParams.inviteId]!,
                    ),
                  ),
                  GoRoute(
                    path: '${_RouteSegments.checklist}/:${_RouteParams.listId}',
                    builder: (context, state) => ChecklistPage(
                      listId: state.pathParameters[_RouteParams.listId]!,
                    ),
                  ),
                  GoRoute(
                    path: ':${_RouteParams.listId}',
                    builder: (context, state) => ListDetailPage(
                      listId: state.pathParameters[_RouteParams.listId]!,
                    ),
                    routes: [
                      GoRoute(
                        path: _RouteSegments.share,
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) => ListSharingPage(
                          listId: state.pathParameters[_RouteParams.listId]!,
                        ),
                      ),
                      GoRoute(
                        path: '${_RouteSegments.items}/${_RouteSegments.shopping}/new',
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) => ShoppingItemCreatePage(
                          listId: state.pathParameters[_RouteParams.listId]!,
                        ),
                      ),
                      GoRoute(
                        path:
                            '${_RouteSegments.items}/${_RouteSegments.shopping}/:${_RouteParams.itemId}',
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) => ShoppingItemEditPage(
                          listId: state.pathParameters[_RouteParams.listId]!,
                          itemId: state.pathParameters[_RouteParams.itemId]!,
                        ),
                      ),
                      GoRoute(
                        path: _RouteSegments.edit,
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) => EditListPage(
                          listId: state.pathParameters[_RouteParams.listId]!,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.recipes,
                builder: (context, state) => const RecipesPage(),
                routes: [
                  GoRoute(
                    path: 'new',
                    builder: (context, state) => const NewRecipePage(),
                  ),
                  GoRoute(
                    path: ':${_RouteParams.recipeId}',
                    builder: (context, state) => RecipeDetailPage(
                      recipeId: state.pathParameters[_RouteParams.recipeId]!,
                    ),
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.favourites,
                builder: (context, state) => const FavouritesPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginLandingPage(
          greetingType: LoginGreetingType.none,
        ),
        routes: [
          GoRoute(
            path: _RouteSegments.email,
            builder: (context, state) => const LoginEmailPage(),
          ),
          GoRoute(
            path: _RouteSegments.setName,
            builder: (context, state) => const LoginNamePage(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.loginForInvite,
        builder: (context, state) => const LoginLandingPage(
          greetingType: LoginGreetingType.forInvite,
        ),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: Routes.notFound,
        builder: (context, state) => const NotFoundPage(),
      ),
    ],
    refreshListenable: loggedInNotifier,
    redirect: (context, state) {
      // Handle unauthenticated users
      if (!loggedInNotifier.value) {
        // Redirect unauthenticated users who have opened a list invite link to login first
        if (state.uri.path.startsWith(Routes.listInviteDetails(''))) {
          ref.read(loggerProvider).log('Redirecting unauthenticated user to login');

          // Store the invite ID so the user can be redirected to the invite details after login
          _pendingListInviteId = state.uri.pathSegments.last;
          return Routes.loginForInvite;
        }

        // Redirect unauthenticated users to login
        if (!state.uri.path.startsWith(Routes.login)) {
          ref.read(loggerProvider).log('Redirecting unauthenticated user to login');
          return Routes.login;
        }
      }

      // Handle redirection after login flow completed
      if (state.uri.path == Routes.postLogin) {
        // Redirect users that had opened a list invite link to view the invite details
        if (_pendingListInviteId != null) {
          final inviteId = _pendingListInviteId!;
          _pendingListInviteId = null;
          return Routes.listInviteDetails(inviteId);
        }

        // Otherwise redirect to the lists page
        return Routes.lists;
      }

      // Redirect home to lists subpath
      if (state.uri.path == _RouteSegments.home) {
        return Routes.lists;
      }
      return null;
    },
    observers: [
      SentryNavigatorObserver(),
    ],
    // Handle unknown routes with the not found page
    onException: (context, state, router) {
      ref.read(crashReporterProvider).report(state.error, StackTrace.current);
      router.go(Routes.notFound);
    },
  );
  ref.onDispose(loggedInNotifier.dispose);
  ref.onDispose(router.dispose);
  return router;
}

class _RouteParams {
  static const listId = 'listId';
  static const recipeId = 'recipeId';
  static const inviteId = 'inviteId';
  static const itemId = 'itemId';
}

class _RouteSegments {
  static const home = '/';
  static const login = 'login';
  static const setName = 'set-name';
  static const email = 'email';
  static const settings = 'settings';
  static const lists = 'lists';
  static const recipes = 'recipes';
  static const favourites = 'favourites';
  static const newItem = 'new';
  static const edit = 'edit';
  static const share = 'share';
  static const notFound = 'not-found';
  static const invites = 'invites';
  static const items = 'items';
  static const shopping = 'shopping';
  static const checklist = 'checklist';
}

/// There is no dedicated home page, only the subpages like /lists, /recipes, etc, so there is no
/// home route. On opening the application, the default route "/" is redirected to the /lists page.
class Routes {
  static const login = '/${_RouteSegments.login}';

  /// A path that does not correspond to an actual page, but which allows the redirect routing logic
  /// to decide which page the user should be redirected to after logging in.
  static const postLogin = '/post-login';

  static const loginForInvite = '/${_RouteSegments.login}-invite';
  static const loginEmail = '$login/${_RouteSegments.email}';
  static const loginSetName = '$login/${_RouteSegments.setName}';

  static const settings = '/${_RouteSegments.settings}';
  static const lists = '/${_RouteSegments.lists}';
  static const newList = '$lists/${_RouteSegments.newItem}';

  static RoutePath checklistDetail(String listId) => RoutePath([
        _RouteSegments.lists,
        _RouteSegments.checklist,
        listId,
      ]);

  static RoutePath checklistNewItem(String listId) => checklistDetail(listId).extend([
        _RouteSegments.items,
        _RouteSegments.newItem,
      ]);

  static RoutePath checklistEditItem(String listId, String itemId) =>
      checklistDetail(listId).extend([
        _RouteSegments.items,
        itemId,
      ]);

  static String listDetail(String listId) => '$lists/$listId';
  static String editList(String listId) => '${listDetail(listId)}/${_RouteSegments.edit}';
  static String newShoppingListItem(String listId) =>
      '${listDetail(listId)}/${_RouteSegments.items}/${_RouteSegments.shopping}/${_RouteSegments.newItem}';
  static String editShoppingListItem(String listId, String itemId) =>
      '${listDetail(listId)}/${_RouteSegments.items}/${_RouteSegments.shopping}/$itemId';
  static String shareList(String listId) => '${listDetail(listId)}/${_RouteSegments.share}';

  static const recipes = '/${_RouteSegments.recipes}';
  static const newRecipe = '${Routes.recipes}/${_RouteSegments.newItem}';
  static String recipeDetail(String recipeId) => '${Routes.recipes}/$recipeId';

  static const favourites = '/${_RouteSegments.favourites}';
  static const notFound = '/${_RouteSegments.notFound}';
  static String listInviteDetails(String inviteId) => '$lists/${_RouteSegments.invites}/$inviteId';
}

class RoutePath {
  RoutePath(this.segments) : path = '/${segments.join('/')}';
  RoutePath.extend(RoutePath parent, List<String> segments)
      : this([...parent.segments, ...segments]);

  final List<String> segments;
  final String path;

  RoutePath extend(List<String> segments) => RoutePath([...this.segments, ...segments]);
}
