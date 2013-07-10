# Override menus in menu bar
#
# Usage:
#
#  class { 'istatmenus::override':
#    names => [ '/Library/Application Support/iStat Menus 4/extras/iStatMenusDrives.menu', '/Library/Application Support/iStat Menus 4/extras/iStatMenusMemory.menu']
#  }
class istatmenus::override ($names = []) {
  property_list_key { 'Add iStat Menus':
    ensure     => present,
    path       => "/Users/${::luser}/Library/Preferences/com.apple.systemuiserver.plist",
    key        => 'menuExtras',
    value_type => 'array',
    value      => $names,
    notify     => [ Exec['Kill SystemUI'], Exec['Ensure user permission'] ]
  }

  exec { 'Kill SystemUI':
    command => 'killall SystemUIServer'
  }

  exec { 'Ensure user permission':
    command => "chmod 644 /Users/${::luser}/Library/Preferences/com.apple.systemuiserver.plist"
  }
}
