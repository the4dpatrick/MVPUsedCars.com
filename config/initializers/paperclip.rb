Paperclip::Attachment.default_options.merge!(
                                               storage: :s3,
                                               bucket: ENV['S3_BUCKET_NAME'],
                                               s3_credentials: {
                                                 access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                                 secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
                                               },
                                               url: ':s3_domain_url',
                                               path: '/:class/:attachment/:id_partition/:style/:filename'
                                             )
