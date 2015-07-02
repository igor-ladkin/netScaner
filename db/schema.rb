# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150702143030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interconnections", force: :cascade do |t|
    t.string   "node_port"
    t.string   "child_node_port"
    t.string   "status"
    t.time     "last_time_active"
    t.integer  "node_id"
    t.integer  "child_node_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "interconnections", ["child_node_id"], name: "index_interconnections_on_child_node_id", using: :btree
  add_index "interconnections", ["node_id"], name: "index_interconnections_on_node_id", using: :btree

  create_table "nodes", force: :cascade do |t|
    t.string   "ip_address"
    t.string   "mac_address"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "overviews", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "comment"
    t.string   "status"
    t.time     "last_time_active"
    t.integer  "node_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "overviews", ["node_id"], name: "index_overviews_on_node_id", using: :btree

  add_foreign_key "interconnections", "nodes"
  add_foreign_key "interconnections", "nodes", column: "child_node_id"
  add_foreign_key "overviews", "nodes"
end
