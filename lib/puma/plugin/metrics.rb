# frozen_string_literal: true

require 'puma/metrics/dsl'

Puma::Plugin.create do
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def start(launcher)
    str = launcher.options[:metrics_url] || 'tcp://0.0.0.0:9393'

    require 'puma/metrics/app'

    app = Puma::Metrics::App.new launcher
    uri = URI.parse str

    metrics = Puma::Server.new app, launcher.events
    metrics.min_threads = 0
    metrics.max_threads = 1

    case uri.scheme
    when 'tcp'
      launcher.events.log "* Starting metrics server on #{str}"
      metrics.add_tcp_listener uri.host, uri.port
    else
      launcher.events.error "Invalid control URI: #{str}"
    end

    # 低版本的 puma 不支持
    if launcher.events.respond_to?(:on_stopped)
      launcher.events.on_stopped do
        metrics.stop(true) unless metrics.shutting_down?
      end
    end

    metrics.run
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
