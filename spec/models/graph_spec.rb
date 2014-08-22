require "spec_helper"

describe "Graph" do
  fixtures :graphs

  it "should eval source" do
    data = "[['frogs',3],['buzzards',7],['deer',2.5],['turkeys',6],['moles',5],['ground hogs',4]]"
    Graph.find(1).eval_source.should == data
    Graph.find(2).eval_source.should == "chart2line1 = #{data.gsub("'",'"')}"
  end

  it "should renderers" do
    Graph.find(1).renderers.should == ["plugins/jqplot.pieRenderer.js"]
  end
end
