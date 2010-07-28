class Graph < ActiveRecord::Base
  unloadable

  belongs_to :author, :class_name => 'User'

  AVAILABLE_LANGUAGES = %w(text ruby)
  
  def rendering=(value)
    write_attribute(:rendering, value.gsub(/\$\./,'jQuery.'))
  end
  
  def eval_source
    case self.language
    when "text"
      source
    when "ruby"
      res = eval(source)
      if res.is_a?(Array) && res.first.is_a?(Array)
        "[" + res.map do |e|
            "[\"#{e[0].gsub('"','')}\",#{e[1]}]"
        end.join(",") + "]"
      else
        res
      end
    else
      raise "Unsupported type. How did you introduce this into the database ?"
    end
  end

  def renderers
    self.rendering.scan(/jqplot\.(\w+)Renderer/).map do |r|
      r = r.first
      r.gsub!(/^(\w)/){ $1.downcase } unless r.include?("Bezier")
      "plugins/jqplot.#{r}Renderer.js"
    end || []
  end
end
