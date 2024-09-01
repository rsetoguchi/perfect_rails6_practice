class BooksController < ApplicationController
  # protect_form_forgery except: [:destroy] # protect_form_forgery: セキュリティトークンの検証を行わない except: 指定したアクション以外で実行
  before_action :set_book, only: [:show, :destroy] # only: 指定したアクションのみで実行
  around_action :action_logger, only: [:destroy] # around_action: アクションの前後

  def show
    @book = Book.find(params[:id]) # paramsオブジェクトを経由して取得

    respond_to do |format|
      # リクエストに応じ、2種類のフォーマットでビューのレンダリングを行う
      format.html # htmlフォーマット
      format.json # 「/books/1.json」というパスでアクセスした場合
    end
  end

  def destroy
    @book = @book.destroy
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def action_logger
    logger.info 'around_before'
    yield
    logger.info 'around_after'
  end
end
