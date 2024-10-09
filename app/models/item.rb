class Item < ApplicationRecord
  @@OP_CODES = {'create'=>'C', 'update'=>'U', 'destroy'=>'D'}
  def archive(action_name,engine,items_hist_id=nil)




    if engine=='AR'
      parent_hist = ItemsHist.where('refid=? AND items_id=?', '*',self.id).first
      if parent_hist.blank?
        nil
      else
        parent_hist.refid = nil
        parent_hist.save!
        items_hist_id = parent_hist.id
      end
      n=ItemsHist.create(items_id: self.id, f1: self.f1, f2: self.f2, f3: self.f3, items_created_at: self.created_at, items_updated_at: ((action_name == 'destroy')? DateTime.now : self.updated_at), op_hist: @@OP_CODES[action_name], engine: engine, items_hist_id: items_hist_id, refid: '*' ).save!
    end
  end
end
