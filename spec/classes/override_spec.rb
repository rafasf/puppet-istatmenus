require 'spec_helper'

describe 'istatmenus::override' do
  context 'set menus in menubar' do
    let(:params) { { :names => ['/Path/One', '/Path/Two'] } }
    let(:facts) { {:luser => 'bob'} }

    it { should contain_property_list_key('Add iStat Menus').with({
        :ensure => 'present',
        :path   => "/Users/#{facts[:luser]}/Library/Preferences/com.apple.systemuiserver.plist",
        :key    => 'menuExtras',
        :value_type => 'array',
        :value  => params[:names],
        :notify => 'Exec[Kill SystemUI]'
      })
    }
  end
end
