Spree::OrdersController.class_eval do
  # 10/9/14 DH: Class method 'respond_to' which then uses the 'respond_with' method in an ApplicationController method
  # 13/9/16 DH: Overview of Rails 3 'respond_with' here:
  #             https://www.davidwparker.com/2010/03/09/api-in-rails-respond-to-and-respond-with/
  respond_to :js
  
  # 28/12/13 DH: This looked like it would work but didn't so 'params.permit(:bsc_spec)' was added to 'populate'
  #Spree::PermittedAttributes.line_item_attributes << :bsc_spec
  
  # 10/9/14 DH: Prob didn't work since latest 'Spree:OrderContents.add_to_line_item()' now has:
  #
  #             '{...}.merge ActionController::Parameters.new(options).permit(PermittedAttributes.line_item_attributes)'
  #
  #             ...which my version does not have!
end