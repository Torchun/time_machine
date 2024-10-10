class ItemsHist < ApplicationRecord
  has_many :items_branches

  def create_or_move_head
    prev_head_rec = ItemsBranch.where(refid: '*', item_id: self.items_id)
    unless prev_head_rec.blank?
      prev_head_rec.delete_all
    end
    br = self.items_branches.new
    br.refid = '*'
    br.item_id = self.items_id
    br.save!
  end
end
