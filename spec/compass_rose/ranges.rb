# -*- coding: UTF-8 -*-

shared_examples 'CompassRose::Ranges' do
  it ' should be an instance of Hash ' do
    expect(subject).to be_an_instance_of Hash
  end

  it 'should have the :s key' do
    expect(subject.key?(:s)).to be_truthy
  end

  it 'should ha3ve the :d key' do
    expect(subject.key?(:d)).to be_truthy
  end
end
