require 'spec_helper'

describe 'order_content' do

  #it "can add curtain spec of 'width=144,drop=69,lining=cotton,heading=pencil pleat'", :js => true do |example|
  it "can add curtain spec of 'width=144,drop=69,lining=cotton,heading=pencil pleat'" do |example|
    puts "\n\n--TEST--\n\"#{example.description}\" <<."

    #Capybara.default_driver = :selenium
    Capybara.current_driver = :webkit
    Capybara.javascript_driver = :webkit

    visit "/products/oasis"
    
    #expect(page).to have_content "OASIS"
    string = "oasis"
    expect(page.body).to match(%r{#{string}}i)
    
    fill_in('width', :with => '144')
    fill_in('drop', :with => '69')
    
    # Select it and then another field to active 'onBlur'
    find(:id, 'drop').click
    find_field('lining').click
    
    showSpecPrice
    
    check_alert("You need to accept that measurements are 'cm'") {find(:id, 'add-to-cart-button').click}
    check('cm_measurements')
    
    find(:id, 'add-to-cart-button').click
    
    # 21/7/14 DH: Need to sleep for 3 secs to allow AJAX to alter link text
    sleep 3
    expect(find(:id, 'page-link-to-cart').text).to_not eq("Cart: (Empty)")

  end

  it "can NOT add curtain spec of 'width=144,drop=69,lining=cotton,heading=pencil pleat' with hacked price" do |example|
    puts "\n\n--TEST--\n\"#{example.description}\" <<."

    Capybara.current_driver = :webkit

    visit "/products/oasis"
    
    #expect(page).to have_content "OASIS"
    string = "oasis"
    expect(page.body).to match(%r{#{string}}i)
    
    fill_in('width', :with => '144')
    fill_in('drop', :with => '69')
    
    # Select it and then another field to active 'onBlur'
    find(:id, 'drop').click
    find_field('lining').click
    
    showSpecPrice
    
    check_alert("You need to accept that measurements are 'cm'") {find(:id, 'add-to-cart-button').click}
    check('cm_measurements')
    
    
    # Alter the correct dynamic price
    Spree::BscReq.alterDynamicPrice(-2.00)
  
    #expect(find(:id, 'add-to-cart-button').click).to raise_error "The dynamic price is incorrect"
    find(:id, 'add-to-cart-button').click
  
    # 21/7/14 DH: Need to sleep for 3 secs to allow AJAX to alter link text
    sleep 3
      
    expect(find(:id, 'page-link-to-cart').text).to eq("Cart: (Empty)")
  
    Spree::BscReq.clearDynamicPriceAlteration


  end
  

end
