# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class ProxyController < ApplicationController
  def input; end

  def output
    n = params[:n]
    side = params[:side]

    xml_text = open("#{BASE_URL}?n=#{n}")

    case side
    when 'server'
      @result = transform_xml xml_text
    when 'browser'
      render xml: insert_browser_xslt(xml_text).to_xml
    else
      render xml: xml_text
    end
  end

  private

  BASE_URL = 'http://localhost:3000/palindromes/view.xml'
  XSLT_BROWSER_PATH = '/browser_transformer.xslt'
  XSLT_SERVER_TRANSFORM = "#{Rails.root}/public/server_transformer.xslt"

  def transform_xml(xml_text, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(xml_text)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(xml_text, transform: XSLT_BROWSER_PATH)
    doc = Nokogiri::XML(xml_text)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end