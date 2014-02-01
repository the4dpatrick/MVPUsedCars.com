require 'spec_helper'

describe Car do

  it { should respond_to(:make) }
  it { should respond_to(:model) }
  it { should respond_to(:year) }
  it { should respond_to(:seats) }
  it { should respond_to(:transmission) }
  it { should respond_to(:drive) }
  it { should respond_to(:interior) }
  it { should respond_to(:exterior) }

end
