# flutter_base

Flutter Base

## Usage

1. Localization usage
    1. Add new translated text into `lib/assets/translations/en.json` and `lib/assets/translations/vi.json`
    2. Add a new corresponding enum into `lib/assets/translations/localization.dart`
    3. Use `Localization.text.tr()` in code line
2. Call api - this base uses Retrofit to call api
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
