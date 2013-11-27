require 'spec_helper'

describe 'rvm::ruby' do
  let(:title) { 'dummy/1.9.3' }

	context 'default' do
    it do 
      should contain_exec('install ruby 1.9.3 for dummy').with({
        'require' => 'Rvm::Install[dummy]'
      }) 
    end
	end

  context 'ensure => absent' do
    let(:params) { { :ensure => 'absent' } }

    # TODO: enable after rspec-puppet is released in new version
    #it { should have_resource_count(1) }
    #it { should have_notify_resource_count(1) }
  end
end
