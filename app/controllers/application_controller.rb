class ApplicationController < ActionController::Base
  before_action :set_randomies

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
    if resource.is_a?(User)
      admin_root_path
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    super
  end

  def set_randomies
    return if params[:controller].include?('admin')
    set_random_categories
    set_random_tags
  end

  def set_random_categories
    ids = [*1..(Category.last.id)]
    rand_index = []
    10.times { |_t| rand_index << ids.sample }
    @random_categories = Category.where(id: rand_index.uniq)
  end

  def set_random_tags
    ids = [*1..(Tag.last.id)]
    rand_index = []
    10.times { |_t| rand_index << ids.sample }
    @random_tags = Tag.where(id: rand_index.uniq)
  end
end
