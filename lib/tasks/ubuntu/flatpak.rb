namespace :ubuntu do
  desc 'setup flatpak & apps'
  task flatpak: :base do
    flatpaks = %w(
      org.chromium.Chromium
      com.discordapp.Discord
      com.slack.Slack
      org.gnome.Epiphany
      org.signal.Signal
      com.valvesoftware.Steam
      org.gimp.GIMP
      org.blender.Blender
      org.kde.krita
      com.chez.GrafX2
      org.mypaint.MyPaint
      org.pencil2d.Pencil2D
      org.inkscape.Inkscape
      com.github.libresprite.LibreSprite
      com.orama_interactive.Pixelorama
      org.godotengine.Godot
      io.github.guillaumechereau.Goxel
      com.wings3d.WINGS
      org.openshot.OpenShot
      org.kde.kdenlive
      org.shotcut.Shotcut
      io.github.jliljebl.Flowblade
      org.pitivi.Pitivi
      net.sonic_pi.SonicPi
      org.famistudio.FamiStudio
      io.lmms.LMMS
      edu.mit.Scratch
      org.tuxfamily.XMoto
      net.supertuxkart.SuperTuxKart
      org.supertuxproject.SuperTux
      dk.tangramgames.mrrescue
      net.minetest.Minetest
      org.neverball.Neverball
      net.sourceforge.ExtremeTuxRacer
      io.sourceforge.clonekeenplus
      us.zoom.Zoom
    )

    script do
      Utils.unless_exists('/usr/bin/flatpak') do |_pathname|
        sudo do
          sh('add-apt-repository', '-y', 'ppa:alexlarsson/flatpak')
          apt :update, '-y'
          apt :install, '-y', :flatpak
        end

        flatpak '--user', 'remote-add', '--if-not-exists', :flathub, 'https://flathub.org/repo/flathub.flatpakrepo'

        puts "You ought to reboot if you just installed Flatpak."
        puts "Don't forget to re-run the bootstrap process!"
        exit 0
      end

      flatpaks.each do |pak|
        flatpak '--user', :install, '-y', pak
      end
    end
  end
end
