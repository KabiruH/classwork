class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class   
  # to ensure it is a class inherited by all other active records hence not a class to be considered
end
