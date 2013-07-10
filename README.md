# iStatMenus Puppet Module for Boxen
[![Build Status](https://travis-ci.org/rafasf/puppet-istatmenus.png?branch=master)](https://travis-ci.org/rafasf/puppet-istatmenus)

This is suppose to be a version agnostic iStatMenus module.

## Usage

### Installation
```puppet
include istatmenus
```
or
```puppet
class { 'istatmenus':
  version => '4.06'
}
```

### Menu bar override
Whatever gets added here will show in the right side of OS X menu bar, it will not keep what is already there.

```puppet
class { 'istatmenus::override':
  names => [ '/Library/Application Support/iStat Menus 4/extras/iStatMenusDrives.menu', '/System/Library/CoreServices/Menu Extras/Volume.menu' ]
}
```
#### Where to find the menus

* System: `/System/Library/CoreServices/Menu Extras`
* iStat Menus: `/Library/Application Support/iStat Menus 4/extras`

## Required Puppet Modules

* `boxen`
* `property_list_key`
