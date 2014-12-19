Vanguard Project
===================

An iOS project template for speedy technical learning, and refinement of development process.

It explores the following core principles:

 - Xcode configuration — to support multiple configurations
 — Modular assemblies — use of frameworks, static libraries, sub-applications to split into sub-project levels
 - iOS code architectures — explore use of MVVM and VIPER architectures
 - Continuous integration / Continuous deployment
 - Release early, release often
 - Simplicity: minimise number of targets (reduce build times); tweak values with Xcode configurations.

XCode Concepts
================

Project manages a number of bundles (artefacts)
Targets are sets of compilation files (HARD behaviour differentiation).
Targets' behaviours can be are sets of compilation files (HARD behaviour differentiation).

Behaviour There's only really one app, so unless there's a pressing neecompile 
In order to minimize complexity of targets

Targets
-------

(?) What can the integration tests test realistically?

MULTIPLE configurations. Different configurations let you set pre-processor flags to change the implementation.
Schemes map to Configurations ONE TO ONE.

Services
----------

The application might need to talk to a number of services:

| Service               | Provider    |
|-----------------------|-------------|
| Tweaks                | Tweaks      |
| General Backend       | Parse       |
| Data Backend          | Couchbase   |
| A/B Testing           | Apptimize   |
| Social Authentication | Facebook    |
| Crash reporting       | Crashlytics |
| Bug reporting UI      | Instabug    |
| Mobile Analytics      | Mixpanel    |


Environments as Xcode configurations
------------------------------------

The application bundle built from the target might want to run under a number
of different contexts and for different purposes, as shown below:

| Environment | Preprocessor Macro | Frontend                                    | Backend    | Purpose                                          |
|-------------|--------------------|---------------------------------------------|------------|--------------------------------------------------|
| dev         | DEV                | iOS Simulator /  iDevice (XCode dev device) | ???        | Run often to iterate on application              |
| ci          | CI                 | iDevice (hosted itest service)              | ???        | Run every commit to detect regressions           |
| stage       | STAGE              | iDevice (Internal Testers)                  | loaf-stage | Automatic and manual system test before release  |
| production  | PROD               | iDevice (External Testers)                  | loaf-prod  | Humans use the app!                              |

### ... with Cocoapods

Services should be enabled / disabled for each of these configurations by using
Cocoapods' new configuration-scoped dependencies. See [here](http://blog.cocoapods.org/CocoaPods-0.34/).

### ... in code

1. Change behaviour by enabling / disabling codepaths based on the environment preprocessor macro:

```
#ifdef DEV
assembly = [MESDevelopmentAssembly ...];
#endif

#ifdef CI
assembly = [MESIntegrationTestAssembly ...];
#endif

#ifdef STAGE
assembly = [MESStageAssembly ...];
#endif

#ifdef PROD
assembly = [MESProductionAssembly ...];
#endif
```

The way to fetch the Facebook URL scheme suffix was pretty horrible:

```
[[NSBundle mainBundle] infoDictionary][@"FacebookUrlSchemeSuffix"];
```

Much prefer the code define the scheme suffix in the Assembly.


2. Check whether a Cocoapod dependency exists. e.g.

```
#ifdef COCOAPODS_POD_AVAILABLE_Instabug
[Instabug doSomething];
#endif
```


Test Strategy
-------------

To start with, it's a good idea to begin building a VIPER feature by testing the views.

 - Tests (for the test target) are developed in `dev`, and the same tests are run in CI.

(?) To what degree can the sync-gateway be set up?

The first two are clones of the Debug configuration whereas the second two are clones of Release.
We need a number of configurations for purposes.

For simplicity, a scheme's corresponds to a configurations

 - Vanguard (Fake Data)
    - PURPOSE: Allows high-speed iterations on user interface.  without fuss

    — RUN:  Loads application with various fake UI harnesses with a fake database (no sync gateway at all);
            Storyboard can be set to some particular view controller;
            Data for ViewController is automatically injected;
            READ-ONLY. Write operations are not supported.

    — TEST: use to test the UI only, without depending on ANY database

 - Vanguard (Local Sync Gateway)
    — RUN:  UI only, without depending on ANY database
    - TEST: ...

 - A/B testing integrated in the start

With Couchbase, we'll be looking for a Model layer that is also responsible for persistence.


TODOs
----------

### Integration Testing

 - Build a simple passing Subliminal test.
    - Subliminal requires app hooks; declare them very carefully to check the state of something.

### A/B Testing

 - Apptimize
