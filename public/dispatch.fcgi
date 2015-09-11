#!/home/users/jhu/.rvm/wrappers/ruby-2.2.1/ruby

require_relative '../config/environment'

class Rack::PathInfoRewriter
  def initialize(app)
    @app = app
  end

  def call(env)
    env.delete('SCRIPT_NAME')
    parts = env['REQUEST_URI'].split('?')
    env['PATH_INFO'] = parts[0].gsub(/[^\/.]+\//, "")
    env['QUERY_STRING'] = parts[1].to_s
    @app.call(env)
  end
end

Rack::Handler::FastCGI.run Rack::PathInfoRewriter.new(Bookcat::Application)
