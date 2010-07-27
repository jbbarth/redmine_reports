module GraphsHelper
  def jqplot_graph(graph)
    return unless graph.is_a?(Graph)
    html = []
    html << %(<div class="jqPlot" id="chart#{graph.id}" style="height:300px;width:450px;"></div>)
    html << %(<script type="text/javascript" language="javascript">)
    html << %(//<![CDATA[)
    html << %(jQuery.noConflict();)
    html << %(line#{graph.id} = #{graph.eval_source};)
    html << "plot#{graph.id} = jQuery.jqplot('chart#{graph.id}', [line#{graph.id}], {"
    html << %(  title: '#{graph.title}',)
    html << %(  #{graph.rendering.split("\n").join("  \n")})
    html << "});"
    html << %(//]]>)
    html << "</script>"
    html.join("\n")
  end
end
