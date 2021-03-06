class Types::AuthorType < Types::BaseObject
  field :errors,     [Types::ErrorType], null:  false

  field :id,         ID,      null: false, description: "id, UUID"
  field :first_name, String,  null: true, description: "The first name as String"
  field :last_name,  String,  null: true, description: "The Last name as String"
  field :birth_year, Int,     null: false, description: "The year of birth as Integer"
  field :is_alive,   Boolean, null: true, description: "If is alive as Boolean"
  field :created_at, GraphQL::Types::ISO8601DateTime,  null: false, description: "Timestamp of creation"
  field :updated_at, GraphQL::Types::ISO8601DateTime,  null: false, description: "Timestamp of last update"# , camelize: false # ruby/snake case

  # Custom methods, check app/models/author.rb
  field :full_name,         String, null: false, description: "The full name"
  field :reverse_full_name, String, null: false, description: "The full name backwards"

  field :coordinates,       Types::CoordinatesType, null: false, description: "Can get the latitude and longitude"

  field :publication_years, [Int], null: false, description: "Array of publication years"

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def errors
    object.errors.map { |error| {field_name: error.attribute, errors: object.errors[error.attribute]}}
  end

  def self.authorized?(object, context)
    # !object.is_alive?
    object.is_alive?
  end

end

class Types::AuthorInputType < GraphQL::Schema::InputObject
  graphql_name "AuthorInputType"
  description "All the atributes needed to create/update an author"

  # argument :id, ID, required: false
  argument :first_name, String,  required: false
  argument :last_name,  String,  required: false
  argument :birth_year, Int,     required: false
  argument :is_alive,   Boolean, required: false
end