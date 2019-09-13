$(function() {
  $('[data-channel-subscribe="room"]').each(function(index, element) {
    var $element = $(element),
        room_id = $element.data('room-id'),
        messageTemplate = ('<div class="chat-message-container" data-role="message-template"><div class="row no-gutters"><div class="col-auto text-center"><div data-role="user-first-name"></div><img src="" class="avatar" alt="" data-role="user-avatar"></div><div class="col"><div class="message-content"><p class="mb-1" data-role="message-text"></p><a href="#" class="link-to-file mb-1" data-role="file-name"></a><div class="text-right" data-role="message-date"><small></small></div></div></div></div></div>');

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 0)

    App.cable.subscriptions.create(
      {
        channel: "RoomChannel",
        room: room_id
      },
      {
        received: function(data) {
          var content = $(messageTemplate).clone();
          content.find('[data-role="file-name"]').text(data.file_name);
          content.find('a.link-to-file').attr('href', data.file_url)
          content.find('[data-role="message-text"]').text(data.message);
          content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
          content.find('[data-role="user-first-name"]').text(data.user_first_name);
          content.find('[data-role="message-date"]').text(data.updated_at);
// data-roles in the view likely do nothing because the messageTemplate variable has everything
          $element.append((content));
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 500);
        }
      }
    );
  });
});
