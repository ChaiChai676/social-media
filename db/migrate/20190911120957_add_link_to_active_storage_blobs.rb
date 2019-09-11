class AddLinkToActiveStorageBlobs < ActiveRecord::Migration[5.2]
  def change
    add_column :active_storage_blobs, :link, :string
  end
end
