class HomeController < ApplicationController
  def index
    @comps = Composition.all
  end
end