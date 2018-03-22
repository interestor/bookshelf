class Book < ActiveRecord::Base
  def print
    "題名: #{title}, 著者:#{author}"
  end
end
