# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161017160330) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.text     "body",       limit: 65535
    t.integer  "group_id"
    t.integer  "parent_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "visitor_id"
    t.index ["group_id", "parent_id"], name: "index_comments_on_group_id_and_parent_id_and_user_id", using: :btree
    t.index ["visitor_id"], name: "index_comments_on_visitor_id", using: :btree
  end

  create_table "gists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "caption"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "visitor_id"
    t.integer  "party_id"
    t.index ["party_id"], name: "index_gists_on_party_id", using: :btree
    t.index ["visitor_id"], name: "index_gists_on_visitor_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "party_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email"
    t.integer  "group_id"
    t.integer  "host_id"
    t.integer  "guest_id"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "guest_id"
    t.integer  "group_id"
    t.integer  "host_id"
    t.boolean  "read"
    t.integer  "invite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "visitor_id"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id", using: :btree
  end

  create_table "parties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.string   "venue"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["user_id"], name: "index_parties_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "username"
    t.string   "bio"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "group_id"
    t.integer  "host_id"
    t.boolean  "accept"
    t.string   "confirm_type"
    t.string   "rsvp"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "visitor_id"
    t.index ["visitor_id"], name: "index_reservations_on_visitor_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "visitors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "invite_id"
    t.integer  "party_id"
    t.index ["invite_id"], name: "index_visitors_on_invite_id", using: :btree
    t.index ["party_id"], name: "index_visitors_on_party_id", using: :btree
  end

  add_foreign_key "comments", "visitors"
  add_foreign_key "gists", "parties"
  add_foreign_key "gists", "visitors"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "visitors"
  add_foreign_key "reservations", "visitors"
  add_foreign_key "visitors", "invites"
  add_foreign_key "visitors", "parties"
end
