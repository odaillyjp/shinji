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
  # 旧字・新字リストが置いてあるディレクトリのパス
  CONFIG_DIR = File.expand_path('../../config', __FILE__)
  # 旧字・新字リストファイル名
  KANJI_LIST_FILE = 'kanji_list'

  @@shin_kanji = nil
  @@kyu_kanji = nil

  module_function

  def to_shinji(str)
    # 旧字・新字リストファイルを読み込んでいないならば、読み込み処理を行う
    load_shinji_list if @@shin_kanji.nil? && @@kyu_kanji.nil?

    # 新字を旧字に変換する
    str.tr(@@kyu_kanji, @@shin_kanji)
  end

  def to_kyuji(str)
    # 旧字・新字リストファイルを読み込んでいないならば、読み込み処理を行う
    load_shinji_list if @@shin_kanji.nil? && @@kyu_kanji.nil?

    # 旧字を新字に変換する
    str.tr(@@shin_kanji, @@kyu_kanji)
  end

  def load_shinji_list
    # 旧字・新字リストファイルの読み込み処理
    File.open("#{CONFIG_DIR}/#{KANJI_LIST_FILE}") do |file|
      file_data = file.read.split("\n")
      file_data.map! { |str| str.delete("\s").split(":") }
      kyu_kanji, shin_kanji = file_data.transpose
      @@kyu_kanji = kyu_kanji.join
      @@shin_kanji = shin_kanji.join
    end
  end
end
