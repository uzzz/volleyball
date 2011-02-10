require 'rubygems'
require "test/unit"
require 'volleyball'
require 'shoulda'
require 'mocha'
require 'ruby-debug'
require 'active_support' #for cattr_accessor
class TestVolleyball < Test::Unit::TestCase

  class MockArModel
    include Volleyball
  end
  
  context "volleyball lib" do 
  
    setup do
      MockArModel.expects(:has_many).with(:votes, {:as => :subject})
      MockArModel.expects(:before_save).with(:calculate_score)
      MockArModel.any_instance.stubs(:yes_votes).returns(200)
      MockArModel.any_instance.stubs(:no_votes).returns(121)
      MockArModel.votable :yes_start=>7, :no_start=>5
    end
    should "have yes_adjustment" do
      assert_equal 7, MockArModel.yes_adjustment
    end
    should "have no_adjustment" do
      assert_equal 5, MockArModel.no_adjustment
    end
    
    should "Calculate score" do
      instance = MockArModel.new
      instance.expects(:score=).with(5.9)
      assert instance.calculate_score
    end
    
  end
end