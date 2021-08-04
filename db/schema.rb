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

ActiveRecord::Schema.define(version: 2021_08_04_164044) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "chinchillas", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthday"
    t.integer "sex"
    t.string "fur_type"
    t.text "introduction"
    t.string "image_id"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_chinchillas_on_owner_id"
  end

  create_table "communities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "community_members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_chinchillas", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "chinchilla_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chinchilla_id"], name: "index_favorite_chinchillas_on_chinchilla_id"
    t.index ["owner_id"], name: "index_favorite_chinchillas_on_owner_id"
  end

  create_table "favorite_posts", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_favorite_posts_on_owner_id"
    t.index ["post_id"], name: "index_favorite_posts_on_post_id"
  end

  create_table "hospital_images", force: :cascade do |t|
    t.integer "hospital_id", null: false
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_hospital_images_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "hospital_name", null: false
    t.string "address", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.text "comment", null: false
    t.float "rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.index ["owner_id"], name: "index_hospitals_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "prefecture", default: 0, null: false
    t.string "image_id"
    t.text "introduction"
    t.boolean "join_status", default: true
    t.boolean "community_reader", default: false
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "post_comments", force: :cascade do |t|
    t.text "comment", null: false
    t.integer "owner_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_post_comments_on_owner_id"
    t.index ["post_id"], name: "index_post_comments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "post_title", null: false
    t.text "post_body", null: false
    t.string "image_id", null: false
    t.integer "chinchilla_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chinchilla_id"], name: "index_posts_on_chinchilla_id"
  end

  create_table "question_comments", force: :cascade do |t|
    t.text "comment", null: false
    t.integer "owner_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_question_comments_on_owner_id"
    t.index ["question_id"], name: "index_question_comments_on_question_id"
  end

  create_table "question_images", force: :cascade do |t|
    t.string "image_id", null: false
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_images_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question_title", null: false
    t.text "question_body", null: false
    t.boolean "solution_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.index ["owner_id"], name: "index_questions_on_owner_id"
  end

end
