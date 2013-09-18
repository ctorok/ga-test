require 'rspec'
require_relative 'spec_helper'
require_relative '../main.rb'

describe do

  it "returns an Integer" do
      make_change(37).should be_kind_of(Integer)
    end


end