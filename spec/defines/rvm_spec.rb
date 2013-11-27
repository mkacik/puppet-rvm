require 'spec_helper'

describe 'rvm' do
	let(:title) { 'dummy' }

	it { should contain_rvm__install('dummy') }

	describe 'ensure present' do
		let(:params) { { 
      :rubies => ['head', '1.9.3', 'jruby-head'] 
    } }

		it { should contain_rvm__ruby('dummy/head') }
		it { should contain_rvm__ruby('dummy/1.9.3') }
		it { should contain_rvm__ruby('dummy/jruby-head') }
	end
end
