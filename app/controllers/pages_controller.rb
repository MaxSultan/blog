class PagesController < ApplicationController
  def index
    puts "in index method yo"
    @pages = Page.all # controller is interacting with model

    #although we dont code anything  rais automatically does this for us
    # rails is going to look for  index.html.erb in the views/pages folder
  end

  def show
    #find a page but we need the page id
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    # go to a folder and look for views/pages/new.html
  end

  def create
    # new doesnt write an object to the database it just creates an instance of the object
    @page = Page.new(pages_params)
    if @page.save
      redirect_to pages_path
    else 
      render :new
    end 
    # params[:page] gives me the form field
    #this would work but anytime we get input from a user weve got to be carefule about what they put in
   #Page.create(title: params[:page][:title])
  end 

  private

  def pages_params
    params.require(:page).permit(:title, :author, :body)
  end

end
