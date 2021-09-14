require "test_helper"

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "note should save with correct parameters" do
    note = User.first.notes.build(title: 'Testing', body: 'Testing')
    assert note.save, "Note did not save with correct parameters."
  end

  test "note should save with 30 chars in title" do
    title = ''
    30.times { title += 'a' }
    note = User.first.notes.build(title: title, body: 'Testing')
    assert note.save, "Note did not save with 30 chars in title."
  end

  test "note should not save with 31 chars in title" do
    title = ''
    31.times { title += 'a' }
    note = User.first.notes.build(title: title, body: 'Testing')
    assert_not note.save, "Note did save with 31 chars in title."
  end

  test "note should save with 1000 chars in title" do
    body = ''
    1000.times { body += 'a' }
    note = User.first.notes.build(title: 'Test', body: body)
    assert note.save, "Note did not save with 1000 chars in body."
  end

  test "note should not save with 1001 chars in title" do
    body = ''
    1001.times { body += 'a' }
    note = User.first.notes.build(title: 'Test', body: body)
    assert_not note.save, "Note did save with 1001 chars in body."
  end

  test "note should default title to first 30 chars of body if nil" do
    body = ''
    31.times { body += 'a' }
    note = User.first.notes.build(title: nil, body: body)
    assert note.save, "Note did not default witle with 30 chars in body if title is nil."
    assert_equal 30, note.title.length, "Note title length was #{note.title.length}"
  end

  test "note should default title to first 30 chars of body if empty string" do
    body = ''
    31.times { body += 'a' }
    note = User.first.notes.build(title: '', body: body)
    assert note.save, "Note did not default witle with 30 chars in body if title is nil."
    assert_equal 30, note.title.length, "Note title length was #{note.title.length}"
  end

  test "note should not save without user" do
    note = Note.new(title: 'test', body: 'test')
    assert_not note.save, "Note saved without User."
  end

  test "empty note should not save with empty string" do
    note = User.first.notes.build(title: '', body: '')
    assert_not note.save, "Note saved with empty string."
  end

  test "empty note should not save with nil" do
    note = Note.new()
    assert_not note.save, "Note saved with nil."
  end

  test "empty note should save after change" do
    note = User.first.notes.build(title: '', body: '')
    assert_not note.save
    note.title = 'New note'
    note.body = 'new note'
    assert note.save, "Note saved after changes to title and body"
  end

end
