require 'chefspec'

describe 'gem_package::remove' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'removes a gem_package with an explicit action' do
    expect(chef_run).to remove_gem_package('explicit_action')
    expect(chef_run).to_not remove_gem_package('not_explicit_action')
  end

  it 'removes a gem_package with attributes' do
    expect(chef_run).to remove_gem_package('with_attributes').with(version: '1.0.0')
    expect(chef_run).to_not remove_gem_package('with_attributes').with(version: '1.2.3')
  end

  it 'removes a gem_package when specifying the identity attribute' do
    expect(chef_run).to remove_gem_package('identity_attribute')
  end
end
