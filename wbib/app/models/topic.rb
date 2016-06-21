class Topic < ActiveRecord::Base

  # gives extra functions to interact with references (@topic.references is one)
  has_many :references, dependent: :destroy

end
