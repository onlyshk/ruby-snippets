##
## http://stackoverflow.com/questions/842359/extending-core-ruby-classes-when-in-rails#answer-842851
##

# config/initializers/app.rb
Dir[File.join(Rails.root, "lib", "core_ext", "*.rb")].each {|l| require l }

# lib/core_ext/array.rb
class Array
  def to_sentence_with_block(*args, &block)
    if block_given?
      # do something...
      # to_sentence_without_block(*args) perhaps?
    else
      to_sentence_without_block(*args)
    end
  end
  alias_method_chain :to_sentence, :block
end
