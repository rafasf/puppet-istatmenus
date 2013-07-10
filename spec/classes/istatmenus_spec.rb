require 'spec_helper'

describe 'istatmenus' do
  context 'default' do
    let(:file_name) { 'istatmenus4.06' }

    it { should contain_package('iStat Menus').with_provider('compressed_app') }
    it { should contain_package('iStat Menus').with_source("http://s3.amazonaws.com/bjango/files/istatmenus4/#{file_name}.zip") }
  end

  context 'specific version' do
    let(:version) { '3.1.1' }
    let(:file_name) { "istatmenus#{version}" }
    let(:params) { { :version => version } }

    it { should contain_package('iStat Menus').with_provider('compressed_app') }
    it { should contain_package('iStat Menus').with_source("http://s3.amazonaws.com/bjango/files/istatmenus3/#{file_name}.zip") }
  end

  context 'invalid version' do
    let(:params) { { :version => 'blah' } }

    it { expect { subject }.to raise_error(
      Puppet::Error, /version should start with a number/
    )}
  end
end
