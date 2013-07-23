class base {
    $basepackages = [
      'acidrip', 'ack-grep', 'apparix', 'apt-utils', 'audacity', 'apt-cacher', 'apache2', 'atop', 'antiword', "android-tools-adb",
      'bzr', 'bwm-ng',
      'chromium-browser', 'chromium-codecs-ffmpeg', 'clusterssh', 'compizconfig-settings-manager', 'curl', 'calibre', 'cheese', 'clojure', 'cowsay', 'colordiff', 'csstidy', 'ccrypt', 'cifs-utils',
      'dconf-tools', 'desktopcouch-ubuntuone', 'devscripts', 'dvdrip', 'dvdbackup', 'dsh', 'dos2unix', 'dia', 'deluge', 'dcraw',
      'ec2-ami-tools', 'ec2-api-tools',
      'ffmpeg', 'freemind',
      'gcompris', 'gcompris-sound-nl', 'gimp', 'git-svn', 'gitk', 'gnuplot', 'groovy', 'grpn', 'gtk-recordmydesktop', 'gddrescue', 'gconf-editor', 'glade', 'graphviz', 'gparted', 'golang-go', 'gradle',
      'htop',
      'imagemagick', 'inkscape', 'iotop', 'irssi', 'iamcli', 'inotifytools',
      'jruby', 'jython',
      'libvirt-bin', 'libavcodec-dev', 'libavcodec53', 'libimage-exiftool-perl', 'libsmbclient', 'libxml2-utils', 'ldap-utils', 'libpam-smbpass', 'libnet-dbus-glib-perl', 'libsdl-ruby', 'links',
      'mysql-server', 'mpg321', 'mc', 'mercurial', 'moreutils', 'mcollective-client', 'most', 'musescore', 'markdown',
      'nautilus-dropbox', 'nmap', 'network-manager-strongswan', 'npm',
      'ogmrip', 'openjdk-6-jdk', 'openjdk-7-doc', 'openjdk-7-jdk', 'openjdk-7-source', 'openshot', 'openssh-server', 'octave', 'octave-java', 'octave-tsa',
      'p7zip', 'p7zip-full', 'pssh', 'pdftk', 'pexec', 'pavucontrol', 'python-xmpp', 'picsaw', 'pastebinit',
      'quicksynergy',
      'rubygems', 'ri-li',
      's3cmd', 'sabnzbdplus', 'sawfish', 'subversion', 'synaptic', 'sysstat', 'sauerbraten', 'supertuxkart', 'shutter', 'samba', 'soundconverter', 'sound-juicer',
      'tmux', 'traceroute', 'tcpdump', 'thunderbird', 'tidy',
      'ubuntu-restricted-addons', 'ubuntu-restricted-extras', 'ubuntu-vm-builder', 'umlet', 'umbrello',
      'vim-gnome', 'vlc', 'virt-manager', 'vorbis-tools', 'vnstat',
      'wireshark', 'w3m',
      'xchat', 'xdiskusage', 'xmlstarlet', 'xpdf', 'xclip',
      ]

  $legoproject = [
    'python-opencv', 'python-pypm', 'python-liblo', 'zynaddsubfx', 'rosegarden', 'qtractor', 'so-synth-lv2', 'swh-lv2', 'whysynth', 'liblo-tools'
  ]

  package { $basepackages:
    ensure => installed
  }
  package { $legoproject:
    ensure => installed
  }

  #TODO: add class for installing qlandkartegt from ppa
}

class { 'base': }
