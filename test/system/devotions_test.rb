require "application_system_test_case"

class DevotionsTest < ApplicationSystemTestCase
  setup do
    @devotion = devotions(:one)
  end

  test "visiting the index" do
    visit devotions_url
    assert_selector "h1", text: "Devotions"
  end

  test "creating a Devotion" do
    visit devotions_url
    click_on "New Devotion"

    fill_in "Content", with: @devotion.content
    fill_in "Title", with: @devotion.title
    fill_in "Verse", with: @devotion.verse
    click_on "Create Devotion"

    assert_text "Devotion was successfully created"
    click_on "Back"
  end

  test "updating a Devotion" do
    visit devotions_url
    click_on "Edit", match: :first

    fill_in "Content", with: @devotion.content
    fill_in "Title", with: @devotion.title
    fill_in "Verse", with: @devotion.verse
    click_on "Update Devotion"

    assert_text "Devotion was successfully updated"
    click_on "Back"
  end

  test "destroying a Devotion" do
    visit devotions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Devotion was successfully destroyed"
  end
end
