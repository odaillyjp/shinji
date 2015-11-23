# encoding: utf-8
require 'shinji/version'

class String
  def shinji
    Shinji::to_shinji(self)
  end

  def kyuji
    Shinji::to_kyuji(self)
  end
end

module Shinji
  CONFIG_DIR = File.expand_path('../../config', __FILE__)
  KANJI_LIST_FILE = 'kanji_list'

  @@shin_kanji = nil
  @@kyu_kanji = nil

  module_function

  # 旧漢字を新漢字に置換する
  #
  # Usage:
  #
  #   Shinji::to_kyuji('稻飮隱營榮衞驛學廣')
  #   # => 稲飲隠営栄衛駅学広
  #
  def to_shinji(str)
    load_kanji_list unless loaded_kanji_list?

    str.tr(@@kyu_kanji, @@shin_kanji)
  end

  # 新漢字を旧漢字に置換する
  #
  # Usage:
  #
  #   Shinji::to_kyuji('稲飲隠営栄衛駅学広')
  #   # => 稻飮隱營榮衞驛學廣
  #
  def to_kyuji(str)
    load_kanji_list unless loaded_kanji_list?

    str.tr(@@shin_kanji, @@kyu_kanji)
  end

  def load_kanji_list
    File.open("#{CONFIG_DIR}/#{KANJI_LIST_FILE}") do |file|
      file_data = file.read.split("\n")
      file_data.map! { |str| str.delete("\s").split(':') }
      @@kyu_kanji, @@shin_kanji = file_data.transpose.map(&:join)
    end
  end

  def loaded_kanji_list?
    @@shin_kanji && @@kyu_kanji
  end
end
