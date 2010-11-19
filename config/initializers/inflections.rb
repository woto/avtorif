# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
# sun of the bitch
ActiveSupport::Inflector.inflections do |inflection|
  inflection.irregular "receive", "receives"
  #inflection.irregular "folder_receives", "folder_receives"
  #inflection.irregular "folder_receives", "folder_receives"
end