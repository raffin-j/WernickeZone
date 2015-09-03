# coding: utf-8
module IOFiles
  require 'yomu'
  def self.getLocalFileContent(name)
	doc = File.read name
	text = Yomu.read :text, doc
        text = cleanText(text)
  end
  def self.getFileContent(file)
    data = file.read
    text = Yomu.read :text, data
    text = cleanText(text)
  end
  def self.isImageValid?(name)
    images = [ :png, :jpg, :jpeg ]
    #Liste incomplète
    images.each do | ext |
      if name == ('.' + ext.to_s)
        return true
      end
    end
    return false
  end
  def self.isTextValid?(name)
    texts = [:doc, :docx, :xls, :xlsx, :ppt, :pptx,
             :odt, :ods, :odp, :rtf, :pdf, :txt]
    #Liste incomplète
    texts.each do | ext |
      if name == ('.' + ext.to_s)
        return true
      end
    end
    return false
  end
  def self.cleanText(text)
    prev = ""
    cleanText = ""
    text.each_char do |c|
      if (c == "\n" || c == "\r" || c == "\t" || c == "\v")
        c = ' '
      end
      if (!(prev == ' ' && c == ' '))
        cleanText << c
      end
      prev = c
    end
    return cleanText
  end
end

#How to use it
#include IOFiles
#file = File.new('machin.docx')
#content = IOFiles.getFileType(file)
#bool = IOFiles.isImageValid?(file)
#puts bool
#bool = IOFiles.isTextValid?(file)
#puts bool
