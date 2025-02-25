# Changelog


## 1.2.7-rcc
Changes:
- 最低 Ruby 版本要求降为 2.3.0

## 1.2.6-rcc
Changes:
- 最低 Ruby 版本要求降为 2.4.1
- plugin/metrics.rb 中 添加 launcher.events 对 on_stopped 的判断。
## 1.2.5-rcc
Changes:
- 最低 Ruby 版本要求降为 2.5.1

## 1.2.4

Changes:
- Shut down metrics server in `on_stopped` so it only stops when main puma process stops and ignores when workers are
  stopped. This allows us to maintain a running metrics server when workers restart or crash.

Housekeeping:
- Update dependencies
- Test on ruby 3.1

## 1.2.3

Housekeeping:
- Update dependencies

## 1.2.2

Changes:
- Expose new metric `puma_requests_count` when using Puma 5

## 1.2.1

Changes:
- Drop support for ruby 2.5

Housekeeping:
- Update dependencies
- Updates for Puma 5

## 1.2.0

Changes:
- Drop support for ruby 2.4
- Relax prometheus-client to '>= 0.10'

Housekeeping:
- Update development dependencies

## 1.1.0

Changes:
- Upgrade prometheus-client to '~> 0.10'

Housekeeping:
- Set target version to 2.6
- Added editorconfig

## 1.0.3

Features:
- can be used with puma 3 or puma 4

## 1.0.2

Bugfixes:
- terminate metrics server without IO errors [#7](https://github.com/harmjanblok/puma-metrics/pull/7)

## 1.0.1

Bugfixes:
- `metrics_url` in `config/puma.rb` should be optional

## 1.0.0

Initial release of the `puma-metrics` gem.
