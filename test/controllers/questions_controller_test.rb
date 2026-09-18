require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "keeps the previous chat until the answer is Great" do
    get answer_path, params: { question: "Can I take a break?" }
    assert_response :success

    get answer_path, params: { question: "What about tomorrow?" }
    assert_response :success
    assert_includes response.body, "Can I take a break?"
    assert_includes response.body, "What about tomorrow?"
    assert_includes response.body, "Ask!"

    get answer_path, params: { question: "I am going to work" }
    assert_response :success
    assert_includes response.body, "Can I take a break?"
    assert_includes response.body, "What about tomorrow?"
    assert_includes response.body, "Great!"
    refute_includes response.body, 'name="question"'
    assert_includes response.body, "Consult Again"
  end
end
