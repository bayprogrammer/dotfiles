namespace :ubuntu do
  desc 'install clojure on ubuntu'
  task clojure: :brew do
    local_bin = File.expand_path('~/.local/bin')
    FileUtils.mkdir_p(local_bin)

    script do
      brew :install, 'clojure/tools/clojure'

      Utils.unless_exists(File.join(local_bin, 'lein')) do |lein_destination|
        curl '-fLo', lein_destination, 'https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein'
        chmod 'u+x', lein_destination
        bash lein_destination
      end
    end
  end
end
