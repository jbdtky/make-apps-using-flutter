# Make World-class Applications using my tech-stack ;)

This repo is made for startupers that want to iterate fast while keeping a minimum of safety to avoid bugs. If you're a developer of a larger application or company, I do not recommend you this repository as it might not follow certain standards required by larger organization.

## Make World-class Apps using Flutter

### Setup

- `pubspec.yaml`: Change the `name`, `description
- `ios/Runner/Info.plist`: Change the `CFBundleDisplayName`, `CFBundleName`
- `android/app/main/AndroidManifest.xml`: Change the `package`, `android:label`
- `assets/icons/icon.png`: Add your App Icon in format 1024x1024. Then run `flutter pub run flutter_launcher_icons` in the `apps` folder.

If you are updating the models in `lib/models`, please run this `flutter pub run build_runner watch --delete-conflicting-outputs`, it will regenerate based on the change you make.

#### Firebase

Go create a project here `https://console.firebase.google.com/u/0/project/` and create a flutter app.

- Run `dart pub global activate flutterfire_cli`
- Run `flutterfire configure --project={project-id}`

#### Backend

- Create a environment file `.env` in `./backend/` and copy the same file in `./src/services/api/`
- Run `npx prisma db push` (if you did not install prisma, check out https://www.prisma.io)

### Lets get started

#### Sign in

- Setup the SHA1 in Firebase Android App Settings to run Google Sign in.

#### User profile

#### Referrals

#### And more...
