require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @alice = users(:alice)
    @bob = users(:bob)

    @alice.attendances.create(event: events(:boring_event))
    @bob.attendances.create(event: events(:boring_event), confirmation: true)

    @alice.save
    @bob.save

  end

  teardown do
    Attendance.delete_all
  end

  test 'obtaining users who requested to join event' do
    assert_equal [@alice], events(:boring_event).unconfirmed_users
  end

  test 'obtaining users who confirmed joining the event' do
    assert_equal [@bob], events(:boring_event).confirmed_users
  end
end
