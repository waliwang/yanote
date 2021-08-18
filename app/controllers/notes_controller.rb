class NotesController < ApplicationController
    before_action :find_note , only: [:show, :edit, :update, :destroy]

    def index
        @notes = Note.order(id: :desc)
    end

    def new
        @note = Note.new
    end

    def show
    end

    def edit
    end

    def update
        if @note.update(note_params)
        redirect_to "/notes"
        else
        render :edit
        #   redirect_to "/notes/new"
        end
    end

    def create
        @note = Note.new(note_params)

        if @note.save
          redirect_to "/notes"
        else
        render :new
        #   redirect_to "/notes/new"
        end
    end

    def destroy
        # @note.destroy
        @note.update(deleted_at: Time.now)
        redirect_to "/notes"
    end

    private
    def note_params
       #Strong Parameter
       params.require(:note).permit(:title, :content)
    end

    def find_note
        @note = Note.find(params[:id])
    end
end
