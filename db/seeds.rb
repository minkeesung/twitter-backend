# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Relationship.destroy_all

users = User.create!([
    {email: "a", password: "a", password_confirmation: "a"},
    {email: "b", password: "b", password_confirmation: "b"},
    {email: "c", password: "c", password_confirmation: "c"},
    {email: "d", password: "d", password_confirmation: "d"},
    {email: "e", password: "e", password_confirmation: "e"},
    ])








