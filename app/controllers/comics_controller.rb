class ComicsController < ApplicationController
  before_action :set_comic, only: [:edit, :update, :destroy, :vote]
  before_action :authorized_user?, except: :index

  def index
    # gibbon = Gibbon::Request.new
    # @lists = gibbon.lists(ENV["MAILCHIMP_LIST_ID_TEST"]).members.retrieve(params: {"fields": "members.email_address"})
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
  end

  def edit
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = Comic.new(comic_params)

    respond_to do |format|
      if @comic.save
        format.html { redirect_to root_path, notice: 'Comic was successfully created.' }
        format.json { redirect_to root_path, status: :created }
      else
        format.html { render :new }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comics/1
  # PATCH/PUT /comics/1.json
  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html { redirect_to root_path, notice: 'Comic was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def vote
    has_not_voted = Vote.where(comic: @comic, user: current_user).blank? ? true : false
    if has_not_voted
      @vote = Vote.create(comic: @comic, user: current_user)
      respond_to do |format|
        format.js
      end
    else
      redirect_to root_path, alert: 'Only 1 vote.'      
    end
  end


  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic.destroy
    respond_to do |format|
      format.html { redirect_to comics_url, notice: 'Comic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comic
      @comic = Comic.find(params[:id])
    end

    def authorized_user?
      if !current_user.try(:is_admin?)
        redirect_to root_path, notice: 'Unauthorized'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comic_params
      params.require(:comic).permit(:title, :release_date, :horizontal_image, :vertical_image)
    end
end
