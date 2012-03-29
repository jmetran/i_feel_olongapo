class ProjectMailer < ActionMailer::Base
  default from: "otep@example.com"

  def new_project
    mail(:to => "josh_metran@yahoo.com", :subject => "New Project")
  end
end
