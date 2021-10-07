# == Schema Information
#
# Table name: artwork_shares
#
#  id        :bigint           not null, primary key
#  artist_id :integer          not null
#  viewer_id :integer          not null
#
class ArtworkShare < ApplicationRecord
  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User
end
