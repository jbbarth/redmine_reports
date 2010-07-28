class Graph < ActiveRecord::Base
  unloadable
  
  attr_accessor :keys
  
  belongs_to :author, :class_name => 'User'
  
  AVAILABLE_LANGUAGES = %w(text ruby)
  
  def rendering=(value)
    write_attribute(:rendering, value.gsub(/\$\./,'jQuery.'))
  end
  
  def eval_source
    case self.language
    when "text"
      res = source
    when "ruby"
      src = eval(source)
      if src.is_a?(Hash)
        res = ""
        src.each do |k,v|
          res << "#{k} = ["
          res << v.map do |e|
            "[\"#{e[0].gsub('"','')}\",#{e[1]}]"
          end.join(",")
          res << "]"
        end
      elsif src.is_a?(String)
        res = src
      else
        raise "If you use ruby language, you should provide a String or a Hash"
      end
    else
      raise "Unsupported type. How did you introduce this into the database ?"
    end
    #reformat "lineX ="
    @keys ||= []
    res.gsub(/(line\d+)\s*=\s*/) do
      key = "chart#{self.id}#{$1}"
      @keys << key
      "#{key} = "
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
