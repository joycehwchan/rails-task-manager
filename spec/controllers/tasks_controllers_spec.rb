require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe '#create' do
    let(:params) { { task: { title: 'Title', details: 'Details' } } }
    before { post :create, params: params }

    it 'should save an instance of a task to db' do
      expect(Task.last.details).to eq('Details')
    end

    it 'redirects to task show_page' do
      expect(response).to redirect_to task_path(Task.last)
    end
  end
end
