require "application_system_test_case"

class ShopItemsTest < ApplicationSystemTestCase
  setup do
    @shop_item = shop_items(:one)
  end

  test "visiting the index" do
    visit shop_items_url
    assert_selector "h1", text: "Shop items"
  end

  test "should create shop item" do
    visit shop_items_url
    click_on "New shop item"

    fill_in "Amount", with: @shop_item.amount
    fill_in "Description", with: @shop_item.description
    fill_in "Name", with: @shop_item.name
    fill_in "Price", with: @shop_item.price
    click_on "Create Shop item"

    assert_text "Shop item was successfully created"
    click_on "Back"
  end

  test "should update Shop item" do
    visit shop_item_url(@shop_item)
    click_on "Edit this shop item", match: :first

    fill_in "Amount", with: @shop_item.amount
    fill_in "Description", with: @shop_item.description
    fill_in "Name", with: @shop_item.name
    fill_in "Price", with: @shop_item.price
    click_on "Update Shop item"

    assert_text "Shop item was successfully updated"
    click_on "Back"
  end

  test "should destroy Shop item" do
    visit shop_item_url(@shop_item)
    click_on "Destroy this shop item", match: :first

    assert_text "Shop item was successfully destroyed"
  end

  test "search with ransack" do
    get shop_item_url+ "?q[name_cont]=Chair&commit=Search"
end
end
