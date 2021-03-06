
class Summon::Document < Summon::Schema
  attr :id, :json_name => "ID"
  attr :title
  attr :subtitle
  attr :publication_title
  attr :publication_series_title
  attr :content_type

  attr :authors, :json_name => "Author"
  attr :corporate_authors, :json_name => "CorporateAuthor"
  attr :publishers, :json_name => "Publisher"
  attr :volume
  attr :issue
  attr :start_page
  attr :end_page
  attr :page_count
  attr :publication_date, :json_name => "PublicationDate_xml",  :transform => :Date
  attr :publication_place

  attr :isi_cited_references_count, :json_name => "ISICitedReferencesCount"
  attr :isi_cited_references_uri, :json_name => "ISICitedReferencesURI"
  
  attr :dissertation_advisor
  attr :dissertation_category
  attr :dissertation_degree
  attr :dissertation_degree_date
  attr :dissertation_degree_date_decade
  attr :dissertation_degree_date_century
  attr :dissertation_degree_date_year
  attr :dissertation_school
  
  attr :library
  attr :call_numbers, :json_name => "LCCallNum"
  attr :doi, :json_name => "DOI"
  attr :isbns, :json_name => "ISBN"
  attr :issns, :json_name => "ISSN"
  attr :patent_number
  attr :gov_doc_class_nums, :json_name => "GovDocClassNum"
  
  
  attr :subject_terms
  attr :genres, :json_name => "Genre"
  attr :languages, :json_name => "Language"
  
  attr :snippet #highlight
  attr :abstract
  attr :fulltext, :boolean => true, :json_name => "hasFullText"
  attr :uri, :json_name => "URI"
  attr :url
  attr :open_url
  attr :subject_terms

  attr :thumbnail_small, :json_name =>  "thumbnail_s"
  attr :thumbnail_medium, :json_name => "thumbnail_m"
  attr :thumbnail_large, :json_name =>  "thumbnail_l"
  attr :availability_id

  def isbn
    @isbns.first
  end
  
  def call_number
    @call_numbers.first
  end
  
  def gov_doc_class_num
    @gov_doc_class_nums.first
  end

  def pages?
    @start_page || @page_count
  end
  
  def publication_date
    @publication_date || Summon::Date.new({})
  end

  def publisher
    @publishers.first
  end
  
  def authors
    @authors.map {|n| Summon::Author.new(n)}
  end
  
  def corporate_authors
    @corporate_authors.map {|n| Summon::Author.new(n)}
  end
  
  def to_s(options = {})
    "Title: #{title}"
  end

  def local_content_type
    translate(@content_type)      
  end

  def from_library?
    @availability_id != nil
  end

end


class Summon::Author < Struct.new(:name)
  def name(*args)
    super()
  end
end

