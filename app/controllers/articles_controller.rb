class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :upload_image]

  respond_to :html
  #load_and_authorize_resource
  def index
    @articles = current_user.articles
    respond_with(@articles)
  end

  def show

    respond_with(@article)

  end

  def new
    @article = Article.create
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    Article.clean
    respond_with(@article)
  end

  def destroy
    @article.image = nil
    @article.destroy
    respond_with(@article)
  end

  def upload_image
    @article.image = params[:file]
    @article.save
      respond_to do |format|
        format.json {  render :json => @article }
      end
  end

  def remove_image
    @article = Article.find_by_id params[:id]
    @article.image.destroy
    @article.save
    respond_to do |format|
      format.js
      format.json {  render :json => @article }
    end
  end


  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description, :image, :status_id, :category_id, :user_id, :tag_list, :files, :created_flag)
    end
end
