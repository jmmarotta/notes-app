require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @current_user = users(:one)
    @note = notes(:one)
  end

  test "should get index" do
    get notes_url
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post notes_url, params: { note: { body: @note.body, user: @note.user, title: @note.title } }
    end

    assert_redirected_to notes_url
  end

  test "should update note" do
    patch note_url(@note), params: { note: { body: @note.body, title: "updated" } }
    assert_redirected_to notes_url
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end
end
