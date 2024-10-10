class Item < ApplicationRecord
  @@OP_CODES = {'create'=>'C', 'update'=>'U', 'destroy'=>'D'}
  def archive(action_name,engine,items_hist_id=nil)




    if engine=='AR'
      head_hist = ItemsBranch.where('refid=? AND item_id=?', '*',self.id).take
      unless head_hist.blank?
        items_hist_id = head_hist.items_hist_id
        head_hist.delete
      end
      n = ItemsHist.create(items_id: self.id, f1: self.f1, f2: self.f2, f3: self.f3, items_created_at: self.created_at, items_updated_at: ((action_name == 'destroy')? DateTime.now : self.updated_at), op_hist: @@OP_CODES[action_name], engine: engine, items_hist_id: items_hist_id, refid: '/' )
      n.save!
      n.create_or_move_head
    end
  end
end
