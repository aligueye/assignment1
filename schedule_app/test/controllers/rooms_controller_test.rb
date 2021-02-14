require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = rooms(:one)
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_room_url
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post rooms_url, params: { room: {  cap: @room. cap, building: @room.building, comp_avail: @room.comp_avail, dept: @room.dept, food: @room.food, number: @room.number, room_type: @room.room_type, seat_avail: @room.seat_avail, seat_type: @room.seat_type } }
    end

    assert_redirected_to room_url(Room.last)
  end

  test "should show room" do
    get room_url(@room)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_url(@room)
    assert_response :success
  end

  test "should update room" do
    patch room_url(@room), params: { room: {  cap: @room. cap, building: @room.building, comp_avail: @room.comp_avail, dept: @room.dept, food: @room.food, number: @room.number, room_type: @room.room_type, seat_avail: @room.seat_avail, seat_type: @room.seat_type } }
    assert_redirected_to room_url(@room)
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete room_url(@room)
    end

    assert_redirected_to rooms_url
  end
end
