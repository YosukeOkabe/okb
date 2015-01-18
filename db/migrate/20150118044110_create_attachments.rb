class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :memo_id
      t.string :name
      t.integer :size
      t.string :content_type
      t.binary :content

      t.timestamps
    end
  end
end
