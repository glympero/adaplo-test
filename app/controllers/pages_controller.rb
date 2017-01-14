require 'createsend'

class PagesController < ApplicationController

  def home
    
    auth = {api_key: '07a50c2d0c1776b10edf3bf429810814'}
    @list_id = '';

    createsend = CreateSend::CreateSend.new(auth)

    createsend.clients.each do |item|
      client_name = item.Name
      client = CreateSend::Client.new(auth, item.ClientID)
      client.lists.each do |item|
        # puts "#{item.ListID} #{client_name} #{item.Name}"
        @list_name = item.Name
        @list_id = item.ListID
      end
    end
    end

    def add_user
      auth = {api_key: '07a50c2d0c1776b10edf3bf429810814'}
      list_id = '81740a3f63f6584900137d3600ba508b';
      email, name = params[:email], params[:name]

      begin
        CreateSend::Subscriber.add(auth, list_id, email, name, [], false)
        flash[:success] = "Subscriber added successfully"
        redirect_to root_path
      rescue CreateSend::BadRequest => exception
        flash[:danger] = exception.message
        redirect_to root_path
        # fail "could not add #{email} code=#{exception.data.Code}"
      end
    end

    def remove_user
      auth = {api_key: '07a50c2d0c1776b10edf3bf429810814'}
      list_id = '81740a3f63f6584900137d3600ba508b';
      #REMOVE
      email = params[:email_remove]

      begin
        CreateSend::Subscriber.new(auth, list_id, email).unsubscribe
        flash[:success] = "Subscriber deleted successfully"
        redirect_to root_path
      rescue CreateSend::BadRequest => exception
        flash[:danger] = exception.message
        redirect_to root_path
        # fail "could not unsubscribe #{email} code=#{exception.data.Code}"
      end
    end
end
