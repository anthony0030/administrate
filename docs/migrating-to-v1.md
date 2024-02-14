---
title: Migrating to v1
---

In the release of v1.0.0, we [began bundling assets in the gem itself][2397].
In future, this should mean that changes to the way you, or Administrate
manages assets should not have an effect on you. However, this is quite a big
change and so you might find some problems.

[2397]: https://github.com/thoughtbot/administrate/pull/2397

## Reported Issues

### Removal of the `sprockets-rails` transitive dependency

[Issue][2514]

Previously, Administrate depended on [`sprockets-rails`][], if you have a
dependency which requires this, you may now need to add a direct dependency on
your application.

[2514]: https://github.com/thoughtbot/administrate/issues/2514
[`sprockets-rails`]: https://rubygems.org/gems/sprockets-rails
