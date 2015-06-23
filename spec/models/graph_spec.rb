require "spec_helper"

describe "Graph" do
  fixtures :graphs

  it "should eval source" do
    data = "[['frogs',3],['buzzards',7],['deer',2.5],['turkeys',6],['moles',5],['ground hogs',4]]"
    expect(Graph.find(1).eval_source).to eq data
    expect(Graph.find(2).eval_source).to eq "chart2line1 = #{data.gsub("'",'"')}"
  end

  it "should renderers" do
    expect(Graph.find(1).renderers).to eq ["plugins/jqplot.pieRenderer.js"]
  end
end
