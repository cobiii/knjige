class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Book.select("*").joins(:chapters).where("chapters.user_id"=>current_user).all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)
    @stevilo = Chapter.where("book_id"=>@chapter.book_id).count(:id)
    @number = Book.select("chapter").where("id"=>@chapter.book_id).pluck(:chapter)
    @poglavje = Chapter.where("book_id"=>@chapter.book_id, "number"=>@chapter.number).count(:id)
    respond_to do |format|
      if(@poglavje==0)                                      ## preveri ce poglavje ze obstaja
        if @chapter.number<=@number[0] and @chapter.number>0    ## preveri ce je st poglavja vecja od dolocenih stevilo poglavij oz manj kot 0
          if @stevilo<@number[0]          ## preveri ce je stevilo poglavji za to knjigo maksimalno
            if @chapter.save
              format.html { redirect_to @chapter, notice: 'Chapter was successfully created.' }
              format.json { render :show, status: :created, location: @chapter }
            else
              format.html { render :new }
              format.json { render json: @chapter.errors, status: :unprocessable_entity }
            end
          else
            format.html { render :new }
            format.json { render json: @chapter.errors, status: :unprocessable_entity }
          end
        else
         format.html { render :new }
         format.json { render json: @chapter.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to chapters_url, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:user_id, :book_id, :text, :number)
    end
end
