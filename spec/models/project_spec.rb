require 'rails_helper'

RSpec.describe Project, :type => :model do
  describe '#complete_all_tasks' do
    let(:project) { create(:project) }
    before { 2.times { create(:task, project: project ) } }

    it 'mark all tasks for a project as completed' do
      project.complete_all_tasks
      project.tasks.each do |task|
        expect(task.is_completed).to eq(true)
      end
    end
  end
end
