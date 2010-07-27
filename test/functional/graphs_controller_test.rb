require File.dirname(__FILE__) + '/../test_helper'

class GraphsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end

  #test routes
  #should_route :get, "/graphs/ladida/edit", :controller => 'graphs', :action => 'edit', :id => 'ladida'
  assert_routing '/graphs/labida/edit', :controller => 'graphs', :action => 'edit', :id => 'labida'
end
