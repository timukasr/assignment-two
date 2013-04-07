class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :closed, :email, :tags_attributes

  validates :name, :presence => true
  validates :email, :presence => true
  validates :title, :presence => true, :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
