class MyController < ApplicationController
  def index
    #JobWalker.new.call
    rj = ReceiveJobber.new(ReceiveJob.first)
    rj.perform
  end
end
