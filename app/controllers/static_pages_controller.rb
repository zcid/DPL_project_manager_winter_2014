class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def easter_egg
    @stuff = 'You found it!'
  end
end
