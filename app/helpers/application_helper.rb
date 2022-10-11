module ApplicationHelper
  def turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end
end
