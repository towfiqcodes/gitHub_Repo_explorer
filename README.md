# github_repository_explorer</br>

Environment Setup </br>
**Prerequisites**</br>
-> Flutter 3.22+ (Dart 3)</br>
-> Android Studio / Visual Studio Code tooling</br>
-> A GitHub Personal Access Token (optional but recommended to avoid rate limits)</br>

**Install dependencies**</br>
-> flutter pub get</br>

**Set a GitHub token** </br>
Unauthenticated GitHub Search API is rate-limited. Pass a token at run/build time</br>
-> flutter run --dart-define=GITHUB_TOKEN=your github token here</br>
 or</br>
->  IOS Build: flutter build ios  --dart-define=GITHUB_TOKEN=your github token here</br>
->  Android build: flutter build apk  --dart-define=GITHUB_TOKEN=your github token here</br>

**Generate code (Freezed / JSON)**</br>
-> dart run build_runner build --delete-conflicting-outputs</br>

**Run** 
-> flutter run</br>


**Technology Stack how many dependency I am using**</br>

-> Dio – HTTP client + interceptors (User-Agent, API version, token)</br>
-> flutter_bloc – Presentation logic / state</br>
-> get_it – Dependency injection</br>
-> Hive – Lightweight key–value cache for offline/fallback</br>
-> freezed / json_serializable – DTOs & JSON</br>
-> rxdart – Stream operators for debounced search</br>
-> shimmer – Skeleton loading states</br>
-> connectivity_plus & Internet Connection checker  -> check your device connected to internet or not </br>
-> url_launcher - Navigate to html_url link </br>

**Clean Layers & Structure (create using CLI)**</br>

![codeSnap](https://github.com/user-attachments/assets/8faf30db-3502-4c6f-8e82-3299167a7ebf)


**Data Flow**</br>
1. UI → Bloc</br>
-> RepoQueryChanged debounced (via rxdart) to minimize API calls</br>
-> RepoNextPageRequested for infinite scroll</br>
-> RepoRetryRequested for retry</br>

2. Bloc → UseCase → Repository</br>
-> Repo tries remote first; on success, caches results</br>
-> On error or offline, returns cached page if available</br>
-> For next-page failures with no cache, returns empty list (keeps current items)</br>
-> For first page with no cache and error/offline, surfaces a readable failure</br>

3. UI Rendering</br>
-> Shimmer list while loading</br>
-> SnackBar + inline Retry on error</br>
-> Global Theme toggle (light/dark) in the AppBar</br>

Important Files that is overview for all the folder </br>
 -> app/di/injector.dart – Registers Dio, data sources, repo, use cases</br>
-> features/repo_search/data/datasources/github_remote_data_source.dart – Search API, Dio error mapping (rate limit, HTTP codes)</br>
-> features/repo_search/data/datasources/github_local_data_source.dart – Hive JSON cache per (query|page|size)</br>
-> features/repo_search/presentation/bloc/repo_bloc.dart – Debounce, paging, retry with backoff, error humanization</br>
-> features/repo_search/presentation/pages/repo_list_page.dart – Search bar, shimmer, list + footer, SnackBars</br>
-> app/theme/theme_cubit.dart & app/widgets/global_app_bar.dart – Global theme toggle</br>

Assumptions & Limitations</br>
-> Unauthenticated search is heavily rate-limited.</br>
-> Provide --dart-define=GITHUB_TOKEN=... for real usage.</br>
-> App adds proper headers (User-Agent, GitHub API Version) and optional token.</br>
-> “Server error” messages are mapped from Dio response; custom API errors may need additional parsing.(I have faced this problem multiple time when i was run my simulator)</br>
-> Retry policy uses simple exponential backoff and avoids retrying on 4xx & rate limit errors.</br>
-> Token is injected via header for rate-limit; there’s no OAuth login/PKCE or user-specific API features.</br>



