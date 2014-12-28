Ensure Super
======================

A [CoffeeLint][coffeelint] rule that ensures that super is called.

Description
---------------

This rule ensures that classes that inherit from a set of defined base classes
and override a set of defined methods call `super` in their implementations of
those methods. A good example of this is making sure that all [Backbone][bb] 
views that override `View::remove` call `super`, since otherwise they will leak
resources, and may not actually be removed from the DOM.

By default no rules are defined - these must be configured (see below).

Installation
-----------------

```sh
npm install coffeelint-ensure-super
```

Usage
-----

Add the following configuration to `coffeelint.json`:

```json
"ensure_super": {
      "module": "coffeelint-forbidden-keywords",
      "check": {
        "SuperClassName": ["method1", "method2"],
        "AnotherSuperClass": ["methodX", "methodY"]
      }
}
```

Configuration
----------------

The **check** property defines which methods must call `super`. It is a
mapping from the parent class name to the list of the methods that must
call `super` when overriden. For example, a suitable configuration for
ensuring all Backbone views call `super` on removal would be:

```json
"ensure_super": {
      "module": "coffeelint-forbidden-keywords",
      "check": {
        "View": ["remove"]
      }
}
```

[coffeelint]: http://www.coffeelint.org/
[bb]: http://backbonejs.org/
