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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130118220811) do

  create_table "authorizations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authorizations", ["role_id"], :name => "index_authorizations_on_role_id"
  add_index "authorizations", ["user_id"], :name => "index_authorizations_on_user_id"

  create_table "ballots", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "candidate_ranks", :force => true do |t|
    t.integer  "candidate_id"
    t.integer  "vote_id"
    t.integer  "rank"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "candidate_ranks", ["candidate_id"], :name => "index_candidate_ranks_on_candidate_id"
  add_index "candidate_ranks", ["vote_id"], :name => "index_candidate_ranks_on_vote_id"

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.integer  "ballot_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "candidates", ["ballot_id"], :name => "index_candidates_on_ballot_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "ballot_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["ballot_id"], :name => "index_votes_on_ballot_id"

end
