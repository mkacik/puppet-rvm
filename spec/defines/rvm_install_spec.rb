require 'spec_helper'

describe 'rvm::install' do
	let(:title) { 'dummy' }

	it { should include_class('rvm::requirements') }

	context 'ensure => present' do
		it { should contain_exec('fetch rvm installer for dummy') }
		it { should contain_exec('install rvm without rubies for dummy') }
	end

  context 'ensure => absent' do
    let(:params) { { 
      :ensure => 'absent'
    } }
    it { should contain_exec('implode rvm installation for dummy') }
    it { should contain_file('/home/dummy/.rvm').with({'ensure' => 'absent'}) }
    it { should contain_file('/home/dummy/.rvmrc').with({'ensure' => 'absent'}) }
    it { should contain_file('/home/dummy/rvm-installer.sh').with({'ensure' => 'absent'}) }
  end
end
