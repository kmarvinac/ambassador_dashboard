class InvoicesController < ApplicationController
  before_action :current_user_must_be_invoice_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_invoice_user
    invoice = Invoice.find(params[:id])

    unless current_user == invoice.ambassador
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def date
    require 'date'
    @date = date.today
  end

  def index
    @q = current_user.invoices.ransack(params[:q])
      @invoices = @q.result(:distinct => true).includes(:ambassador).page(params[:page]).per(10)

    render("invoices/index.html.erb")
  end

  def show
    @invoice = Invoice.find(params[:id])

    render("invoices/show.html.erb")
  end

  def new
    @invoice = Invoice.new

    render("invoices/new.html.erb")
  end

  def create
    @invoice = Invoice.new

    @invoice.requestor_user_id = params[:requestor_user_id]
    @invoice.approver_user_id = params[:approver_user_id]
    @invoice.dollar_amount = params[:dollar_amount]
    @invoice.submitted = params[:submitted]
    @invoice.submitted_on = params[:submitted_on]
    @invoice.approved = params[:approved]
    @invoice.requestor_notes = params[:requestor_notes]

    save_status = @invoice.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/invoices/new", "/create_invoice"
        redirect_to("/invoices")
      else
        redirect_back(:fallback_location => "/", :notice => "Invoice created successfully.")
      end
    else
      render("invoices/new.html.erb")
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])

    render("invoices/edit.html.erb")
  end

  def update
    @invoice = Invoice.find(params[:id])

    # @invoice.requestor_user_id = params[:requestor_user_id]
    # @invoice.approver_user_id = params[:approver_user_id]
    @invoice.dollar_amount = params[:dollar_amount]
    # @invoice.submitted = params[:submitted]
    # @invoice.submitted_on = params[:submitted_on]
    # @invoice.approved = params[:approved]
    @invoice.requestor_notes = params[:requestor_notes]

    save_status = @invoice.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/invoices/#{@invoice.id}/edit", "/update_invoice"
        redirect_to("/invoices/#{@invoice.id}", :notice => "Invoice updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Invoice updated successfully.")
      end
    else
      render("invoices/edit.html.erb")
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])

    @invoice.destroy

    if URI(request.referer).path == "/invoices/#{@invoice.id}"
      redirect_to("/", :notice => "Invoice deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Invoice deleted.")
    end
  end
end
