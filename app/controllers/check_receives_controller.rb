# encoding: utf-8

class CheckReceivesController < ApplicationController
  def index
    @result = ActiveRecord::Base.connection.execute("SELECT s.id sid, j.id jid, j.title FROM `receive_jobs` rj
      left join ftp_receives fr on fr.id = rj.receiveable_id
      left join smb_receives sr on sr.id = rj.receiveable_id
      left join email_receives er on er.id = rj.receiveable_id
      left join folder_receives flr on flr.id = rj.receiveable_id
      left join jobs j on j.jobable_id = rj.id
      left join supplier_prices sp on j.id = sp.job_id
      left join suppliers s on j.supplier_id = s.id
      where sp.id is null")
  end

end
