require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h1", text: "Rooms"
  end

  test "creating a Room" do
    visit rooms_url
    click_on "New Room"

    fill_in " cap", with: @room. cap
    fill_in "Building", with: @room.building
    check "Comp avail" if @room.comp_avail
    fill_in "Dept", with: @room.dept
    check "Food" if @room.food
    fill_in "Number", with: @room.number
    fill_in "Room type", with: @room.room_type
    fill_in "Seat avail", with: @room.seat_avail
    fill_in "Seat type", with: @room.seat_type
    click_on "Create Room"

    assert_text "Room was successfully created"
    click_on "Back"
  end

  test "updating a Room" do
    visit rooms_url
    click_on "Edit", match: :first

    fill_in " cap", with: @room. cap
    fill_in "Building", with: @room.building
    check "Comp avail" if @room.comp_avail
    fill_in "Dept", with: @room.dept
    check "Food" if @room.food
    fill_in "Number", with: @room.number
    fill_in "Room type", with: @room.room_type
    fill_in "Seat avail", with: @room.seat_avail
    fill_in "Seat type", with: @room.seat_type
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back"
  end

  test "destroying a Room" do
    visit rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room was successfully destroyed"
  end
end
