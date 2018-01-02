require 'spec_helper'
describe 'RepoNginx' do
  context 'with default values for all parameters' do
    it { should contain_class('RepoNginx') }
  end
end
