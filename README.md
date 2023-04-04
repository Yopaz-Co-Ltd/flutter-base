# flutter_base

Flutter Base

## Usage

1. Add a new screen
   1. Create a new folder in `lib/ui/screens` folder, for example `login`
   2. Create a new file `login_screen.dart` in `lib/ui/screens/login` folder
   3. Add screen name in `lib/screens/screen_names.dart`

2. Localization usage
    1. Add new translated text into `lib/assets/translations/en.json` and `lib/assets/translations/vi.json`
    2. Add a new corresponding enum into `lib/assets/translations/localization.dart`
    3. Use `Localization.text.tr()` in code line
3. Call api - this base uses Retrofit to call api
    1. If you create a new api, you need to add a new function into `lib/data/apis/api.dart`, for example <br />
       `@POST("login")`
       <br/>
       `Future<ApiResponseModel<UserModel>> login();`
    2. If you create a new model object, you need to add a new class into `lib/data/models` folder, for example <br />
       `class UserModel {`
       <br/>
       `&nbsp;&nbsp;&nbsp;String name;`
       <br/>
       `&nbsp;&nbsp;&nbsp;String email;`
       <br/>
       `}`
    3. See some examples in `lib/data/apis/api.dart` and `lib/data/models` folder to understand how to create a new api
       and model object
    4. Run `flutter pub run build_runner build` to generate api and model object
    5. In the usage, you can call api like this <br />
       `Api.instance.login().then((it) => print(it.data?.age ?? 0));`
4. Config environment
   1. If Android app fails to build with `buildConfigFields`, please check this comment https://github.com/ByneappLLC/flutter_config/issues/31#issuecomment-1225748517
