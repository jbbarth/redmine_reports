class Graph < ActiveRecord::Base
  unloadable

  belongs_to :author, :class_name => 'User'

  AVAILABLE_LANGUAGES = %w(text)

  def eval_source
    case self.language
    when "text"
      source
    else
      raise "Unsupported type. How did you introduce this into the database ?"
    end
  end
end
