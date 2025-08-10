# github_repository_explorer

Environment Setup 
Prerequisites
-> Flutter 3.22+ (Dart 3)
-> Android Studio / Visual Studio Code tooling
-> A GitHub Personal Access Token (optional but recommended to avoid rate limits)

Install dependencies
-> flutter pub get

Set a GitHub token 
Unauthenticated GitHub Search API is rate-limited. Pass a token at run/build time
-> flutter run --dart-define=GITHUB_TOKEN=your github token here
# or
->  IOS Build: flutter build ios  --dart-define=GITHUB_TOKEN=your github token here
->  Android build: flutter build apk  --dart-define=GITHUB_TOKEN=your github token here

Generate code (Freezed / JSON)
-> dart run build_runner build --delete-conflicting-outputs

Run 
-> flutter run


Technology Stack how many dependency I am using

-> Dio – HTTP client + interceptors (User-Agent, API version, token)
-> flutter_bloc – Presentation logic / state
-> get_it – Dependency injection
-> Hive – Lightweight key–value cache for offline/fallback
-> freezed / json_serializable – DTOs & JSON
-> rxdart – Stream operators for debounced search
-> shimmer – Skeleton loading states
-> connectivity_plus & Internet Connection checker  -> check your device connected to internet or not 
-> url_launcher - Navigate to html_url link 

Clean Layers & Structure (create using CLI)
lib/
 ├─ app/
 │   ├─ core/
 │   │   ├─ error/           # Failures (Network/Server/Cache)
 │   │   ├─ network/         # NetworkInfo (connectivity)
 │   │   └─ utils/           # Debouncer (optional)
 │   ├─ di/                  # get_it service locator
 │   ├─ theme/               # Theme data + ThemeCubit (toggle)
 │   └─ widgets/             # GlobalAppBar etc.
 ├─ features/repo_search/
 │   ├─ data/
 │   │   ├─ datasources/     # GithubRemoteDataSource, GithubLocalDataSource
 │   │   ├─ models/          # RepoDto, OwnerDto (freezed)
 │   │   └─ repositories/    # RepoRepositoryImpl
 │   ├─ domain/
 │   │   ├─ entities/        # (Optional) Repo entity
 │   │   ├─ repositories/    # RepoRepository (contract)
 │   │   └─ usecases/        # SearchRepos
 │   └─ presentation/
 │       ├─ bloc/            # RepoBloc (debounce, paging, retry)
 │       └─ pages/           # RepoListPage, RepoDetailPage + widgets
 └─ main.dart                # MaterialApp, routes, DI bootstrap

Data Flow
1. UI → Bloc
-> RepoQueryChanged debounced (via rxdart) to minimize API calls
-> RepoNextPageRequested for infinite scroll
-> RepoRetryRequested for retry

2. Bloc → UseCase → Repository
-> Repo tries remote first; on success, caches results
-> On error or offline, returns cached page if available
-> For next-page failures with no cache, returns empty list (keeps current items)
-> For first page with no cache and error/offline, surfaces a readable failure

3. UI Rendering
-> Shimmer list while loading
-> SnackBar + inline Retry on error
-> Global Theme toggle (light/dark) in the AppBar

Important Files that is overview for all the folder 
 -> app/di/injector.dart – Registers Dio, data sources, repo, use cases
-> features/repo_search/data/datasources/github_remote_data_source.dart – Search API, Dio error mapping (rate limit, HTTP codes)
-> features/repo_search/data/datasources/github_local_data_source.dart – Hive JSON cache per (query|page|size)
-> features/repo_search/presentation/bloc/repo_bloc.dart – Debounce, paging, retry with backoff, error humanization
-> features/repo_search/presentation/pages/repo_list_page.dart – Search bar, shimmer, list + footer, SnackBars
-> app/theme/theme_cubit.dart & app/widgets/global_app_bar.dart – Global theme toggle

Assumptions & Limitations
-> Unauthenticated search is heavily rate-limited.
-> Provide --dart-define=GITHUB_TOKEN=... for real usage.
-> App adds proper headers (User-Agent, GitHub API Version) and optional token.
-> “Server error” messages are mapped from Dio response; custom API errors may need additional parsing.(I have faced this problem multiple time when i was run my simulator)
-> Retry policy uses simple exponential backoff and avoids retrying on 4xx & rate limit errors.
-> Token is injected via header for rate-limit; there’s no OAuth login/PKCE or user-specific API features.



