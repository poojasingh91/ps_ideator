class StaticPagesController < ApplicationController
def about
end
def random
    @idea= Idea.order("RAND()").first
end
end
