# iStatMenus Puppet Module for Boxen

This is suppose to be a version agnostic iStatMenus module.

## Usage

```puppet
include istatmenus
```
or
```puppet
class { 'istatmenus':
  version => '4.06'
}
```

## Required Puppet Modules

* `boxen`
* `property_list_key`
