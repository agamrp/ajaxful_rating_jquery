class AjaxfulRatingGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)  
  include Rails::Generators::Migration
  
  def initialize(runtime_args, runtime_options = {})
    super
      
    # if there's no user model
    model_file = File.join('app/models', "#{file_path}.rb")
    raise "User model (#{model_file}) must exist." unless File.exists?(model_file)
  end
  
  def files
    class_collisions 'Rate'
    template 'model.rb', File.join('app/models', 'rate.rb')
    migration_template 'migration.rb', 'db/migrate/create_rates.rb'
    
    # style
    empty_directory 'public/images/ajaxful_rating'
    
    copy_file 'images/star.png', 'public/images/ajaxful_rating/star.png'
    copy_file 'images/star_medium.png', 'public/images/ajaxful_rating/star_medium.png'
    copy_file 'images/star_small.png', 'public/images/ajaxful_rating/star_small.png'
    copy_file 'style.css', 'public/stylesheets/ajaxful_rating.css'
  end
end
