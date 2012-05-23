module Sextant
  class RouteInspector
    def format(routes)
      routes_hash = routes.map { |route| { :name => route.name.to_s,
                                           :verb => route.verb.to_s,
                                           :path => route.path, 
                                           :reqs => route.requirements.empty? ? "" : route.requirements.inspect } }

      # Skip the route if it's internal info route
      routes_hash.reject! { |r| r[:path] =~ %r{/rails/info/properties|^/assets} }

      name_width = routes_hash.map { |r| r[:name].length }.max
      verb_width = routes_hash.map { |r| r[:verb].length }.max
      path_width = routes_hash.map { |r| r[:path].length }.max

      routes_hash.map do |r|
         %{ #{r[:name].rjust(name_width)} #{r[:verb].ljust(verb_width)} #{r[:path].ljust(path_width)} #{r[:reqs]} }
      end
    end
  end
end
