require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { Task.create!(title: 'Title', details: 'A very long detail here') }

  describe '#initialize' do
    context 'when correct params are given' do
      it 'creates a task instance' do
        Task.create!(title: 'Title', details: 'A very long detail here')
        expect(task.title).to eq('Title')
      end
    end

    context 'when not given a title' do
      before { task.title = nil }
      it 'is not a valid task instance' do
        task = Task.new(details: 'A random detail')
        task.valid?
        expect(task.errors.messages).to eq({ title: ["can't be blank"] })
      end

      # it "doesn't create a task instance" do
      #   task = Task.new(details: 'A random detail')
      #   expect(task.save!).to raise_error(ActiveRecord::RecordInvalid)
      # end
    end
  end

  describe 'truncate details' do
    it 'should truncate task details to 15 chars' do
      expect(task.truncate_details).to eq('A very long deta...')
    end
  end
end
