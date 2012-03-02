class Misc::DishSampleController < ApplicationController

  autocomplete :dish_sample, :title
end
