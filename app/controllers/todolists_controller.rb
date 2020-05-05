class TodolistsController < ApplicationController
   def new
  	  # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
  	  @list = List.new
   end
   def index
      @lists = List.all
   end

   def show
   	  @list = List.find(params[:id])
   end

   def edit
   	   @list = List.find(params[:id])
   end
   def update
   	   list = List.find(params[:id])
   	   list.update(list_params)
   	   redirect_to todolist_path(list.id)
   end

  # 以下を追加
   def create
  	# ストロングパラメーターを使用
     list = List.new(list_params)
   # DBへ保存する
     list.save
   # トップ画面にリダイレクト
     redirect_to todolist_path(list.id) # 詳細画面へリダイレクト
   end
   def destroy
   list = List.find(params[:id]) #データ（レコード）を1件取得
   list.destroy #データ（レコード）を削除
   redirect_to todolists_path #list一覧画面にリダイレクト
   end
   private

   def list_params
   params.require(:list).permit(:title, :body, :image)
   end


end
