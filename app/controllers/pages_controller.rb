require 'createsend'

class PagesController < ApplicationController
  before_action :set_api
  before_action :set_list_id, only: [:add_user, :remove_user]

  def home
    @list_id = '';
    createsend = CreateSend::CreateSend.new(@auth)
    createsend.clients.each do |item|
      client_name = item.Name
      client = CreateSend::Client.new(@auth, item.ClientID)
      client.lists.each do |item|
        @list_name = item.Name
        @list_id = item.ListID
      end
    end
  end

  def add_user
    email, name = params[:email], params[:name]

    begin
      CreateSend::Subscriber.add(@auth, @list_id, email, name, [], false)
      flash[:success] = "Subscriber added successfully"
      to_home()
    rescue CreateSend::BadRequest => exception
      flash[:danger] = exception.message
      to_home()
    end
  end

    def remove_user
      email = params[:email_remove]

      begin
        CreateSend::Subscriber.new(@auth, @list_id, email).unsubscribe
        flash[:success] = "Subscriber deleted successfully"
        to_home()
      rescue CreateSend::BadRequest => exception
        flash[:danger] = exception.message
        to_home()
      end
    end

    private
      def set_api
        @auth = {api_key: '07a50c2d0c1776b10edf3bf429810814'}
      end

      def set_list_id
        @list_id = '81740a3f63f6584900137d3600ba508b';
      end

      def to_home
        redirect_to root_path
      end
end
