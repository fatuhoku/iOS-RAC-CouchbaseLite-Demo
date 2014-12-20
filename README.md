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
| stage       | STAGE              | iDevice (Internal Testers)                  | loaf-stage | Automatic and manual system test before release  |
| production  | PROD               | iDevice (External Testers)                  | loaf-prod  | Humans use the app!                              |
| ci (pending)| CI                 | iDevice (hosted itest service)              | ???        | Run every commit to detect regressions           |

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

VIPER architecture
------------------

| VIPER component present | Interactor | Pre |
|-------------------------|------------|-----|
| Read-Only               | NO         | YES |
| Read-Write              | YES        | YES |


Test Strategy
-------------

Behaviour Driven Testing (BDD) dictates that we should only bother testing for
units of business value.  At the same time it's important to avoid the ice-cream cone.

We can identify two sorts of tests:

 - [Subcutaneous tests](http://martinfowler.com/bliki/SubcutaneousTest.html)
   tests manage to test what's just under the View: it tests the Interactor,
   Presenter, and Entity parts of VIPER.
 - UI tests, which tests the View and Routing (navigation) parts of VIPER.

We start with one test suite that tests IPE exclusively.
For every VIPER stack, the Interactor and Presenter pair is the system under test.

| VIPER component present | Interactor | Presenter |
|-------------------------|------------|-----------|
| Read-Only               | NO         | YES       |
| Read-Write              | YES        | YES       |

When structured this way, even integration tests could appear to just waste time.

Test coverage of V and R is much less important. Testing the core and building
the tests out from there is more important.


Dependency Injection
--------------------

TODOs
----------

### Integration Testing

 -  Build a simple application that has a TextField, and a button. When tapped, we want to observe a label change to "Hello [name]"

### A/B Testing

 - Apptimize
