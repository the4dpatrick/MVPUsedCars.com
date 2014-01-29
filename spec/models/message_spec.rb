require 'spec_helper'

describe Message do

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:body) }
  it { should respond_to(:phone) }
  it { should respond_to(:subject) }
  it { should respond_to(:sweet_honey) }

end
