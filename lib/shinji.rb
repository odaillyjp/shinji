# encoding: utf-8
require "shinji/version"

class String
  def shinji
    Shinji::to_shinji self
  end

  def kyuji
    Shinji::to_kyuji self
  end
end

module Shinji
  CONFIG_DIR = File.expand_path('../../config', __FILE__)

  @@shin_kanji = nil
  @@kyu_kanji = nil

  module_function

  def to_shinji(str)
    load_shinji_list if @@shin_kanji.nil? && @@kyu_kanji.nil?

    str.tr(@@kyu_kanji, @@shin_kanji)
  end

  def to_kyuji(str)
    load_shinji_list if @@shin_kanji.nil? && @@kyu_kanji.nil?

    str.tr(@@shin_kanji, @@kyu_kanji)
  end

  def load_shinji_list
    File.open("#{CONFIG_DIR}/shinji_list") do |file|
      file_data = file.read.split("\n")
      file_data.map! { |str| str.delete("\s").split(":") }
      kyu_kanji, shin_kanji = file_data.transpose
      @@shin_kanji = shin_kanji.join
      @@kyu_kanji = kyu_kanji.join
    end
  end
end
