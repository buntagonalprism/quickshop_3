# Quickshop 3

My third complete rewrite of the Quickshop app. Using the following stack:
- Global state: Riverpod
- Local state: TODO: Hooks
- Navigation: Go Router
- Authentication: Firebase auth
- Data sync: Firestore
- Local data storage: SQFlite
- Local preferences data: Shared preferences
- UI Theme: material 3
- HTTP: TBD

## Naming Conventions
- `services`: Services are wrappers around accessing external systems like databases, HTTP calls, and authentication. 
- `models`: Data models used by the application. All models use [freezed](https://pub.dev/packages/freezed) for immutability and equality generation. 
- `repositories`: Repositories are [Riverpod](https://riverpod.dev/) `providers` which provide access to fetch and query data models, and may also support update operations as well. Repositories are intended to be used across multiple pages. 
- `pages`: Pages define top-level widgets within the app; a page is either a fullscreen widget, or a widget which fills the contents of a tabbed view. 
- `view models`: View models agregate data from repositories and services, transforming the data for presentation in a page. A view model should only be used by its page. Depending on the requirements of the page, the view model may be either a data-only [freezed union class](https://pub.dev/packages/freezed#union-types), or class with both data and methods. 

## Setup

### Flutter Version Manager (FVM)
This project uses Flutter Version Manager (FVM) to allow using different flutter versions in different projects on a single machine. 

1. [Install Flutter](https://docs.flutter.dev/get-started/install)
1. [Install FVM](https://fvm.app/documentation/getting-started/installation)
2. Install the project specific flutter version by running `fvm install` on the command line

FVM will download and install the Flutter SDK version specified in the `.fvmrc` file, caching that Flutter version globally on your machine. It then creates a folder `.fvm` with symbolic links to the global install location. The settings in `.vscode/settings.json` specify that the Flutter extension for VSCode should use the Flutter SDK installed by FVM. 

### Android Studio
Android Studio 2024.2.1 started using Open JDK version 21 as its bundled java development kit. With Flutter 3.24.3 this produced [compile errors similar to this issue](https://github.com/flutter/flutter/issues/156304) upon adding the google sign in plugin.  

[Changes suggested in this comment](https://github.com/flutter/flutter/issues/156304#issuecomment-2397707812) resovled the issue by bumping gradle and java versions, so upgrading to at least Android Studio 2024.2.1 is advisable to prevent compilation issues. 

### App Secrets
Sensitive values are defined in a JSON file and passed to flutter build/run using a Dart define argument with `--dart-define-from-file`. These files, along with `google-services.json` files used to connect to Firebase projects, and keystores used to sign the application, are stored separately in the [Quickshop 3 Secrets private repo](https://github.com/buntagonalprism/quickshop_3_secrets)

To run the app locally, the following files should be copied from the secrets repo: 
1. App secrets files of name pattern `app_secrets_<ENV>.json` should be copied into the `/settings` folder should
2. Google services json files should be copied into `/android/app/src/<ENV>` folders for their respective environment
3. Debug and upload keystores and properties files should be copied into `/android/keystore` folder

The JSON secret files are stored as a single line string in Github Secrets due to issues with Github Actions unnecessarily censoring special characters if a secret contains formatted JSON: [See here for details](https://github.com/google-github-actions/auth/blob/main/docs/TROUBLESHOOTING.md#aggressive--replacement-in-logs). This issue does not impact running locally, so it is safe to format the JSON file locally with newlines and indentation. 

### Why Have Secrets?
Google documentation states that Firebase API keys are safe to be included in code or checked in to source control: https://firebase.google.com/docs/projects/api-keys#general-info. Furthermore, in general a public application cannot be considered capable of keeping any values secret. A determined attacker will always be able to find a way to extract them, e.g. by decompiling the application, or by inspecting outbound network packets. 

As such, it might seem pointless to designate any values as secret/sensitive in a public application. However, because this repo itself is public, these API keys and Firebase configuration values have been hidden to encourage anyone cloning the repo to run it against their own Firebase project. 

### Targeting Local Firebase Emulator
The Quickshop backend comprises the a Firestore database and a collection of Firebase Functions. These can be emulated locally for debugging purposes - see the Quickshop Firebase project for details regarding the Firebase emulator. 

To connect the Quickshop app to a local Firebase emulator:
1. Copy the `settings/app_settings_local_example.json` file to `settings/app_settings_local.json`
1. Setup local connection configuration:
    - **Android Physical Devices**:
        - Setup a reverse proxy using the android debug command `adb reverse tcp:8080 tcp:8080`. This proxies any requests to `localhost:8080` on the Anroid device being debugged to port 8080 of the host computer. Port 8080 is the default port for the Firebase Firestore emulator. 
        - Set the entry in the local settings JSON file: `"FIRESTORE_EMULATOR_HOST": "localhost:8080"` 
    - **Android Emulator**:
        - Set the entry in the local settings JSON file: `"FIRESTORE_EMULATOR_HOST": "10.0.2.2:8080"` to `app_secrets_dev.json`
        - This IP address automatically redirects requests on the Android emulator to the corresponding port on the host computer. 
    - **Screen Mirroring Physical Devices**:    
        - Android emulators can be quite slow, but it is convenient to have the running app accessible on desktop to quickly type and control with a mouse. 
        - [scrcpy](https://github.com/Genymobile/scrcpy) is a tool which makes it easy to mirror the screen of a physical Android phone to any computer.
        - Due to a bug in Flutter (fixed in master but not yet in stable as of 3.32), use `scrcpy --no-mouse-hover` to avoid exceptions. See: https://github.com/flutter/flutter/issues/160144
    
2. Run the "Local (debug)" launch configuration, which 

### Targeting other Firebase Projects
To run Quickshop against another Firebase project, copy and rename the `settings/app_secrets_example.json` file to `app_secrets_<ENV>.json` file

Appropriate values can be generated by using the `flutterfire` CLI tool, and then copying the values from the generated `<ENV>.dart` file into the corresponding secrets file. This command will also produce the google-services.json file. 

```
flutterfire configure --project=quickshop-ENV --out=lib/firebase/<ENV>.dart --android-package-name=com.buntagon.quickshop.ENV --android-out=android/app/src/<ENV>/google-services.json --platforms=android,web,windows
```

The `firebaseGoogleAuthWebClientId` can be found in the Firebase console as the "Web client ID" described here: https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/oauth.md

Debug and upload keystores and corresponding properties files should be placed into the `android/keystore` folder. See [here](https://docs.flutter.dev/deployment/android#configure-signing-in-gradle) for a general description of the android app signing approach. 

### Database Debugging
[sqflite](https://pub.dev/packages/sqflite) is used for local storage of data on the device. This package is a wrapper around the native sqlite database capability provided in Android and iOS operating systems. During development it can be useful to view the contents of this database. When targeting Android devices, Android Studio includes a built-in database inspector that can attach to Flutter apps running in debug mode, making it easy to browse the tables and rows in the app's sqlite databases. 

The database inspector can be opened in Android Studio from `View > Tool Windows > App Inspection`, then select the process for the application running in debug mode. See full instructions here: https://developer.android.com/studio/inspect/database#open

## Assets
The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/to/resolution-aware-images).

### App Icon
The Image Asset Studio tool in Android Studio was used to import the SVG file of the app icon. The imported icon file did not have any padding around the icon. The import process in Android Studio generates WEBP files at each display density, although it can be configured to create PNG files instead. It also converts the SVG into an Android Vector Drawable format, adding sufficient padding so it can be used as an [adaptive icon](https://developer.android.com/develop/ui/views/launch/icon_design_adaptive). Because the Quickshop icon silhouete is sufficiently distinct when converted to a single colour, `android\app\src\main\res\mipmap-anydpi-v26\ic_launcher.xml` was modified to set the monochrome icon to be the same as the adaptive icon foreground. To take advantage of the round versions of the legacy WEBP icons generated by the image asset tool, the line `android:roundIcon="@mipmap/ic_launcher_round"` was added to `AndroidManifest.xml` to specify the icon file name for Android operating systems that use round icons. 

To add the app icons for the DEV flavor
1. Define the flavor dimension and flavor in `android\app\build.gradle`
2. Sync the project with gradle in Android Studio
3. Create the `android\app\src\dev\res` folder
4. Import the dev icon by right clicking on the new `res` folder, selecting `New > Image Asset`, then on the second screen use the drop down to select `dev` as the source set for importing the icon

Immediately after launching a debug session the app icon displayed in the recent apps view may show a generic android icon instead of the proper app icon. This should resolve itself either after a device reboot or within 5-10 minutes once the OS refreshes its cached icons. 

## CI/CD Pipelines

### Pipeline configuration
In order for the pipelines to be able to automatically tag commits when running, the workflow runner needs to be granted Read and write permissions to the repository in Github:
- Settings > Actions > General > Workflow permissions
- Select Read and write permissions and save

The following environment variables are set in each environment in Github Repo Settings > Environments:
- APP_SECRETS: The contents of the `app_secrets_<ENV>.json` file described above, with all newline characters removed
- GOOGLE_SERVICES_JSON: The contents of the appropriate google services json file, located at `android/app/src/<ENV>/google-services.json`, with all newline characters removed
- FB_APP_DIST_CREDENTIALS: A google cloud service account JSON key granting permission to push app builds to firebase app distrubtion. [See steps detailed here](https://firebase.google.com/docs/app-distribution/authenticate-service-account?platform=android) for creating a service account with `Firebase App Distribution Admin` role. Again, all newlines should be removed from the json key file before adding it as a secret in github actions
- UPLOAD_KEYSTORE_B64: Base64 encoding of a `.jks` java keystore file used to sign the app. Stored in a separate private repository. 
- UPLOAD_KEYSTORE_PROPS_B64: Base64 encoding of a `.properties` file used to access the keystore. Git bash includes the `base64` command which can be used for encoding files. 
- ANDROID_FIREBASE_APP_ID: Same as the `firebaseAndroidAppId` in `app_secrets_<ENV>.dart`


### Testing on main
Each commit on main branch runs flutter tests using the pipeline `.github/workflows/test.yaml`

### Dev Deployment
To release to development:
1. Manually run the `Dev - Build and Deploy` pipeline in github actions. The source file for this pipeline `.github/workflows/build_and_deploy_dev.yaml` pipeline

Dev pipeline behaviour:
- Read the `version` component of `pubspec.yaml` and validate it is in format `<MAJOR>.<MINOR>.<PATCH>`
- Tag the current commit with a tag in format `<MAJOR>.<MINOR>.<PATCH>-dev.<BUILD_NUMBER>`
- Build the application, passing in the build number from the CI pipeline

There can be multiple dev releases with the same semantic version number; dev releases should primarily be differentiated by the build number. 

### Prod Deployment
To release to production:
1. On master, update the `version` property in `pubspec.yaml` and add an entry describing the changes in this release in `CHANGELOG.md`
2. Create a release branch with name `release/<MAJOR>.<MINOR>`
3. Manually run the `Prod - Build and Deploy` pipeline in github actions. The source file for this pipeline is `github/workflows/build_and_deploy_prod.yaml`

Release pipeline behaviour: 
- Read the `version` component of `pubspec.yaml` and validate it is in format `<MAJOR>.<MINOR>.<PATCH>`
- Check for a an existing git tag with that version; fail if it already exists
- Otherwise tag the current commit with that version in format `<MAJOR>.<MINOR>.<PATCH>`
- Build the application, passing in the build number from the CI pipeline

This approach ensures there will be only a single production release build with a given semantic version number. 

To release a hotfix:
1. Checkout the release branch `release/<MAJOR>.<MINOR>`
2. Increment the patch number of the the `version` property in `pubspec.yaml` and add an entry describing the fix in this release in `CHANGELOG.md`
3. Manually run the `Prod - Build and Deploy` pipeline in github actions.
4. Cherry pick the hotfix back to master, if the fix is not already in master


## Localization
This project generates localized messages based on arb files found in
the `lib/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter apps](https://flutter.dev/to/internationalization).
