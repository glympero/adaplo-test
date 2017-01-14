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

    # #ADD
    # email, name = 'alice@example.com', 'Alice'

    # begin
    #   CreateSend::Subscriber.add(auth, list_id, email, name, [], false)
    # rescue CreateSend::BadRequest => exception
    #   fail "could not add #{email} code=#{exception.data.Code}"
    # end

    # #REMOVE
    # email = 'alice@example.com'

    # begin
    #   CreateSend::Subscriber.new(auth, list_id, email).unsubscribe
    # rescue CreateSend::BadRequest => exception
    #   fail "could not unsubscribe #{email} code=#{exception.data.Code}"
    # end

    #client_id = "2029a93d7dcae27b1ee78eb337eba1e8"
    # @list_id = "81740a3f63f6584900137d3600ba508b"
    # @list = CreateSend::List.new @auth, @list_id

    

    # #createsend = CreateSend::CreateSend.new(auth)

    # @my_list = CreateSend::List.new auth, @list_id
    

    # @my_list = @my_list.first.Name
    # createsend.clients.each do |item|
    #   @client_name = item.Name

    #   client = CreateSend::Client.new(auth, @client_id)
      

    #   client.lists.each do |item|
    #     # puts "#{item.ListID} #{client_name} #{item.Name}"
    #   end
    end

    def add_user
      auth = {api_key: '07a50c2d0c1776b10edf3bf429810814'}
      list_id = '81740a3f63f6584900137d3600ba508b';
      email, name = params[:email], params[:name]

      begin
        CreateSend::Subscriber.add(auth, list_id, email, name, [], false)
        redirect_to root_path
      rescue CreateSend::BadRequest => exception
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
        redirect_to root_path
      rescue CreateSend::BadRequest => exception
        redirect_to root_path
        # fail "could not unsubscribe #{email} code=#{exception.data.Code}"
      end
    end
end
