namespace :ubuntu do
  desc 'install lfe on ubuntu'
  task lfe: :brew do
    script do
      brew :install, 'lfe'
    end
  end
end
