// scenario 'User can see other user profile' do
//     visit('/posts')
//     click_link('jackIscool')
//     expect(page).to have_content('a cool guy')
//   end

describe("React related feature tests", function() {

  beforeEach(function() {
    cy.visit('localhost:3000/posts')
  });

  describe("Post related tests", function() {
    
  });

  describe("User related tests", function() {

  });
  
});
