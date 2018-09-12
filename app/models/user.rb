# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :issues
  has_and_belongs_to_many :favorites, class_name: "Stop", association_foreign_key: "stop_onestop_id"
  # SL: I often forget to add the other side of an association. Great job remembering.
  has_one :preference


end
