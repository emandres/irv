require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  setup do
    @vote = votes(:one)
    session[:user_id] = users(:one).id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votes)
  end

  test "should get new" do
    get :new, ballot_id: ballots(:one).id
    assert_response :success
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      b = ballots(:one)
      cr = b.candidates.map do |c|
        { 
          candidate_id: c.id,
          rank: nil
        }
      end
      post :create, vote: { ballot_id: b.id, candidate_ranks_attributes: cr }
      #debugger
    end

    assert_redirected_to vote_path(assigns(:vote))
  end

  test "should show vote" do
    get :show, id: @vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote
    assert_response :success
  end

  test "should update vote" do
    b = ballots(:one)
    cr = b.candidates.map do |c|
      { 
        candidate_id: c.id,
        rank: nil
      }
    end
    put :update, id: @vote, vote: { ballot_id: b.id, candidate_ranks_attributes: cr }
    assert_redirected_to vote_path(assigns(:vote))
  end

  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete :destroy, id: @vote
    end

    assert_redirected_to votes_path
  end
end
