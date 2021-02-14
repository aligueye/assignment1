require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "Schedules"
  end

  test "creating a Schedule" do
    visit schedules_url
    click_on "New Schedule"

    check "Avail" if @schedule.avail
    fill_in "Building", with: @schedule.building
    fill_in "Date", with: @schedule.date
    fill_in "Number", with: @schedule.number
    fill_in "Time", with: @schedule.time
    fill_in "Type", with: @schedule.type
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "updating a Schedule" do
    visit schedules_url
    click_on "Edit", match: :first

    check "Avail" if @schedule.avail
    fill_in "Building", with: @schedule.building
    fill_in "Date", with: @schedule.date
    fill_in "Number", with: @schedule.number
    fill_in "Time", with: @schedule.time
    fill_in "Type", with: @schedule.type
    click_on "Update Schedule"

    assert_text "Schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Schedule" do
    visit schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Schedule was successfully destroyed"
  end
end
