module ConfigurationHelper
  DMCONF = YAML.load_file("spec/digital_measures.yml")
  
  def dm_server
    DMCONF['test']['server']
  end
  
  def dm_headers
    DMCONF['test']['headers']
  end
  
  def dm_user
    DMCONF['test']['user']
  end
  
  def dm_password
    DMCONF['test']['password']
  end
  
  def dm_userpwd
    "#{dm_user}:#{dm_password}"
  end
end