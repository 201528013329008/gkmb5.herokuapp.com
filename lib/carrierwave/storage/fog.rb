CarrierWave.configure do |config|
  if EnvInq.asset_store_on?
    config.cache_dir = "#{Rails.root}/tmp/"
    config.storage = :fog

    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: EnvInq.aws_access_key_id,
        aws_secret_access_key: EnvInq.aws_secret_access_key
    }

    config.asset_host = "https://#{EnvInq.asset_host}" if EnvInq.asset_host.present?
    config.fog_directory = EnvInq.aws_s3_bucket
    config.fog_public = true
    config.fog_attributes = { cache_control: 'max-age=315576000', expires: 1.year.from_now.httpdate }
  else
    config.storage = :file
  end
end