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
    shin_kanji = nil
    kyu_kanji = nil

    File.open("#{CONFIG_DIR}/shinji_list") do |file|
      file_data = file.read.split("\n")
      file_data.map! { |str| str.delete("\s").split(":") }
      kyu_kanji, shin_kanji = file_data.transpose
    end

    shin_kanji = shin_kanji.join
    kyu_kanji = kyu_kanji.join

    str.tr(kyu_kanji, shin_kanji)
  end
end
