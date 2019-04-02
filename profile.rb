require "bundler/setup"
require "schema_serializer"

User = Struct.new(:id, :name, :age, :gender, :email, :created_at)
User.include SchemaSerializer::Serializable
users = Array.new(10000) { |i| User.new(i.to_s, "abcdefg", rand(80).to_s, rand(2).to_s, "user#{i}@example.com", Time.now) }
SchemaSerializer.definition = {
  "User" => {
    "required"   => ["id", "name"],
    "properties" => {
      "id"         => { "type" => "integer" },
      "name"       => { "type" => "string" },
      "age"        => { "type" => "integer" },
      "gender"     => { "type" => "integer" },
      "email"      => { "type" => "string" },
      "created_at" => { "type" => "string" },
    },
  },
}

start_at = Time.now
users.each do |user|
  user.serializer.as_json
end
elapsed = Time.now - start_at
puts elapsed
