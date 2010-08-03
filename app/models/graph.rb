class Graph < ActiveRecord::Base
  unloadable
  
  attr_accessor :keys
  
  belongs_to :author, :class_name => 'User'

  default_scope :order => 'id desc'
  
  AVAILABLE_LANGUAGES = %w(text ruby)
  
  def rendering=(value)
    write_attribute(:rendering, value.gsub(/\$\./,'jQuery.'))
  end
  
  def eval_source
    return @evaled_source if @evaled_source
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
            "[\"#{e[0].to_s.gsub('"','')}\",#{e[1]}]"
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
    @evaled_source = res.gsub(/(line\d+)\s*=\s*/) do
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
  
  def self.size
    settings = Setting["plugin_redmine_reports"]
    [(settings["graph_size_x"].match(/^\d+$/) ? settings["graph_size_x"] : "450"),
     (settings["graph_size_y"].match(/^\d+$/) ? settings["graph_size_y"] : "300")]
  end
end
