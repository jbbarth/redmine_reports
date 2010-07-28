require File.dirname(__FILE__) + '/../test_helper'

class GraphTest < ActiveSupport::TestCase
  fixtures :graphs
  
  def test_eval_source
    data = "[['frogs',3],['buzzards',7],['deer',2.5],['turkeys',6],['moles',5],['ground hogs',4]]"
    assert_equal data, Graph.find(1).eval_source
    assert_equal data.gsub("'",'"'), Graph.find(2).eval_source
  end
  
  def test_renderers
    assert_equal ["plugins/jqplot.pieRenderer.js"], Graph.find(1).renderers
  end
end
