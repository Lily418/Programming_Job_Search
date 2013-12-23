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

ActiveRecord::Schema.define(version: 20131222220553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: true do |t|
    t.text   "text"
    t.string "id_source"
  end

  add_index "listings", ["id_source"], name: "index_listings_on_id_source", unique: true, using: :btree

  create_table "skill_listing_links", force: true do |t|
    t.integer "listing_id"
    t.integer "skill_id"
  end

  create_table "skills", force: true do |t|
    t.text    "skill"
    t.integer "count"
  end

  add_index "skills", ["skill"], name: "index_skills_on_skill", unique: true, using: :btree

end
