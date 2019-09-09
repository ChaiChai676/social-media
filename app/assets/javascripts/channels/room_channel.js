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
          // content.find('[data-role="file-name"]').text(data.file_name);
          content.find('[data-role="file-url"]').text(data.file_url); //.attr('src', data.file_url);
          content.find('[data-role="message-text"]').text(data.message);
          content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
          content.find('[data-role="user-first-name"]').text(data.user_first_name);

console.log(content.find('[data-role="file-name"]').text(data.file_name))

          // content.find('[data-role="message-date"]').text(data.updated_at);
          $element.append(("<a href=''></a>"));
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 500);
        }
      }
    );
  });
});
