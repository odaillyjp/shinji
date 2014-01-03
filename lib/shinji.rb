# encoding: utf-8
require "shinji/version"

class String
  def shinji
    Shinji::to_shinji self
  end
end

module Shinji
  CONFIG_DIR = File.expand_path('../../config', __FILE__)

  module_function

  def to_shinji(str)
    shinji_list = File.open("#{CONFIG_DIR}/shinji_list") do |file|
      file_data = file.read.split("\n")
      file_data.map! { |str| str.delete("\s").split(":") }
      file_data.to_h
    end

    str.gsub(/./, shinji_list)
  end
end
