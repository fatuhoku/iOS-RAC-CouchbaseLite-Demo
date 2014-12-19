The purpose of this project is to establish a wholesome iOS development
approach that is amenable to incremental development.

It is established on the following core principles:

 - Continuous integration / Continuous deployment
 - Release early, release often
 - Modular code; isolate changes
 - Modular architecture — adopt MVVM and VIPER patterns, and contain logic in their module.
 - ONE target, but multiple schemes.

Targets
=======

 - ONE main target, ONE test target, but MULTIPLE schemes.

(?) What can the integration tests test realistically?

MULTIPLE configurations. Different configurations let you set pre-processor flags to change the implementation.
Schemes map to Configurations ONE TO ONE.


Environments as XCode Configurations
====================================

In principle, we would like to support four principle environments:

|            | Frontend                                    | Backend    | Notes                                         |
|------------|---------------------------------------------|------------|-----------------------------------------------|
| dev        | iOS Simulator /  iDevice (XCode dev device) | ???        | Super-fast iterations                         |
| ci         | iDevice (greenhouseci.com)                  | ???        | Detect regressions fast                       |
| stage      | iDevice (Internal Testers)                  | loaf-stage | For quality assurance before pushing to users |
| prod       | iDevice (External Testers)                  | loaf-prod  |                                               |

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

(?) How can a change of scheme specify differences in code compilation?
(!) See DEBUG preprocessor flag.

Couchbase Support
-----------------

Test by skipping all the things
