namespace :ubuntu do
  task lisp: [:base, :brew] do
    lisp_brew_packages = %w(
      gauche
      guile
      ecl
      sbcl
    )

    script do
      brew :install, lisp_brew_packages
    end
  end
end
