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
  # 旧漢字・新漢字リストが置いてあるディレクトリのパス
  CONFIG_DIR = File.expand_path('../../config', __FILE__)
  # 旧漢字・新漢字リストファイル名
  KANJI_LIST_FILE = 'kanji_list'

  @@shin_kanji = nil
  @@kyu_kanji = nil

  module_function

  def to_shinji(str)
    load_kanji_list unless loaded_kanji_list?

    # 旧漢字を新漢字に変換する
    str.tr(@@kyu_kanji, @@shin_kanji)
  end

  def to_kyuji(str)
    load_kanji_list unless loaded_kanji_list?

    # 新漢字を旧漢字に変換する
    str.tr(@@shin_kanji, @@kyu_kanji)
  end

  def load_kanji_list
    # 旧漢字・新漢字リストファイルの読み込み処理
    File.open("#{CONFIG_DIR}/#{KANJI_LIST_FILE}") do |file|
      file_data = file.read.split("\n")
      file_data.map! { |str| str.delete("\s").split(":") }
      @@kyu_kanji, @@shin_kanji = file_data.transpose.map(&:join)
    end
  end

  def loaded_kanji_list?
    @@shin_kanji && @@kyu_kanji
  end
end
