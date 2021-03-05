# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    'gem install rails' 'rails new hedges-work-order-hub'

- [x] Include at least one has_many relationship
    'Building, Apartment, Tenant'

- [x] Include at least one belongs_to relationship
    'Apartment belongs_to Building'
    'Tenant belongs_to Apartment, Building'
    'WorkOrder belongs_to Tenant, Apartment, StaffMember'

- [x] Include at least two has_many through relationships
    'Building has_many WorkOrders through: Tenants'
    'Apartment has_many WorkOrders through: Tenants'

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    'Building can look through Tenants to find WorkOrders & Apartment can look through Tenants to find WorkOrders too'

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) 
    creating a new work order that allows the selection of an existing tenant in a dropdown

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    StaffMember : :first_name, :last_name, :presence => true
    Tenant : :first_name, :last_name, :phone, :presence => true
    WorkOrder : :status, :content, :presence => true
    Building :

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    WorkOrder.pending_orders get '/work_orders/pending' work_orders#status_pending

- [x] Include signup
- [x] Include login 
- [x] Include logout 
- [x] Include third party signup/login
        GOOGLE
- [x] Include nested resource show or index
        /apartments/:apartment_id/work_orders/ <--index/show
- [x] Include nested resource "new" form
        /apartments/:apartment_id/work_orders/new <--new
- [x] Include form display of validation errors

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate


