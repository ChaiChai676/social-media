$(function() {
  $('[data-channel-subscribe="room"]').each(function(index, element) {
    var $element = $(element),
        room_id = $element.data('room-id'),
        messageTemplate = $('[data-role="message-template"]')[0];

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 0)

    App.cable.subscriptions.create(
      {
        channel: "RoomChannel",
        room: room_id
      },
      {
        received: function(data) {
          var content = $(messageTemplate).clone();
          content.find('a:last').remove()
          content.find('[data-role="file-name"]').text(data.file_name);
          content.find('a.link-to-file').attr('href', data.file_url)
          content.find('[data-role="message-text"]').text(data.message);
          content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
          content.find('[data-role="user-first-name"]').text(data.user_first_name);
          content.find('[data-role="message-date"]').text(data.updated_at);

          $element.append((content));
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 500);
        }
      }
    );
  });
});
