ActiveAdmin.register Event do
  permit_params :name, :description, :date, :duration, :creator_id

  scope :all
  scope :approved
  scope :refused
  scope :wait_moderating

  action_item :approve, only: :show do
    link_to 'Approve', approve_admin_event_path(event), method: :put unless event.moderated?
  end

  action_item :refuse, only: :show do
    link_to 'Refuse', refuse_admin_event_path(event), method: :put unless event.moderated?
  end

  member_action :approve, method: :put do
    event = Event.find params[:id]
    event.update approved: true, approved_by: current_admin_user.id
    redirect_to admin_events_url
  end

  member_action :refuse, method: :put do
    event = Event.find params[:id]
    event.update approved: false, approved_by: current_admin_user.id
    redirect_to admin_events_url
  end

  
end
