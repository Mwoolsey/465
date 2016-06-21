class Reference < ActiveRecord::Base
  belongs_to :topic
  before_validation :prefix_check

  validates :URL, :url => true 

  # the following allows for such addresses as http://
  #  with nothing following the forward slashes
  ##################################################################
  #validates_format_of :URL, :with => URI::regexp(['http','https'])

  def prefix_check
    # if the beggining already has the http orhttps then just return
    if self.URL =~ /(^http:\/\/|^https:\/\/)/i
      return
    else
      # add http:// to the beginning
      self.URL = "http://" + self.URL
    end
  end
  
end
