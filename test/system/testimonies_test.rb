require "application_system_test_case"

class TestimoniesTest < ApplicationSystemTestCase
  setup do
    @testimony = testimonies(:one)
  end

  test "visiting the index" do
    visit testimonies_url
    assert_selector "h1", text: "Testimonies"
  end

  test "creating a Testimony" do
    visit testimonies_url
    click_on "New Testimony"

    fill_in "Content", with: @testimony.content
    click_on "Create Testimony"

    assert_text "Testimony was successfully created"
    click_on "Back"
  end

  test "updating a Testimony" do
    visit testimonies_url
    click_on "Edit", match: :first

    fill_in "Content", with: @testimony.content
    click_on "Update Testimony"

    assert_text "Testimony was successfully updated"
    click_on "Back"
  end

  test "destroying a Testimony" do
    visit testimonies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Testimony was successfully destroyed"
  end
end
