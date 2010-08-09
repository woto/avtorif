class MyController < ApplicationController
  def index
    JobWalker.new.call
     # rj = ReceiveJobber.new(ReceiveJob.find(484199613))
     # rj.perform
  end
end
