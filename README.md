iOS-RAC-CouchbaseLite-Demo
===========================

A sample project demonstrating how to build a sample application using the following:

 - [Couchbase Lite](http://www.couchbase.com/nosql-databases/couchbase-mobile) — local JSON data store that can selectively replicate to Couchbase backend servers with minimal configuration (through another thing called Sync-Gateway)
 - [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) — your single programming model for KVO, `NSNotification`s, stream and async operations on iOS and Mac
 — [Typhoon](http://typhoonframework.org) — dependency injection
 - [TLIndexPathTools](http://tlindexpathtools.com) — simplifies Table View and Collection View updates for you

Build with [VIPER architecture](http://www.objc.io/issue-13/viper.html), and Ash Furrow's interpretation of [MVVM using ReactiveCocoa](https://github.com/ashfurrow/C-41) in mind.

Thanks to @ndouglas for writing [ReactiveCouchbaseLite](https://github.com/ndouglas/ReactiveCouchbaseLite).

Couchbase replication is not demonstrated in this project. You can find out how to work with replication by looking at the [ToDoLite-iOS application](https://github.com/couchbaselabs/ToDoLite-iOS).

How to get started
-------------------

You must have [Cocoapods](http://cocoapods.org) installed.

0. `cd <your checkout directory>`
1. `pod install`
2. `open *.workspace`
3. `Cmd + R` =]
