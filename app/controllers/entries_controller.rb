class EntriesController < ActionController
  before_action :find_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @entries = Entry.all
  end

  def show
    authorize @entry
  end

  def new
    @entry = Entry.new
    authorize @entry
  end

  def create
    @entry = Entry.new(entry_params)
    authorize @entry
    @entry.user = current_user
    if @entry.save
      redirect_to entries_path, notice: 'Entry created'
    else
      redirect_to entries_path, alert: 'Error while creating entry'
    end
  end

  def edit
    authorize @entry
  end

  def update
    authorize @entry
    if @entry.update_attributes(entry_params)
      redirect_to entries_path, notice: 'Entry, updated'
    else
      redirect_to entries_path, alert: 'Error while updating entry'
    end
  end

  def destroy
    authorize @entry
    @entry.destroy
    redirect_to entries_path, notice: 'Entry deleted'
  end

  private

  def find_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :content, :published)
  end
end
