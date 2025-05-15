#  AutoRoute Stack Bug Reproduction

This project demonstrates a regression bug in the `auto_route` Flutter package starting from version `10.0.1`.

##  Problem

When navigating from one nested route (e.g. `Tab2Screen`) to another sibling route (e.g. `SettingsScreen`), and a `reevaluateListenable` is triggered (e.g. via listening to a global BLoC stream), the navigation stack breaks.

Instead of staying on the current route (`SettingsScreen`), the previous route (`Tab2Screen`) is unexpectedly moved to the top of the stack.

###  Steps to Reproduce

1. Start the app (on `main` branch).
2. Navigate to `Tab2`.
3. From `Tab2`, navigate to `Settings`.
4. Trigger a reevaluation (e.g. change state in `_appBloc`).
5. Route `Tab2` appears again on top of the stack.

###  Works in

auto_route: 9.3.0+1

Available in branch: [`stable`](https://github.com/SERDUN/auto_route_stack_bug_repro/tree/stable)

###  Fails in

auto_route: 10.0.1

 Available in branch: [`main`](https://github.com/SERDUN/auto_route_stack_bug_repro/tree/main)

##  Tech Stack

- Flutter: `3.29.3`
- AutoRoute: `10.0.1` (on `main`), `9.3.0+1` (on `stable`)
- Bloc: used to trigger `reevaluateListenable`
- Dart null safety: enabled

##  Structure

- `lib/app/router/`: auto_route config
- `lib/features/`: mock screens for `tab1`, `tab2`, `settings`
- `lib/blocs/`: minimal bloc simulating app-wide changes

##  Route Hierarchy

/
└── main (MainShellRoute)
├── tab1
├── tab2
└── settings

## 🧪 How to Test

1. Launch app from `main` branch
2. Navigate: `Tab2` ➝ `Settings`
3. Trigger any `_appBloc.add(...)`
4. Observe that `Tab2` reappears
