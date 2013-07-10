# Install iStat Menus into /Applications
#
# Usage:
#
#  include istatmenus
#  or
#  class { 'istatmenus':
#    version => '4.06'
#  }
class istatmenus ($version = '4.06') {
  case $version {
    /(^\d)/: { $main_version = $1 }
    default: { fail('Class[istatmenus]: version should start with a number') }
  }

  $folder = "istatmenus${main_version}"
  $file_name = "istatmenus${version}"

  package { 'iStat Menus':
    provider => 'compressed_app',
    source   => "http://s3.amazonaws.com/bjango/files/${folder}/${file_name}.zip"
  }
}
