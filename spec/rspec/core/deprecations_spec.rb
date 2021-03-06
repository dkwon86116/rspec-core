require "spec_helper"

describe "deprecations" do
  describe "Spec" do
    it "is deprecated" do
      RSpec.should_receive(:warn_deprecation).with(/Spec .* RSpec/i)
      Spec
    end

    it "returns RSpec" do
      RSpec.stub(:warn_deprecation)
      Spec.should == RSpec
    end
  end

  describe RSpec::Core::ExampleGroup do
    describe 'running_example' do
      it 'is deprecated' do
        RSpec.should_receive(:warn_deprecation).with(/running_example.*example/m)
        self.running_example
      end

      it "delegates to example" do
        RSpec.stub(:warn_deprecation)
        running_example.should == example
      end
    end
  end
end
