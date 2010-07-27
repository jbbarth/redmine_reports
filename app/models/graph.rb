class Graph < ActiveRecord::Base
  unloadable

  SOURCE_TYPES = %w(text)

  def eval_source
    case type.to_sym
    when :text
      source
    else
      raise "Unsupported type. How did you introduce this into the database ?"
    end
  end
end
