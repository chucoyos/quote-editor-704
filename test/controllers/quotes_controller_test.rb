require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @quote = quotes(:first) # Reference to the first fixture quote
  end

  test "Creating a new quote" do
    # When we visit the Quotes#index page
    # we expect to see a title with the text "Quotes"
    get quotes_url
    assert_response :success
    assert_select "h1", "Quotes"

    # When we click on the link with the text "New quote"
    # we expect to land on a page with the title "New quote"
    get new_quote_url
    assert_response :success
    assert_select "h1", "New quote"

    # When we fill in the name input with "Capybara quote"
    # and we click on "Create Quote"
    post quotes_url, params: { quote: { name: "Capybara quote" } }
    assert_response :redirect
    assert_redirected_to quotes_url
    assert_equal "Quote was successfully created.", flash[:notice]
  end

  test "Showing a quote" do
    get quote_url(@quote)
    assert_response :success
    assert_select "h1", @quote.name
  end

  test "Updating a quote" do
    get quotes_url
    assert_response :success
    assert_select "h1", "Quotes"

    get edit_quote_url(@quote)
    assert_response :success
    assert_select "h1", "Edit quote"

    patch quote_url(@quote), params: { quote: { name: "Updated quote" } }
    assert_response :redirect
    assert_redirected_to quotes_url
    assert_equal "Quote was successfully updated.", flash[:notice]
  end

  test "Destroying a quote" do
    get quotes_url
    assert_response :success
    assert_select "h1", "Quotes"

    assert_difference("Quote.count", -1) do
      delete quote_url(@quote)
    end

    assert_response :redirect
    assert_redirected_to quotes_url
    assert_equal "Quote was successfully destroyed.", flash[:notice]
  end

end
